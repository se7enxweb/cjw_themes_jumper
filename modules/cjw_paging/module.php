<?php
/**
 * The cjw_paging module: later pages of the paged Layouts list and grid blocks of the design "starter", for the
 * design's paging script (v2's nglayouts.js). See cjwJumperPagedCollection. The view needs no policy: it is in
 * [RoleSettings] PolicyOmitList of the starter siteaccesses (site.ini of settings/siteaccess/cjw_starter), and it
 * shows nothing the block does not already show on the page, to whoever may read that page.
 *
 * @copyright Copyright (C) 1998 - 2026 Exponential Foundation and 7x. All rights reserved. Copyright (C) JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */

$Module = array( 'name' => 'Paged Layouts blocks' );

$ViewList = array();
$ViewList['page'] = array(
    'script' => 'page.php',
    'params' => array( 'BlockID' ) );

$FunctionList = array();

?>
