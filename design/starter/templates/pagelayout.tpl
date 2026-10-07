{* The page layout of the design "starter". v2: themes/cjw_app/pagelayout.html.twig.
   No siteaccess name appears in this design (owner decision Q6): the same design runs as "site" elsewhere.

   Variables of the page (v2: themes/app/pagelayout_variables.html.twig), prefixed pl_ and defined here because
   the included templates see the variables of this one, not those an include defines:
   $pl_site_name   the site name ([SiteSettings] SiteName)
   $pl_node        the node of a content view, else false
   $pl_root_node   the root node of the siteaccess ([NodeSettings] RootNode of content.ini)
   $pl_root_depth  its depth
   $pl_is_landing  the node's class is a landing class (cjw_jumper.ini [Header] LandingClasses):
                   <div id="page" class="landing">, the large header, no breadcrumb
   $pl_layout      the layout drawn: the explayouts layout that applies to the page when it is one of this
                   design's ([LayoutSettings] LayoutNamePrefixes, LayoutTypes), else the chrome layout below *}
{def $pl_site_name = ezini( 'SiteSettings', 'SiteName', 'site.ini' )
     $pl_node = false()}
{if and( is_array( $module_result.content_info ), is_set( $module_result.content_info.node_id ), $module_result.content_info.node_id|gt( 0 ) )}
    {set $pl_node = fetch( 'content', 'node', hash( 'node_id', $module_result.content_info.node_id ) )}
{/if}
{def $pl_root_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )}
{def $pl_root_depth = cond( $pl_root_node, $pl_root_node.depth, 1 )
     $pl_is_landing = false()
     $pl_layout = false()}
{if $pl_node}{set $pl_is_landing = ezini( 'Header', 'LandingClasses', 'cjw_jumper.ini' )|contains( $pl_node.class_identifier )}{/if}

{* A layout of this design for the full view of a node *}
{if and( $pl_node, is_set( $module_result.content_info.viewmode ), $module_result.content_info.viewmode|eq( 'full' ) )}
    {def $pl_resolved = fetch( 'explayouts', 'resolve_layout_for_node', hash( 'node_id', $pl_node.node_id ) )}
    {if and( is_array( $pl_resolved ), ezini( 'LayoutSettings', 'LayoutTypes', 'cjw_jumper.ini' )|contains( $pl_resolved.layout_type ) )}
        {foreach ezini( 'LayoutSettings', 'LayoutNamePrefixes', 'cjw_jumper.ini' ) as $pl_prefix}
            {if and( $pl_prefix|trim|ne( '' ), $pl_resolved.name|begins_with( $pl_prefix|trim ) )}{set $pl_layout = $pl_resolved}{break}{/if}
        {/foreach}
    {/if}
    {undef $pl_resolved}
{/if}

{* Otherwise the chrome of v2's shared "Header / Footer" layout (v2 layout 2, layout_2) around the page: the
   header zone with the header and the breadcrumb, the page in the main zone (as v2's full_view block), and the
   footer zone with the pre-footer in the right column of a 50/50 two-column block and the footer. *}
{if $pl_layout|not}
    {set $pl_layout = hash(
        'id', 0, 'identifier', '', 'name', '', 'layout_type', 'layout_2',
        'zones', array(
            hash( 'identifier', 'header', 'blocks', array(
                hash( 'id', 'chrome-header', 'parent_id', 0, 'definition_identifier', 'tpl_block', 'view_type', 'tpl_block', 'parameters', hash( 'block_name', 'header' ) ),
                hash( 'id', 'chrome-breadcrumb', 'parent_id', 0, 'definition_identifier', 'tpl_block', 'view_type', 'tpl_block', 'parameters', hash( 'block_name', 'breadcrumb' ) ) ) ),
            hash( 'identifier', 'post_header', 'blocks', array() ),
            hash( 'identifier', 'main', 'blocks', array(
                hash( 'id', 'chrome-main', 'parent_id', 0, 'definition_identifier', 'full_view', 'view_type', 'full_view', 'parameters', hash() ) ) ),
            hash( 'identifier', 'pre_footer', 'blocks', array() ),
            hash( 'identifier', 'footer', 'blocks', array(
                hash( 'id', 'chrome-pre-footer', 'parent_id', 0, 'definition_identifier', 'two_columns', 'view_type', 'two_columns_50_50', 'parameters', hash( 'css_class', 'pre-footer', 'set_container', true() ) ),
                hash( 'id', 'chrome-pre-footer-text', 'parent_id', 'chrome-pre-footer', 'placeholder', 'right', 'definition_identifier', 'tpl_block', 'view_type', 'tpl_block', 'parameters', hash( 'block_name', 'pre_footer' ) ),
                hash( 'id', 'chrome-footer', 'parent_id', 0, 'definition_identifier', 'tpl_block', 'view_type', 'tpl_block', 'parameters', hash( 'block_name', 'footer' ) ) ) ) ) )}
{/if}
<!DOCTYPE html>
<html lang="{$site.http_equiv.Content-language|wash}">
<head>
    <meta charset="utf-8" />
{include uri='design:pagelayout/head/meta.tpl'}
{include uri='design:pagelayout/head/link.tpl'}
{include uri='design:pagelayout/head/style.tpl'}
{include uri='design:pagelayout/head/script.tpl'}
</head>
<body>

<div id="page"{if $pl_is_landing} class="landing"{/if}>
{include uri='design:explayouts/layout.tpl' layout=$pl_layout}
</div>

<div id="user-basket">

</div>

{include uri='design:pagelayout/cookie_control.tpl'}
{include uri='design:pagelayout/script_bottom.tpl'}
</body>
</html>
