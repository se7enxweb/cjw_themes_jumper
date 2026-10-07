{* The page layout of the design "starter". v2: themes/cjw_app/pagelayout.html.twig.
   Wave 0: the document head (styles, scripts, meta) and the page frame; the page chrome follows in wave 1.
   No siteaccess name appears in this design (owner decision Q6): the same design runs as "site" elsewhere.

   Variables of the page (v2: themes/app/pagelayout_variables.html.twig), prefixed pl_ and defined here because
   the included templates see the variables of this one, not those an include defines:
   $pl_site_name   the site name ([SiteSettings] SiteName)
   $pl_node        the node of a content view, else false
   $pl_root_node   the root node of the siteaccess ([NodeSettings] RootNode of content.ini)
   $pl_root_depth  its depth
   $pl_is_landing  true on ng_landing_page and ng_frontpage (v2: <div id="page" class="landing">) *}
{def $pl_site_name = ezini( 'SiteSettings', 'SiteName', 'site.ini' )
     $pl_node = false()}
{if and( is_array( $module_result.content_info ), is_set( $module_result.content_info.node_id ), $module_result.content_info.node_id|gt( 0 ) )}
    {set $pl_node = fetch( 'content', 'node', hash( 'node_id', $module_result.content_info.node_id ) )}
{/if}
{def $pl_root_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )}
{def $pl_root_depth = cond( $pl_root_node, $pl_root_node.depth, 1 )
     $pl_is_landing = false()}
{if $pl_node}{set $pl_is_landing = array( 'ng_landing_page', 'ng_frontpage' )|contains( $pl_node.class_identifier )}{/if}
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
    <div id="main" class="clearfix">
        {$module_result.content}
    </div>
</div>

<div id="user-basket">

</div>

{include uri='design:pagelayout/cookie_control.tpl'}
{include uri='design:pagelayout/script_bottom.tpl'}
</body>
</html>
