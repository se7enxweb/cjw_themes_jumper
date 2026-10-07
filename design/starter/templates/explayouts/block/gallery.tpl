{* v2 gallery block: drawn by its view type, gallery/<view type>.tpl (carousel, grid_gallery, slider,
   thumb_gallery). The items are $block.values.items, each a hash with the node under "node". *}
{def $gb_vt = first_set( $block.view_type, '' )}
{if array( 'carousel', 'grid_gallery', 'slider', 'thumb_gallery' )|contains( $gb_vt )|not}{set $gb_vt = 'slider'}{/if}
{include uri=concat( 'design:explayouts/block/gallery/', $gb_vt, '.tpl' ) block=$block}
{undef $gb_vt}
