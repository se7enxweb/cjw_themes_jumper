{* v2: themes/app/content/gallery_thumb/image.html.twig - in the large swiper (image_type main) the lazy swiper
   image (cjw_i1200), in the thumbnails (thumb) the cjw_i320 image. Input: $node, $view_type, $image_type. *}
{def $ti_dm = $node.data_map}
<div class="view-type view-type-{$view_type|wash} image vl3">
{if and( is_set( $ti_dm.image ), $ti_dm.image.has_content )}
{if $image_type|eq( 'main' )}
                                    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$ti_dm.image.content gp_alias='original' gp_alt=$node.name gp_class='swiper-lazy' gp_data_src_alias='cjw_i1200'}
{elseif $image_type|eq( 'thumb' )}
                    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$ti_dm.image.content gp_alias='cjw_i320' gp_alt=$node.name}
{/if}
{/if}
    </div>
{undef $ti_dm}
