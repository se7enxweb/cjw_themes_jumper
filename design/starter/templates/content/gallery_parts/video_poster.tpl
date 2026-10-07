{* v2 macro poster_slide (common/parts/video): the poster image (cjw_i1200), else the provider's preview (YouTube
   image, Vimeo / Dailymotion placeholders filled by the page script), else the design's video poster.
   Input: $gp_dm (data map), $gp_lazy (bool), $gp_alt. *}
{if and( is_set( $gp_dm.poster ), $gp_dm.poster.has_content )}
{if $gp_lazy}
    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$gp_dm.poster.content gp_alias='original' gp_alt=$gp_alt gp_class='swiper-lazy' gp_data_src_alias='cjw_i1200'}
{else}
    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$gp_dm.poster.content gp_alias='cjw_i1200' gp_alt=$gp_alt}
{/if}
{elseif and( is_set( $gp_dm.video_identifier ), $gp_dm.video_identifier.has_content )}
{* video_type keeps its option id in data_int (1 YouTube, 2 Vimeo, 3 Dailymotion, 4 uploaded), the text is mostly empty *}
{def $gp_vtype = cond( is_set( $gp_dm.video_type ), $gp_dm.video_type.data_text|downcase, '' )
     $gp_vid = $gp_dm.video_identifier.content}
{if and( $gp_vtype|eq( '' ), is_set( $gp_dm.video_type ) )}{set $gp_vtype = cond( $gp_dm.video_type.data_int|eq( 2 ), 'vimeo', $gp_dm.video_type.data_int|eq( 3 ), 'dailymotion', $gp_dm.video_type.data_int|eq( 4 ), 'upload', 'youtube' )}{/if}
{if $gp_vtype|contains( 'youtube' )}
            <img {if $gp_lazy}class="swiper-lazy" data-{/if}src="{video_thumbnail( 'youtube', $gp_vid )|wash}" {if $gp_alt|ne( '' )}alt="{$gp_alt|wash}"{/if} />
{elseif $gp_vtype|contains( 'vimeo' )}
            <img src="" class="vimeo-poster" data-id="{$gp_vid|wash}" data-thumbname="thumbnail_large" {if $gp_alt|ne( '' )}alt="{$gp_alt|wash}"{/if} />
{elseif $gp_vtype|contains( 'dailymotion' )}
            <img src="" class="dailymotion-poster" data-id="{$gp_vid|wash}" data-thumbname="thumbnail_720_url" {if $gp_alt|ne( '' )}alt="{$gp_alt|wash}"{/if} />
{/if}
{undef $gp_vtype $gp_vid}
{else}
            <img {if $gp_lazy}class="swiper-lazy" data-{/if}src={'video_poster.png'|ezimage} {if $gp_alt|ne( '' )}alt="{$gp_alt|wash}"{/if} />
{/if}
