<?php
/**
 * osm_proxy/tiles: one map tile as image/png, from the local cache or the configured tile server.
 * Input: x, y, z from the query string (v2 form) or the path (/osm_proxy/tiles/<z>/<x>/<y>). Anything else is
 * a 400. The tile is sent and the request ends here (no page layout).
 *
 * @copyright Copyright (C) 1998 - 2026 Exponential Foundation and 7x. All rights reserved. Copyright (C) JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */

$http = eZHTTPTool::instance();
$raw = array();
foreach ( array( 'x' => 'X', 'y' => 'Y', 'z' => 'Z' ) as $name => $param )
{
    $value = isset( $Params[$param] ) && $Params[$param] !== false && $Params[$param] !== '' ? $Params[$param] : null;
    if ( $value === null && $http->hasGetVariable( $name ) )
        $value = $http->getVariable( $name );
    $raw[$name] = $value;
}

$tile = cjwOsmTileProxy::validate( $raw['x'], $raw['y'], $raw['z'] );
$result = $tile ? cjwOsmTileProxy::tile( $tile[0], $tile[1], $tile[2] ) : false;

if ( !$tile )
{
    header( 'HTTP/1.1 400 Bad Request', true, 400 );
    header( 'Content-Type: text/plain; charset=utf-8' );
    header( 'Cache-Control: no-store' );
    echo "Bad tile coordinates\n";
}
elseif ( !$result )
{
    header( 'HTTP/1.1 502 Bad Gateway', true, 502 );
    header( 'Content-Type: text/plain; charset=utf-8' );
    header( 'Cache-Control: no-store' );
    echo "Tile not available\n";
}
else
{
    $ttl = cjwOsmTileProxy::cacheTTL();
    header( 'Content-Type: image/png' );
    header( 'Content-Length: ' . strlen( $result['data'] ) );
    header( 'Cache-Control: public, max-age=' . $ttl );
    header( 'Expires: ' . gmdate( 'D, d M Y H:i:s', time() + $ttl ) . ' GMT' );
    header( 'Last-Modified: ' . gmdate( 'D, d M Y H:i:s', $result['mtime'] ) . ' GMT' );
    header( 'X-Tile-Cache: ' . $result['source'] );
    echo $result['data'];
}

// Under Velocity this ends the request by throwing: never inside a try/catch.
eZExecution::cleanExit();

?>
