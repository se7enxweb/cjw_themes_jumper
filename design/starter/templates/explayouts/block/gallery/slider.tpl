{* v2: nglayouts/themes/cjw_app/block/gallery/slider.html.twig, a slick slider. Drawn even without items, as in v2 (the
   article pages carry an empty one). Thumbnails per row/slide sets the items shown side by side (v2 showed two, which
   stay when none is stored), at most two up to 991px wide and one up to 480px, as in the sushi bar. *}
{def $gs_n = first_set( $block.parameters.number_of_thumbnails, '' )|int}
{if $gs_n|lt( 1 )}{set $gs_n = 2}{/if}
{def $gs_n_md = min( $gs_n, 2 )}
        <div class="slick-slider" data-slick='{ldelim} "slidesToShow": {$gs_n}, "infinite": false, "responsive": [ {ldelim} "breakpoint": 991, "settings": {ldelim} "slidesToShow": {$gs_n_md} {rdelim} {rdelim}, {ldelim} "breakpoint": 480, "settings": {ldelim} "slidesToShow": 1 {rdelim} {rdelim} ] {rdelim}'>
{foreach first_set( $block.values.items, array() ) as $gs_entry}
{include uri='design:explayouts/block/list/_item.tpl' item=$gs_entry.node ivt=cond( first_set( $block.item_view_type, '' )|ne( '' ), $block.item_view_type, 'slide' ) block=$block}
{/foreach}
                    </div>
{undef $gs_n $gs_n_md}
