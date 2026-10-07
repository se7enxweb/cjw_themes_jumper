{* v2: nglayouts/themes/cjw_app/block/gallery/grid_gallery.html.twig. The intro of the items' parent (teaser_intro,
   description), then the items in a flex row, number_of_thumbnails per row (the width printed as v2's PHP did). *}
{if and( is_set( $block.values.items ), $block.values.items|count|gt( 0 ) )}
{def $gg_n = first_set( $block.parameters.number_of_thumbnails, '' )|int
     $gg_widths = hash( 1, '100', 2, '50', 3, '33.333333333333', 4, '25', 5, '20', 6, '16.666666666667', 7, '14.285714285714', 8, '12.5', 9, '11.111111111111', 10, '10', 12, '8.3333333333333' )
     $gg_dm = $block.values.items[0].node.parent.data_map}
{if $gg_n|lt( 1 )}{set $gg_n = 3}{/if}
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="block-intro">
{if and( is_set( $gg_dm.teaser_intro ), $gg_dm.teaser_intro.has_content )}
                            <div class="article-intro">
                                <div class="ezxmltext-field">{$gg_dm.teaser_intro.content.output.output_text}</div>
                            </div>
{/if}
{if and( is_set( $gg_dm.description ), $gg_dm.description.has_content )}
                            <div class="ezxmltext-field">{$gg_dm.description.content.output.output_text}</div>
{/if}
                    </div>
                </div>
            </div>
        </div>

        <div class="flex-row nglayouts-flex-row {if first_set( $block.parameters.enable_lightbox, '' )|eq( '1' )}js-lightbox-enabled{/if}">
{foreach $block.values.items as $gg_entry}
                            <div class="nglayouts-as-flex" style="width:{first_set( $gg_widths[$gg_n], 100|div( $gg_n ) )}%">{include uri='design:explayouts/block/list/_item.tpl' item=$gg_entry.node ivt=first_set( $block.item_view_type, 'gallery_grid' ) block=$block}</div>
{/foreach}
        </div>
{undef $gg_n $gg_widths $gg_dm}
{/if}
