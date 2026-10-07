{* The poster of a video item (v2 macro video.poster): the poster image, else a thumbnail by the video type
   (YouTube through the server-side copy of video_thumbnail(), so no visitor request goes to Google before a
   video is played; Vimeo and Dailymotion as v2's placeholders), else the design's video poster.
   Parameters: vp_node, vp_alias (default cjw_i480). *}
{def $vpp_dm = $vp_node.data_map
     $vpp_ident = cond( and( is_set( $vpp_dm.video_identifier ), $vpp_dm.video_identifier.has_content ), $vpp_dm.video_identifier.content, '' )
     $vpp_type = cond( is_set( $vpp_dm.video_type ), $vpp_dm.video_type.data_text|downcase, '' )
     $vpp_alt = $vp_node.name}
    <a href={$vp_node.url_alias|ezurl} class="image-16by9" aria-label="{$vpp_alt|wash}">
        <figure>
            {if and( is_set( $vpp_dm.poster ), $vpp_dm.poster.has_content )}
                <img src="{$vpp_dm.poster.content['cjw_i30'].url|ezroot( 'no' )}" data-src="{$vpp_dm.poster.content[first_set( $vp_alias, 'cjw_i480' )].url|ezroot( 'no' )}" alt="{$vpp_alt|wash}" class="ezimage-field" />
            {elseif $vpp_ident|ne( '' )}
                {if $vpp_type|contains( 'vimeo' )}
                    <img src="" class="vimeo-poster" data-id="{$vpp_ident|wash}" data-thumbname="thumbnail_large" alt="{$vpp_alt|wash}" />
                {elseif $vpp_type|contains( 'dailymotion' )}
                    <img src="" class="dailymotion-poster" data-id="{$vpp_ident|wash}" data-thumbname="thumbnail_360_url" alt="{$vpp_alt|wash}" />
                {else}
                    <img data-src="{video_thumbnail( 'youtube', $vpp_ident )|ezroot( 'no' )}" alt="{$vpp_alt|wash}" />
                {/if}
            {/if}
        </figure>
    </a>
{undef $vpp_dm $vpp_ident $vpp_type $vpp_alt}
