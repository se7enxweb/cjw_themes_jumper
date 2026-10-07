<?php
/**
 * The osm_proxy module: map tiles for the Leaflet maps of the design "starter", fetched from the configured tile
 * server and cached on this installation, so no visitor address goes to the tile server.
 * The URL form of the Nexus v2 starter is kept: /osm_proxy/tiles/(get)/1?x=<x>&y=<y>&z=<z>; the short form
 * /osm_proxy/tiles/<z>/<x>/<y> works too. Settings: osm_proxy.ini.
 *
 * @copyright Copyright (C) 2026 7x and JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */

$Module = array( 'name' => 'OSM tile proxy' );

$ViewList = array();
$ViewList['tiles'] = array(
    'script' => 'tiles.php',
    'functions' => array( 'tiles' ),
    'params' => array( 'Z', 'X', 'Y' ),
    'unordered_params' => array( 'get' => 'Get' ) );

$FunctionList = array();
$FunctionList['tiles'] = array();

?>
