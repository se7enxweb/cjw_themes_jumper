{* v2: nglayouts/themes/cjw_app/block/gallery/carousel.html.twig. Drawn even without items, as in v2. *}
        <div class="carousel container-max">
{foreach first_set( $block.values.items, array() ) as $gc_entry}
{include uri='design:explayouts/block/list/_item.tpl' item=$gc_entry.node ivt=first_set( $block.item_view_type, 'carousel' ) block=$block}
{/foreach}
                    </div>
