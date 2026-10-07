{* v2: nglayouts/themes/cjw_app/block/list/grid_tiles.html.twig and grid_tiles/*.html.twig. One item, chosen at
   random as in v2, is the large feature tile; all items follow as small tiles (one, two or three per row by their
   count), an empty tile fills an odd row, and for two to four items a tile with the parent's name fills the rest. *}
{def $lt_items = $block.values.items
     $lt_ivt = first_set( $block.item_view_type, 'tile' )
     $lt_count = $block.values.items|count
     $lt_feature = $block.values.items[rand( 0, $block.values.items|count|dec )]
     $lt_col = 'col-4'
     $lt_nested = 'col-12 one_tile-row'}
{if $lt_count|lt( 2 )}{set $lt_col = 'col-12 col-one_tile'}
{elseif $lt_count|lt( 3 )}{set $lt_col = 'col-12'}
{elseif $lt_count|lt( 5 )}{set $lt_col = 'col-6'}
{/if}
{if $lt_count|gt( 4 )}{set $lt_nested = 'col-12'}
{elseif $lt_count|gt( 2 )}{set $lt_nested = 'col-8'}
{elseif $lt_count|gt( 1 )}{set $lt_nested = 'col-4'}
{/if}
        <div class="row">
    <div class="col-single">
        <div class="single-row">
            <div class="col-12 col-one_tile {cond( $lt_count|eq( 1 ), 'feature no-tile', 'feature' )} col-{$lt_ivt|wash}">
{include uri='design:explayouts/block/list/_item.tpl' item=$lt_feature ivt=$lt_ivt block=$block}
</div>
        </div>
    </div>
            <div class="col-nested">
            <div
                class="{$lt_nested} nested-row">
{foreach $lt_items as $lt_item}
                                                            <div class="{$lt_col} col-{$lt_ivt|wash}">
{include uri='design:explayouts/block/list/_item.tpl' item=$lt_item ivt=$lt_ivt block=$block}
</div>
{/foreach}
{if and( $lt_count|lt( 6 ), array( 3, 5 )|contains( $lt_count ) )}
                        <div class="col-{cond( $lt_count|eq( 5 ), '4', '6' )} col-tile">
                            <div class="view-type-tile empty"></div>
                        </div>
{/if}
                            </div>
{if and( $lt_count|lt( 5 ), $lt_count|gt( 1 ) )}
{def $lt_parent = $lt_items[0].parent}
                <div class="col-{cond( $lt_count|lt( 3 ), '8', '4' )} filling-row">
                    <div class="col-tile">
                        <a class="tile-title" href={$lt_parent.url_alias|ezurl}
                           class="view-type-tile">{$lt_parent.name|wash}
                        </a>
                    </div>
                </div>
{undef $lt_parent}
{/if}
                    </div>
        </div>
{undef $lt_items $lt_ivt $lt_count $lt_feature $lt_col $lt_nested}
