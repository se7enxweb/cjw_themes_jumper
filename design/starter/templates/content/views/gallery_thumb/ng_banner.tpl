{* v2: themes/app/content/gallery_thumb/ng_banner.html.twig - details with the title linked to the banner's target. *}
{def $tr_dm = $node.data_map}
    <div class="view-type view-type-{$view_type|wash} ng-banner vl3 {if first_set( $block.parameters.show_details_on_hover, '' )|eq( '1' )}show_details_on_hover{/if}">
{if and( is_set( $tr_dm.image ), $tr_dm.image.has_content )}
{if $image_type|eq( 'main' )}
            {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tr_dm.image.content gp_alias='original' gp_alt=$node.name gp_class='swiper-lazy' gp_data_src_alias='cjw_i1200'}
{elseif $image_type|eq( 'thumb' )}
            {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$tr_dm.image.content gp_alias='cjw_i320' gp_alt=$node.name}
{/if}
{/if}
{if and( $image_type|eq( 'main' ), first_set( $block.parameters.show_details, '' )|eq( '1' ) )}
                <div class="info">
                    <h2 class="title">
                        {include uri='design:content/gallery_parts/content_link.tpl' gp_node=$node gp_text=cond( and( is_set( $tr_dm.title ), $tr_dm.title.has_content ), $tr_dm.title.content, $node.name )}
                    </h2>
                </div>
{/if}
    </div>
{undef $tr_dm}
