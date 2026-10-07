{* One item of the related multimedia (v2: parts/related_multimedia/<content type>.html.twig).
   image, ng_article, ng_news, ng_blog_post, ng_recipe: the image field (cjw_app/parts/related_multimedia/image);
   ng_video: the player; every other class draws nothing, as v2 ignores a missing template.
   Input: rmi_node, rmi_slider (true inside the swiper slider). *}
{def $rmi_class = $rmi_node.class_identifier}
{if array( 'image', 'ng_article', 'ng_news', 'ng_blog_post', 'ng_recipe' )|contains( $rmi_class )}
{if and( is_set( $rmi_node.data_map.image ), $rmi_node.data_map.image.has_content )}
{def $rmi_image = $rmi_node.data_map.image.content
     $rmi_alt = $rmi_image.alternative_text
     $rmi_uri = $rmi_image['cjw_i1200'].url|ezroot( 'no' )}
    {if $rmi_slider}
        <div class="swiper-slide">
    {/if}
            <figure class="image-wrapper">
                {if $rmi_slider}
                    <img class="swiper-lazy" data-src="{$rmi_uri}" {if $rmi_alt|ne( '' )} alt="{$rmi_alt|wash}" {/if} />
                {else}
                    <a href="{$rmi_image['cjw_i1920'].url|ezroot( 'no' )}" data-fancybox>
                        <img
                                src="{$rmi_image['cjw_i30'].url|ezroot( 'no' )}"
                                data-src="{$rmi_uri}"
                                data-srcset="{$rmi_image['cjw_i480'].url|ezroot( 'no' )} 600w,
                                            {$rmi_image['cjw_i770'].url|ezroot( 'no' )} 991w,
                                            {$rmi_uri} 1200w"
                            {if $rmi_alt|ne( '' )} alt="{$rmi_alt|wash}"{/if}
                        />
                    </a>
                {/if}

                {if and( is_set( $rmi_node.data_map.caption ), $rmi_node.data_map.caption.has_content )}
                    <figcaption>
                        <div class="ezxmltext-field">{$rmi_node.data_map.caption.content.output.output_text}</div>
                    </figcaption>
                {elseif $rmi_alt|ne( '' )}
                    <figcaption>
                        {$rmi_alt|wash}
                    </figcaption>
                {/if}
            </figure>
    {if $rmi_slider}
        </div>
    {/if}
{undef $rmi_image $rmi_alt $rmi_uri}
{/if}
{elseif $rmi_class|eq( 'ng_video' )}
{if $rmi_slider}
        <div class="swiper-slide">
            {include uri='design:content/parts/video_player.tpl' vp_node=$rmi_node vp_slide=true()}
        </div>
{else}
        {include uri='design:content/parts/video_player.tpl' vp_node=$rmi_node vp_slide=false()}
{/if}
{/if}
{undef $rmi_class}
