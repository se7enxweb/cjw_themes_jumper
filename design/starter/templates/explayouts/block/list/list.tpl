{* v2: nglayouts/themes/cjw_app/block/list/list.html.twig (macro cjw_macros.collection_list): every item in a
   .list-item of a .list-row, drawn in the block's item view type. With paged_collections enabled the rows sit in
   v2's paged collection (_paged_collection.tpl); $paged_page_only (set by cjwJumperPagedCollection) prints only
   the rows, for a later page fetched by the pager. *}
{def $ll_paged = and( first_set( $block.parameters['paged_collections:enabled'], '' )|eq( '1' ), is_set( $paged_page_only )|not )}
{if $ll_paged}{include uri='design:explayouts/block/list/_paged_collection.tpl' block=$block part='open' wrap_class=''}{/if}
{if or( $ll_paged|not, first_set( $block.parameters['paged_collections:ajax_first'], '' )|ne( '1' ) )}
        <div class="list-row">
{foreach $block.values.items as $ll_item}
                            <div class="list-item">
{include uri='design:explayouts/block/list/_item.tpl' item=$ll_item ivt=$block.item_view_type block=$block}
                                    </div>
{/foreach}
                    </div>
{/if}
{if $ll_paged}{include uri='design:explayouts/block/list/_paged_collection.tpl' block=$block part='close' wrap_class=''}{/if}
{undef $ll_paged}
