{* v2: nglayouts/themes/cjw_app/block/gallery/slider.html.twig, a slick slider. Drawn even without items, as in v2 (the
   article pages carry an empty one). The Design tab's settings go into the slick settings (v2 wrote fixed ones):
   - Thumbnails per row/slide: the items side by side (two when none is stored, as in v2), at most two up to 991px
     wide and one up to 480px, as in the sushi bar
   - Show next and previous buttons: arrows (shown when the block stores nothing, as in v2)
   - Show pagination: dots; Infinite loop: infinite (off when nothing is stored, as in v2)
   - Transition Fade: fade, which slick can do with one item per slide only, else the items slide
   - Autoplay: autoplay, every Autoplay time seconds (1 to 12, 5 when none is stored) *}
{def $gs_p = first_set( $block.parameters, hash() )
     $gs_n = first_set( $gs_p.number_of_thumbnails, '' )|int}
{if $gs_n|lt( 1 )}{set $gs_n = 2}{/if}
{def $gs_n_md = min( $gs_n, 2 )
     $gs_arrows = cond( is_set( $gs_p.next_and_previous ), first_set( $gs_p.next_and_previous, '' )|eq( '1' ), true() )
     $gs_dots = first_set( $gs_p.show_pagination, '' )|eq( '1' )
     $gs_loop = first_set( $gs_p.infinite_loop, '' )|eq( '1' )
     $gs_fade = and( first_set( $gs_p.transition, '' )|eq( 'fade' ), $gs_n|eq( 1 ) )
     $gs_autoplay = first_set( $gs_p.autoplay, '' )|eq( '1' )
     $gs_time = first_set( $gs_p.autoplay_time, '' )|int}
{if or( $gs_time|lt( 1 ), $gs_time|gt( 12 ) )}{set $gs_time = 5}{/if}
        <div class="slick-slider{if $gs_dots} has-dots{/if}" data-slick='{ldelim} "slidesToShow": {$gs_n}, "arrows": {cond( $gs_arrows, 'true', 'false' )}, "dots": {cond( $gs_dots, 'true', 'false' )}, "infinite": {cond( $gs_loop, 'true', 'false' )}, "fade": {cond( $gs_fade, 'true', 'false' )}, "autoplay": {cond( $gs_autoplay, 'true', 'false' )}, "autoplaySpeed": {mul( $gs_time, 1000 )}, "responsive": [ {ldelim} "breakpoint": 991, "settings": {ldelim} "slidesToShow": {$gs_n_md} {rdelim} {rdelim}, {ldelim} "breakpoint": 480, "settings": {ldelim} "slidesToShow": 1 {rdelim} {rdelim} ] {rdelim}'>
{foreach first_set( $block.values.items, array() ) as $gs_entry}
{include uri='design:explayouts/block/list/_item.tpl' item=$gs_entry.node ivt=cond( first_set( $block.item_view_type, '' )|ne( '' ), $block.item_view_type, 'slide' ) block=$block}
{/foreach}
                    </div>
{undef $gs_p $gs_n $gs_n_md $gs_arrows $gs_dots $gs_loop $gs_fade $gs_autoplay $gs_time}
