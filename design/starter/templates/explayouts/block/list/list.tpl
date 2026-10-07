{* v2: nglayouts/themes/cjw_app/block/list/list.html.twig (macro cjw_macros.collection_list): every item in a
   .list-item of a .list-row, drawn in the block's item view type. *}
        <div class="list-row">
{foreach $block.values.items as $ll_item}
                            <div class="list-item">
{include uri='design:explayouts/block/list/_item.tpl' item=$ll_item ivt=$block.item_view_type block=$block}
                                    </div>
{/foreach}
                    </div>
