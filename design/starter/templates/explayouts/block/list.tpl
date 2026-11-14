{* v2 list block (the layouts "list" block): drawn by its view type, list/<view type>.tpl (list, grid, grid_tiles,
   list_numbered; list_zigzag and list_accordion from explayouts, as the media design draws them). An unknown view
   type falls back to the plain list. Nothing is drawn without items, as in v2. *}
{def $lb_vt = first_set( $block.view_type, '' )}
{if array( 'list', 'grid', 'grid_tiles', 'list_numbered', 'list_zigzag', 'list_accordion' )|contains( $lb_vt )|not}{set $lb_vt = 'list'}{/if}
{if and( is_set( $block.values.items ), $block.values.items|count|gt( 0 ) )}
{include uri=concat( 'design:explayouts/block/list/', $lb_vt, '.tpl' ) block=$block}
{/if}
{undef $lb_vt}
