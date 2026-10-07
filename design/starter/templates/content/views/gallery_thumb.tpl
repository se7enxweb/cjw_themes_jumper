{* v2: themes/app/content/gallery_thumb.html.twig and gallery_thumb/<class>: as gallery_thumb/image, plus the
   linked title when the block shows details. Input: $node, $view_type, $image_type, $block. *}
{def $tc_dm = $node.data_map
     $tc_title = $node.name
     $tc_hover = first_set( $block.parameters.show_details_on_hover, '' )|eq( '1' )}
{if and( is_set( $tc_dm.teaser_title ), $tc_dm.teaser_title.has_content )}{set $tc_title = $tc_dm.teaser_title.content}
{elseif and( is_set( $tc_dm.title ), $tc_dm.title.has_content )}{set $tc_title = $tc_dm.title.content}{/if}
<div class="view-type view-type-{$view_type|wash} {$node.class_identifier|explode( '_' )|implode( '-' )|wash} vl3 {if $tc_hover}show_details_on_hover{/if}">
{if and( is_set( $tc_dm.image ), $tc_dm.image.has_content )}
{if $image_type|eq( 'main' )}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tc_dm.image.content gp_alias='original' gp_alt=$tc_title gp_class='swiper-lazy' gp_data_src_alias='cjw_i1200'}
{if first_set( $block.parameters.show_details, '' )|eq( '1' )}
            <div class="info">
                <h2 class="title"><a href={$node.url_alias|ezurl}>{$tc_title|wash}</a></h2>
            </div>
{/if}
{elseif $image_type|eq( 'thumb' )}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tc_dm.image.content gp_alias='cjw_i320' gp_alt=$tc_title}
{/if}
{/if}
</div>
{undef $tc_dm $tc_title $tc_hover}
