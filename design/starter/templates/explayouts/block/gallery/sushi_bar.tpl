{* v2: layouts-standard nglayouts/themes/standard/block/gallery/sushi_bar.html.twig - a swiper row of the items in
   the block's item view (standard_with_intro, overlay or line; nglayouts-standard.js starts it). Thumbnails per
   row/slide and Thumbnails to move fall back to the defaults of explayouts' gallery block (6 and the same number)
   when the block has none stored. Nothing is drawn without items. *}
{if and( is_set( $block.values.items ), $block.values.items|count|gt( 0 ) )}
{def $sb_p = first_set( $block.parameters, hash() )
     $sb_per_view = first_set( $sb_p.number_of_thumbnails, '' )|int}
{if $sb_per_view|lt( 1 )}{set $sb_per_view = 6}{/if}
        <div class="sushi-swiper swiper-container"
            data-effect="slide"
            data-slides-per-view="{$sb_per_view}"
            style="--sb-n: {$sb_per_view};"
            {if first_set( $sb_p.infinite_loop, '' )|eq( '1' )}data-loop="true"{/if}
            {if first_set( $sb_p.autoplay, '' )|eq( '1' )}data-autoplay="{first_set( $sb_p.autoplay_time, '5' )|wash}"{/if}
            {if first_set( $sb_p.thumbnails_to_move, '' )|int|gt( 0 )}data-slides-per-group="{$sb_p.thumbnails_to_move|int}"{/if}
        >
            <div class="swiper-wrapper">
{foreach $block.values.items as $sb_entry}
                    <div class="swiper-slide">
{include uri='design:explayouts/block/list/_item.tpl' item=$sb_entry.node ivt=first_set( $block.item_view_type, 'standard_with_intro' ) block=$block}
                    </div>
{/foreach}
            </div>
{if first_set( $sb_p.show_pagination, '' )|eq( '1' )}
                <div class="swiper-pagination"></div>
{/if}
{if first_set( $sb_p.next_and_previous, '' )|eq( '1' )}
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
{/if}
        </div>
{undef $sb_p $sb_per_view}
{/if}
