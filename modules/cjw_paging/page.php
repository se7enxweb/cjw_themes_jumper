<?php
/**
 * cjw_paging/page/<block id>?node_id=<node>&page=<n>: the items of page <n> of a paged Layouts block, as an HTML
 * fragment (no page layout). An unknown block, node or page is an empty 200 answer, as the v2 route gives for a
 * page past the end.
 *
 * @copyright Copyright (C) 1998 - 2026 Exponential Foundation and 7x. All rights reserved. Copyright (C) JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */

$http = eZHTTPTool::instance();
$html = cjwJumperPagedCollection::render(
    isset( $Params['BlockID'] ) ? $Params['BlockID'] : 0,
    $http->hasGetVariable( 'node_id' ) ? $http->getVariable( 'node_id' ) : 0,
    $http->hasGetVariable( 'page' ) ? $http->getVariable( 'page' ) : 1 );

header( 'Content-Type: text/html; charset=utf-8' );
header( 'Cache-Control: no-cache, must-revalidate' );
header( 'X-Robots-Tag: noindex, nofollow' );
echo $html;

// Under Velocity this ends the request by throwing: never inside a try/catch.
eZExecution::cleanExit();

?>
