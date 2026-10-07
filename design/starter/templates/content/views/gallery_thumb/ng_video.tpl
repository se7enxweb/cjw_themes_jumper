{* v2: themes/app/content/gallery_thumb/ng_video.html.twig - the poster (lazy in the large swiper), the details
   with a play icon. Only for a video with a file or an identifier. *}
{def $tv_dm = $node.data_map
     $tv_title = cond( and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )}
{if or( and( is_set( $tv_dm.video_file ), $tv_dm.video_file.has_content ), and( is_set( $tv_dm.video_file_hd ), $tv_dm.video_file_hd.has_content ), and( is_set( $tv_dm.video_identifier ), $tv_dm.video_identifier.has_content ) )}
    <div class="view-type view-type-{$view_type|wash} ng-video vl3  {if first_set( $block.parameters.show_details_on_hover, '' )|eq( '1' )}show_details_on_hover{/if}">
{if $image_type|eq( 'main' )}
            {include uri='design:content/gallery_parts/video_poster.tpl' gp_dm=$tv_dm gp_lazy=true() gp_alt=$tv_title}
{if first_set( $block.parameters.show_details, '' )|eq( '1' )}
                <div class="info">
                    <h2 class="title">
                        <a href={$node.url_alias|ezurl}>
                            <i class="fas fa-play-circle"></i>{$tv_title|wash}
                        </a>
                    </h2>
                </div>
{/if}
{elseif $image_type|eq( 'thumb' )}
            {include uri='design:content/gallery_parts/video_poster.tpl' gp_dm=$tv_dm gp_lazy=false() gp_alt=$tv_title}
{/if}
    </div>
{/if}
{undef $tv_dm $tv_title}
