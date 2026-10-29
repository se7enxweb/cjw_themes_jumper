<?php
/**
 * The map tiles of the osm_proxy module: validation, the local tile cache and the fetch from the tile server.
 *
 * Not an open proxy: the only URL ever fetched is the configured TileServer template with three validated
 * integers put in. Tiles are cached under <cache dir>/osm_tiles/<z>/<x>/<y>.png for CacheTTL seconds; when the
 * tile server cannot be reached, an expired cached tile is sent rather than none.
 *
 * @copyright Copyright (C) 1998 - 2026 Exponential Foundation and 7x and JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */
class cjwOsmTileProxy
{
    /** The largest tile accepted from the tile server, in bytes */
    const MAX_TILE_BYTES = 1048576;

    /**
     * @return array|false array( x, y, z ) as integers, or false when a value is not a tile of zoom level z
     */
    public static function validate( $x, $y, $z )
    {
        foreach ( array( $x, $y, $z ) as $v )
        {
            if ( !is_string( $v ) && !is_int( $v ) )
                return false;
            if ( !preg_match( '/^[0-9]{1,7}$/', (string)$v ) )
                return false;
        }
        $x = (int)$x; $y = (int)$y; $z = (int)$z;
        if ( $z < self::setting( 'MinZoom', 0 ) || $z > self::setting( 'MaxZoom', 19 ) || $z > 19 )
            return false;
        $n = 1 << $z;
        if ( $x >= $n || $y >= $n )
            return false;
        return array( $x, $y, $z );
    }

    public static function cacheTTL()
    {
        return max( 3600, self::setting( 'CacheTTL', 604800 ) );
    }

    /**
     * @return array|false array( 'data' => png bytes, 'mtime' => int, 'source' => 'hit'|'miss'|'stale' )
     */
    public static function tile( $x, $y, $z )
    {
        $file = self::cacheFile( $x, $y, $z );
        $mtime = is_file( $file ) ? (int)filemtime( $file ) : 0;
        if ( $mtime && $mtime + self::cacheTTL() > time() )
        {
            $data = file_get_contents( $file );
            if ( $data !== false && $data !== '' )
                return array( 'data' => $data, 'mtime' => $mtime, 'source' => 'hit' );
        }

        $data = self::fetch( $x, $y, $z );
        if ( $data !== false )
        {
            self::store( $file, $data );
            return array( 'data' => $data, 'mtime' => time(), 'source' => 'miss' );
        }

        if ( $mtime )
        {
            $data = file_get_contents( $file );
            if ( $data !== false && $data !== '' )
                return array( 'data' => $data, 'mtime' => $mtime, 'source' => 'stale' );
        }
        return false;
    }

    public static function cacheFile( $x, $y, $z )
    {
        return eZSys::cacheDirectory() . '/osm_tiles/' . (int)$z . '/' . (int)$x . '/' . (int)$y . '.png';
    }

    protected static function fetch( $x, $y, $z )
    {
        $template = trim( (string)self::setting( 'TileServer', 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', false ) );
        if ( !preg_match( '#^https://[a-z0-9.-]+(:[0-9]+)?/#i', $template ) )
        {
            eZDebug::writeError( 'osm_proxy.ini [OsmProxy] TileServer must be an https:// URL template', __METHOD__ );
            return false;
        }
        $url = str_replace( array( '{x}', '{y}', '{z}' ), array( (int)$x, (int)$y, (int)$z ), $template );
        if ( !function_exists( 'curl_init' ) )
            return false;

        $ch = curl_init( $url );
        curl_setopt_array( $ch, array(
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_FOLLOWLOCATION => false,
            CURLOPT_CONNECTTIMEOUT => self::setting( 'ConnectTimeout', 5 ),
            CURLOPT_TIMEOUT => self::setting( 'Timeout', 10 ),
            CURLOPT_USERAGENT => self::userAgent(),
            CURLOPT_HTTPHEADER => array( 'Accept: image/png' ),
            CURLOPT_SSL_VERIFYPEER => true,
        ) );
        if ( defined( 'CURLOPT_PROTOCOLS' ) )
            curl_setopt( $ch, CURLOPT_PROTOCOLS, CURLPROTO_HTTPS );
        $data = curl_exec( $ch );
        $status = (int)curl_getinfo( $ch, CURLINFO_HTTP_CODE );
        $error = curl_error( $ch );
        unset( $ch );

        if ( $data === false || $status !== 200 )
        {
            eZDebug::writeWarning( "Tile $z/$x/$y: HTTP $status $error", __METHOD__ );
            return false;
        }
        // a PNG and nothing else
        if ( strlen( $data ) > self::MAX_TILE_BYTES || strncmp( $data, "\x89PNG\r\n\x1a\n", 8 ) !== 0 )
        {
            eZDebug::writeWarning( "Tile $z/$x/$y: not a PNG", __METHOD__ );
            return false;
        }
        return $data;
    }

    protected static function store( $file, $data )
    {
        $dir = dirname( $file );
        if ( !is_dir( $dir ) )
            eZDir::mkdir( $dir, false, true );
        $tmp = $file . '.' . getmypid() . '.' . mt_rand() . '.tmp';
        if ( @file_put_contents( $tmp, $data ) === false )
            return false;
        @chmod( $tmp, self::fileMode( octdec( eZINI::instance()->variable( 'FileSettings', 'StorageFilePermissions' ) ) ) );
        if ( !@rename( $tmp, $file ) )
        {
            @unlink( $tmp );
            return false;
        }
        return true;
    }

    /**
     * The mode $mode within the limit for new files the kernel sets (EZP_FILE_MODE_MAX in config.php, see
     * eZFile::fileMode()): never wider, and without a limit exactly $mode. On a kernel without that helper
     * (Exponential before 6.0.15) $mode as it is.
     *
     * @param int $mode
     * @return int
     */
    protected static function fileMode( $mode )
    {
        return method_exists( 'eZFile', 'fileMode' ) ? eZFile::fileMode( $mode ) : $mode;
    }

    protected static function userAgent()
    {
        $ua = trim( (string)self::setting( 'UserAgent', '', false ) );
        if ( $ua !== '' )
            return $ua;
        $site = eZINI::instance()->variable( 'SiteSettings', 'SiteURL' );
        return 'Exponential osm_proxy (cjw_themes_jumper; ' . $site . ')';
    }

    protected static function setting( $name, $default, $int = true )
    {
        $ini = eZINI::instance( 'osm_proxy.ini' );
        if ( !$ini->hasVariable( 'OsmProxy', $name ) )
            return $default;
        $value = $ini->variable( 'OsmProxy', $name );
        return $int ? (int)$value : $value;
    }
}

?>
