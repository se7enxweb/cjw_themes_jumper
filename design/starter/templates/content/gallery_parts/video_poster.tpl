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
{* the provider as v2 reads it: no selected video type, no preview (v2 draws an empty poster then) *}
{def $gp_vtype = ''
     $gp_vid = $gp_dm.video_identifier.content}
{set-block variable=$gp_vtype}{include uri='design:content/parts/video_type_v2.tpl' vt_dm=$gp_dm}{/set-block}
{set $gp_vtype = $gp_vtype|trim}
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
