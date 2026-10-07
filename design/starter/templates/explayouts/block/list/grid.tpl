{* v2: nglayouts/themes/app/block/list/grid.html.twig and grid/<n>_columns.html.twig. For the item view "event"
   the intro of the items' parent comes first (teaser_intro, description). The columns follow the block parameter
   number_of_columns (2, 3, 4, 6; default 2), each column carries col-<item view type>. *}
{def $lg_ivt = first_set( $block.item_view_type, 'standard' )
     $lg_cols = first_set( $block.parameters.number_of_columns, '2' )
     $lg_container = first_set( $block.parameters.set_container, '' )|eq( '1' )
     $lg_class = 'col-sm-6 col-md-6 col-lg-6'}
{if $lg_cols|eq( '3' )}{set $lg_class = 'col-sm-6 col-md-6 col-lg-4'}
{elseif $lg_cols|eq( '4' )}{set $lg_class = 'col-sm-6 col-md-4 col-lg-3'}
{elseif $lg_cols|eq( '6' )}{set $lg_class = 'col-sm-4 col-md-3 col-lg-2'}
{elseif $lg_ivt|eq( 'event' )}{set $lg_class = 'col-12 col-sm-12 col-md-12 col-lg-6'}
{/if}
{if $lg_ivt|eq( 'event' )}
{def $lg_parent = $block.values.items[0].parent
     $lg_dm = $lg_parent.data_map}
{if $lg_container|not}
            <div class="container">
                <div class="row">
                    <div class="col-12">
{/if}
                        <div class="block-intro">
{if and( is_set( $lg_dm.teaser_intro ), $lg_dm.teaser_intro.has_content )}
                                <div class="article-intro">
                                    <div class="ezxmltext-field">{$lg_dm.teaser_intro.content.output.output_text}</div>
                                </div>
{/if}
{if and( is_set( $lg_dm.description ), $lg_dm.description.has_content )}
                                    <div class="ezxmltext-field">{$lg_dm.description.content.output.output_text}</div>
{/if}
                        </div>
{if $lg_container|not}
                    </div>
                </div>
            </div>
{/if}
{undef $lg_parent $lg_dm}
{/if}
            <div class="row">
{foreach $block.values.items as $lg_item}
<div class="{$lg_class} col-{$lg_ivt|wash}">
{include uri='design:explayouts/block/list/_item.tpl' item=$lg_item ivt=$lg_ivt block=$block}
</div>
{/foreach}
            </div>
{undef $lg_ivt $lg_cols $lg_container $lg_class}
