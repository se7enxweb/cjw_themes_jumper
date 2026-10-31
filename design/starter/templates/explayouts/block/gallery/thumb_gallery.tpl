{* v2: the thumb_gallery block of the standard layouts blocks as v2 renders it: the large swiper (gallery-top) and the
   thumbnail swiper (gallery-thumbs); each item is drawn twice in its item view, with image_type main and thumb. *}
{if and( is_set( $block.values.items ), $block.values.items|count|gt( 0 ) )}
{def $tg_ivt = first_set( $block.item_view_type, 'gallery_thumb' )
     $tg_p = $block.parameters}
        <div class="thumb-swiper">
            <div class="gallery-top swiper swiper-container"
                data-effect="{first_set( $tg_p.transition, 'slide' )|wash}"
                data-length="{$block.values.items|count}"
                {if first_set( $tg_p.infinite_loop, '' )|eq( '1' )}data-loop="true"{/if}                {if first_set( $tg_p.autoplay, '' )|eq( '1' )}data-autoplay="{first_set( $tg_p.autoplay_time, '' )|wash}"{/if}            >
                <div class="swiper-wrapper">
{foreach $block.values.items as $tg_entry}
                                            <div class="swiper-slide">
{include uri='design:explayouts/block/list/_item.tpl' item=$tg_entry.node ivt=$tg_ivt block=$block image_type='main'}
                        </div>
{/foreach}
                </div>
{if first_set( $tg_p.next_and_previous, '' )|eq( '1' )}
                                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
{/if}
                            </div>
            <div class="swiper swiper-container gallery-thumbs">
                <div class="swiper-wrapper">
{foreach $block.values.items as $tg_entry}
                                            <div class="swiper-slide">
{include uri='design:explayouts/block/list/_item.tpl' item=$tg_entry.node ivt=$tg_ivt block=$block image_type='thumb'}
                        </div>
{/foreach}
                </div>
            </div>
        </div>
{undef $tg_ivt $tg_p}
{/if}
