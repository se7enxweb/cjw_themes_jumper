{* v2: themes/app/content/gallery_thumb/ng_news.html.twig - as the generic thumb item, the details with the date.
   Input: $node, $view_type, $image_type, $block. *}
{def $tn_dm = $node.data_map
     $tn_title = cond( and( is_set( $node.data_map.teaser_title ), $node.data_map.teaser_title.has_content ), $node.data_map.teaser_title.content, and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )}
<div class="view-type view-type-{$view_type|wash} ng-news vl3 {if first_set( $block.parameters.show_details_on_hover, '' )|eq( '1' )}show_details_on_hover{/if}">
{if and( is_set( $tn_dm.image ), $tn_dm.image.has_content )}
{if $image_type|eq( 'main' )}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tn_dm.image.content gp_alias='original' gp_alt=$tn_title gp_class='swiper-lazy' gp_data_src_alias='cjw_i1200'}
{elseif $image_type|eq( 'thumb' )}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tn_dm.image.content gp_alias='cjw_i320' gp_alt=$tn_title}
{/if}
{/if}
{if and( $image_type|eq( 'main' ), first_set( $block.parameters.show_details, '' )|eq( '1' ) )}
            <div class="info">
                <div class="date">
                    {include uri='design:content/gallery_parts/date.tpl' gp_dm=$tn_dm}
                </div>
                <h2 class="title"><a href={$node.url_alias|ezurl}>{$tn_title|wash}</a></h2>
            </div>
{/if}
</div>
{undef $tn_dm $tn_title}
