<?php
/**
 * Image handler factory of the converter cjwImagine (image.ini [cjwImagine] Handler=cjwJumperImagineImageFactory):
 * produces cjwJumperImagineImageHandler, which draws the cjw_* aliases of the design starter as v2 does.
 *
 * @copyright Copyright (C) 2026 7x and JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */
class cjwJumperImagineImageFactory extends eZImageFactory
{
    public function __construct()
    {
        parent::__construct( 'cjwimagine' );
    }

    static function produceFromINI( $iniGroup, $iniFilename = false )
    {
        return cjwJumperImagineImageHandler::createFromINI( $iniGroup, $iniFilename );
    }
}
