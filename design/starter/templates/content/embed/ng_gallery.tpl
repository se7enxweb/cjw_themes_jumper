{* Embed view of ng_gallery in rich text (v2: cjw_app/content/embed/ng_gallery.html.twig): the gallery as a swiper
   slider when the embed asks for gallery_view_mode=slider, else as a row of lightbox thumbnails.
   Input: eg_node (the gallery's main node), eg_params (the embed's object parameters). *}
<div class="view-type view-type-embed ng-gallery">

    {if and( is_set( $eg_params.gallery_view_mode ), $eg_params.gallery_view_mode|eq( 'slider' ) )}
        {include uri='design:content/parts/related_multimedia.tpl' rm_node=$eg_node}
    {else}
        {include uri='design:content/parts/related_multimedia_grid.tpl' rg_node=$eg_node}
    {/if}

</div>
