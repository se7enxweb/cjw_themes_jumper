{* v2's twig_block: one named part of the page, resolved by its block name (plan decision D-04: by name, in this
   design, not through sevenx_themes_media's tpl_block_template()). The names this design draws are listed in
   cjw_jumper.ini [LayoutSettings] TplBlockNames; the template is explayouts/tpl_block/<name>.tpl.
   The parts read the page's variables that pagelayout.tpl defines ($pl_node, $pl_root_node ...). The layout preview
   (explayouts_ui/layout_preview) draws the layout before the page layout: there they are defined here, from the
   node of $module_result.content_info that the preview sets, as pagelayout.tpl defines them. *}
{def $tb_name = first_set( $block.parameters.block_name, first_set( $block.values.block_name, '' ) )
     $tb_preview = is_set( $pl_node )|not}
{if $tb_preview}
{def $pl_site_name = ezini( 'SiteSettings', 'SiteName', 'site.ini' )
     $pl_node = false()
     $pl_root_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
     $pl_large_header = false()}
{def $pl_root_depth = cond( $pl_root_node, $pl_root_node.depth, 1 )}
{if and( is_set( $module_result.content_info.node_id ), $module_result.content_info.node_id|gt( 0 ) )}
    {set $pl_node = fetch( 'content', 'node', hash( 'node_id', $module_result.content_info.node_id ) )}
{/if}
{if $pl_node}
    {set $pl_large_header = ezini( 'Header', 'LargeHeaderClasses', 'cjw_jumper.ini' )|contains( $pl_node.class_identifier )}
{/if}
{/if}
{if and( $tb_name|ne( '' ), ezini( 'LayoutSettings', 'TplBlockNames', 'cjw_jumper.ini' )|contains( $tb_name ) )}
{include uri=concat( 'design:explayouts/tpl_block/', $tb_name, '.tpl' )}
{/if}
{if $tb_preview}
{undef $pl_site_name $pl_node $pl_root_node $pl_large_header $pl_root_depth}
{/if}
{undef $tb_name $tb_preview}
