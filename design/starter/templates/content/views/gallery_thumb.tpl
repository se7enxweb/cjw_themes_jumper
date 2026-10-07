{* v2: themes/app/content/gallery_thumb.html.twig and gallery_thumb/ng_article: in the large swiper (image_type
   main) the lazy image (cjw_i1200) and, when the block shows details, the linked title; in the thumbnails the
   cjw_i320 image. Input: $node, $view_type, $image_type, $block. *}
{def $tc_dm = $node.data_map
     $tc_title = cond( and( is_set( $node.data_map.teaser_title ), $node.data_map.teaser_title.has_content ), $node.data_map.teaser_title.content, and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )
     $tc_image = and( is_set( $node.data_map.image ), $node.data_map.image.has_content )}
<div class="view-type view-type-{$view_type|wash} {$node.class_identifier|explode( '_' )|implode( '-' )|wash} vl3 {if first_set( $block.parameters.show_details_on_hover, '' )|eq( '1' )}show_details_on_hover{/if}">
{if $image_type|eq( 'main' )}
{if $tc_image}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tc_dm.image.content gp_alias='original' gp_alt=$tc_title gp_class='swiper-lazy' gp_data_src_alias='cjw_i1200'}
{/if}
{if first_set( $block.parameters.show_details, '' )|eq( '1' )}
            <div class="info">
                <h2 class="title"><a href={$node.url_alias|ezurl}>{$tc_title|wash}</a></h2>
            </div>
{/if}
{elseif and( $image_type|eq( 'thumb' ), $tc_image )}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tc_dm.image.content gp_alias='cjw_i320' gp_alt=$tc_title}
{/if}
</div>
{undef $tc_dm $tc_title $tc_image}
