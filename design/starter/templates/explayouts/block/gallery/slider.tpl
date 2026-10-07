{* v2: nglayouts/themes/cjw_app/block/gallery/slider.html.twig. Drawn even without items, as in v2 (the article
   pages carry an empty one). *}
        <div class="slick-slider" data-slick='{ldelim} "slidesToShow": 2, "infinite": false, "responsive": [ {ldelim} "breakpoint": 480, "settings": {ldelim} "slidesToShow": 1 {rdelim} {rdelim} ] {rdelim}'>
{foreach first_set( $block.values.items, array() ) as $gs_entry}
{include uri='design:explayouts/block/list/_item.tpl' item=$gs_entry.node ivt=first_set( $block.item_view_type, 'slide' ) block=$block}
{/foreach}
                    </div>
