<?php
/**
 * Image converter for the cjw_* aliases of the design starter: draws them exactly the way the Nexus v2 starter
 * draws its own aliases (Imagine 1.x with the Imagick driver behind LiipImagine, the image variations of v2's
 * image.yml), so the starter's photos have v2's sizes and v2's pixels.
 *
 * Why not the ImageMagick shell filters: Imagine computes the scaled height first, truncates it, and then scales by
 * the smaller of both ratios with round(), which gives 769 px for many "770 px wide" aliases and 480 where
 * ImageMagick's -resize gives 479; every following box on a page then moves by a pixel. v2's resampling is
 * Imagick::resizeImage with the Mitchell filter, blur 1 (the shell's -resize downscales with Lanczos): with it
 * the aliases of the starter's photos equal v2's served files pixel for pixel (mean absolute error 0.0000 on
 * all 13 photos of P6, P10 and A004, against 0.003-0.033 with Lanczos). Output: quality only, the source's
 * JPEG sampling factors kept, as Imagine does.
 *
 * Filters (image.ini, aliases cjw_*), applied in their order:
 *   cjw_imagine/scalewidthdownonly=<width>               v2 geometry/scalewidthdownonly (liip thumbnail, inset)
 *   cjw_imagine/thumbnail_outbound=<width>;<height>      v2 thumbnail { size, mode: outbound, allow_upscale }
 *   cjw_imagine/strip                                     v2 strip
 *   cjw_imagine/quality=<1-100>                           v2 filter set quality / jpeg_quality
 *
 * The handler only takes part in conversions for aliases whose name starts with "cjw_" (outputMIMEType), so the
 * aliases of every other site keep their converters.
 *
 * @copyright Copyright (C) 2026 7x and JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */
class cjwJumperImagineImageHandler extends eZImageHandler
{
    const ALIAS_PREFIX = 'cjw_';

    protected static $formats = array( 'image/jpeg' => 'jpeg', 'image/png' => 'png', 'image/gif' => 'gif', 'image/webp' => 'webp' );

    public function __construct( $handlerName, $isEnabled = true )
    {
        $filters = array();
        foreach ( array( 'scalewidthdownonly', 'thumbnail_outbound', 'strip', 'quality' ) as $name )
            $filters[] = array( 'name' => 'cjw_imagine/' . $name, 'text' => false );
        $types = array_keys( self::$formats );
        parent::__construct( $handlerName, $isEnabled, self::REPLACE_SUFFIX, $types, $types, false, $filters );
    }

    static function createFromINI( $iniGroup, $iniFilename = false )
    {
        $ini = eZINI::instance( $iniFilename ? $iniFilename : 'image.ini' );
        if ( !$ini->hasGroup( $iniGroup ) )
            return false;
        $name = $ini->hasVariable( $iniGroup, 'Name' ) ? $ini->variable( $iniGroup, 'Name' ) : $iniGroup;
        $enabled = $ini->variable( $iniGroup, 'IsEnabled' ) == 'true' && class_exists( 'Imagick' );
        return new cjwJumperImagineImageHandler( $name, $enabled );
    }

    function outputMIMEType( &$manager, $currentMimeData, $wantedMimeData, $supportedFormatsOriginal, $aliasName = false )
    {
        if ( !$this->isAvailable() || !is_string( $aliasName ) || strpos( $aliasName, self::ALIAS_PREFIX ) !== 0 )
            return false;
        return parent::outputMIMEType( $manager, $currentMimeData, $wantedMimeData, $supportedFormatsOriginal, $aliasName );
    }

    function convert( $manager, $sourceMimeData, &$destinationMimeData, $filters = false )
    {
        $input = $sourceMimeData['url'];
        if ( !file_exists( $input ) )
        {
            eZDebug::writeError( "Source image $input does not exist", __METHOD__ );
            return false;
        }
        $format = isset( self::$formats[$destinationMimeData['name']] ) ? self::$formats[$destinationMimeData['name']] : false;
        if ( !$format )
            return false;
        $steps = array();
        foreach ( ( $filters ? $filters : array() ) as $filter )
        {
            $data = isset( $filter['data'] ) && is_array( $filter['data'] ) ? array_values( $filter['data'] ) : array();
            $steps[] = array( substr( $filter['name'], strlen( 'cjw_imagine/' ) ), $data );
        }
        try
        {
            $blob = self::render( file_get_contents( $input ), $steps, $format );
        }
        catch ( ImagickException $e )
        {
            eZDebug::writeError( "Imagick failed on $input: " . $e->getMessage(), __METHOD__ );
            return false;
        }
        $output = eZImageHandler::temporaryPath( $destinationMimeData['url'] );
        if ( file_put_contents( $output, $blob ) === false || !eZImageHandler::publishTemporary( $output, $destinationMimeData['url'] ) )
        {
            eZDebug::writeError( 'Cannot write ' . $destinationMimeData['url'], __METHOD__ );
            return false;
        }
        $this->changeFilePermissions( $destinationMimeData['url'] );
        return true;
    }

