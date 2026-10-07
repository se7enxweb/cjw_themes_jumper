{* The player of an ng_video (v2: common/parts/video.html.twig, macros player and player_slide, with
   use_external_embed = true, as the full view and the related multimedia call them).
   video_type keeps the option in data_text, or only its id in data_int (1 YouTube, 2 Vimeo, 3 Dailymotion,
   4 uploaded file), the options of the v2 class; an identifier without a type is YouTube.
   Input: vp_node (the ng_video node), vp_slide (true: the slide variant, no autoplay, hidden config). *}
{def $vp_map = $vp_node.data_map
     $vp_id = cond( and( is_set( $vp_map.video_identifier ), $vp_map.video_identifier.has_content ), $vp_map.video_identifier.content|trim, '' )
     $vp_type = ''
     $vp_autoplay = cond( and( $vp_slide|not, is_set( $vp_map.autoplay ) ), $vp_map.autoplay.data_int|eq( 1 ), false() )
     $vp_image = 'images/video_poster.png'|ezdesign( 'no' )}
{if is_set( $vp_map.video_type )}
    {set $vp_type = $vp_map.video_type.data_text|downcase}
    {if $vp_type|eq( '' )}
        {set $vp_type = cond( $vp_map.video_type.data_int|eq( 2 ), 'vimeo',
                              $vp_map.video_type.data_int|eq( 3 ), 'dailymotion',
                              $vp_map.video_type.data_int|eq( 4 ), 'upload',
                              'youtube' )}
    {/if}
{/if}
{if and( is_set( $vp_map.poster ), $vp_map.poster.has_content )}
    {set $vp_image = $vp_map.poster.content['cjw_i1200'].url|ezroot( 'no' )}
{/if}
{if $vp_type|contains( 'upload' )}
    {if and( is_set( $vp_map.video_file ), $vp_map.video_file.has_content )}
            <div class="video-config video-local-{$vp_node.contentobject_id}"{if $vp_slide} style="display: none;"{/if}
                 data-video_player_id="video-local-{$vp_node.contentobject_id}"
                 {if $vp_slide|not}data-width="770"
                 data-height="433"
                 {/if}data-autostart="{if $vp_autoplay}true{else}false{/if}"
                 data-image="{$vp_image}"
                 data-file="{concat( 'content/download/', $vp_node.contentobject_id, '/', $vp_map.video_file.id )|ezurl( 'no' )}"
                 data-videotype="local"
                 data-mimetype="{$vp_map.video_file.content.mime_type|wash}">
            </div>

            <div class="video-container" id="video-local-{$vp_node.contentobject_id}">Loading the player ...</div>
    {/if}
{elseif $vp_id|ne( '' )}
    {* Nothing is loaded from a video service before the visitor asks: YouTube through the click-to-load
       player (youtube_player.tpl, consent tied to the cookie banner); Vimeo and Dailymotion, which have no
       consent player here, as a plain link to the video instead of v2's iframe. *}
    {if $vp_type|contains( 'vimeo' )}
            <div class="video-vimeo">
                <a href="https://vimeo.com/{$vp_id|wash}" target="_blank" rel="noopener noreferrer">{$vp_node.name|wash}</a>
            </div>
    {elseif $vp_type|contains( 'dailymotion' )}
            <div class="video-dailymotion">
                <a href="https://www.dailymotion.com/video/{$vp_id|wash}" target="_blank" rel="noopener noreferrer">{$vp_node.name|wash}</a>
            </div>
    {else}
            <div class="video-youtube">
                {include uri='design:content/parts/youtube_player.tpl' yt_id=$vp_id yt_title=$vp_node.name}
            </div>
    {/if}
{/if}
{undef $vp_map $vp_id $vp_type $vp_autoplay $vp_image}
