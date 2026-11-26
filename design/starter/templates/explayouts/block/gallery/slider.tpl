{* v2: nglayouts/themes/cjw_app/block/gallery/slider.html.twig, a slick slider. Drawn even without items, as in v2 (the
   article pages carry an empty one). The Design tab's settings go into the slick settings (v2 wrote fixed ones):
   Thumbnails per row/slide side by side (two when none is stored, as in v2; at most two up to 991px wide and one up
   to 480px, as in the sushi bar), next and previous buttons (shown when the block stores nothing, as in v2),
   pagination, infinite loop (off when nothing is stored, as in v2), fade (one item per slide only) and autoplay every
   1 to 12 seconds (5 when none is stored). explayouts maps them (expLayoutsSliderSettings, the operator
   explayouts_slider_settings, explayouts 1.4.53 or later), in PHP: the slider costs no more to draw than with fixed
   settings. *}
{def $gs_settings = $block.parameters|explayouts_slider_settings( 2, 2 )}
        <div class="{$gs_settings.class}" data-slick='{$gs_settings.json}'>
{foreach first_set( $block.values.items, array() ) as $gs_entry}
{include uri='design:explayouts/block/list/_item.tpl' item=$gs_entry.node ivt=cond( first_set( $block.item_view_type, '' )|ne( '' ), $block.item_view_type, 'slide' ) block=$block}
{/foreach}
                    </div>
{undef $gs_settings}