    /**
     * Applies the steps to the image in $blob as Imagine/liip do and returns the encoded result.
     * $steps: list of array( <scalewidthdownonly|thumbnail_outbound|strip|quality>, array( <params> ) ).
     * No eZ classes are used here, so a test can call it without the kernel.
     */
    static function render( $blob, array $steps, $format )
    {
        $im = new Imagick();
        $im->readImageBlob( $blob );
        $quality = null;
        foreach ( $steps as $step )
        {
            list( $name, $p ) = $step;
            if ( $name === 'scalewidthdownonly' )
            {
                // liip ThumbnailFilterLoader with size [w, null], mode inset, no upscale flag
                $w = (int)$p[0];
                $ow = $im->getImageWidth();
                $oh = $im->getImageHeight();
                $h = (int)( ( $w / $ow ) * $oh );
                if ( $ow > $w || $oh > $h )
                    self::thumbnail( $im, $w, $h, false );
            }
            elseif ( $name === 'thumbnail_outbound' )
            {
                // liip ThumbnailFilterLoader with size [w, h], mode outbound, allow_upscale: true (only widens the
                // condition; Imagine gets no upscale flag)
                $w = (int)$p[0];
                $h = (int)$p[1];
                $ow = $im->getImageWidth();
                $oh = $im->getImageHeight();
                if ( $ow > $w || $oh > $h || $ow !== $w || $oh !== $h )
                    self::thumbnail( $im, $w, $h, true );
            }
            elseif ( $name === 'strip' )
            {
                $im->stripImage();
            }
            elseif ( $name === 'quality' )
            {
                $quality = (int)$p[0];
            }
        }
        $im->setImageFormat( $format );
        if ( $quality !== null )
        {
            if ( $format === 'png' )
                $quality = (int)round( ( 100 - $quality ) * 9 / 100 ) * 10 + 5;
            elseif ( $format === 'webp' )
                $quality = max( 1, min( 99, $quality ) );
            if ( $format !== 'gif' )
            {
                $im->setImageCompressionQuality( $quality );
                $im->setCompressionQuality( $quality );
            }
        }
        $out = $im->getImagesBlob();
        $im->clear();
        return $out;
    }

    /**
     * Imagine AbstractImage::thumbnail() (1.x) without the upscale flag, on an Imagick image.
     */
    protected static function thumbnail( Imagick $im, $w, $h, $outbound )
    {
        $iw = $im->getImageWidth();
        $ih = $im->getImageHeight();
        $im->stripImage();
        if ( $w === $iw && $h === $ih )
            return;
        if ( $w >= $iw && $h >= $ih )
            return;
        $rw = $w / $iw;
        $rh = $h / $ih;
        if ( $outbound )
        {
            $ratio = max( $rw, $rh );
            if ( $iw >= $w && $ih >= $h )
            {
                $iw = max( 1, (int)round( $ratio * $iw ) );
                $ih = max( 1, (int)round( $ratio * $ih ) );
                $im->resizeImage( $iw, $ih, Imagick::FILTER_MITCHELL, 1 );
                $cw = $w;
                $ch = $h;
            }
            else
            {
                $cw = min( $iw, $w );
                $ch = min( $ih, $h );
            }
            $im->cropImage( $cw, $ch, (int)max( 0, round( ( $iw - $w ) / 2 ) ), (int)max( 0, round( ( $ih - $h ) / 2 ) ) );
            $im->setImagePage( 0, 0, 0, 0 );
        }
        else
        {
            $ratio = min( $rw, $rh );
            $im->resizeImage( max( 1, (int)round( $ratio * $iw ) ), max( 1, (int)round( $ratio * $ih ) ), Imagick::FILTER_MITCHELL, 1 );
        }
    }
}
