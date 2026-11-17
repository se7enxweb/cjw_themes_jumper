{* v2: nglayouts/themes/app/block/list/grid_featured.html.twig - the first item as primary-item, the others as
   secondary-item, in the block's item view (JAC offers only overlay). *}
        <div class="grid-featured">
{foreach $block.values.items as $gf_index => $gf_item}
                <div class="item {if $gf_index|eq( 0 )}primary-item{else}secondary-item{/if}">
{include uri='design:explayouts/block/list/_item.tpl' item=$gf_item ivt=first_set( $block.item_view_type, 'overlay' ) block=$block}
                </div>
{/foreach}
        </div>
