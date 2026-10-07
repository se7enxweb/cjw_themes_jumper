{* Full view of ng_video (v2: app/content/full/ng_video.html.twig with common/parts/video.html.twig, macro
   player with use_external_embed = true).
   The player is ported as a feature (plan D-F3 A), although v2 draws an empty box today (its video_type is
   empty, and v2 then draws nothing):
   - video_type keeps the option text, or only its id in data_int (1 YouTube, 2 Vimeo, 3 Dailymotion,
     4 uploaded file), the options of the v2 class; an identifier without a type is YouTube;
   - YouTube: the click-to-load player (content/parts/youtube_player.tpl): nothing loads from Google until the
     visitor plays it, then from youtube-nocookie.com;
   - Vimeo, Dailymotion: v2's iframe embed;
   - an uploaded file: the browser's own player (v2 used JW Player, which is not carried).
   The date is drawn as v2's Twig date filter does ('j M Y', English month names in both languages).
   part = 'content' (the whole view) or 'content_body'.
   Input: node, part *}
{def $nv_part = first_set( $part, 'content' )}
{if or( $nv_part|eq( 'content' ), $nv_part|eq( 'content_body' ) )}
{def $nv_map = $node.data_map
     $nv_id = cond( and( is_set( $nv_map.video_identifier ), $nv_map.video_identifier.has_content ), $nv_map.video_identifier.content|trim, '' )
     $nv_type = 'youtube'
     $nv_autoplay = and( is_set( $nv_map.autoplay ), $nv_map.autoplay.data_int|eq( 1 ) )
     $nv_months = array( 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' )}
{if is_set( $nv_map.video_type )}
    {if $nv_map.video_type.data_text|trim|ne( '' )}
        {set $nv_type = $nv_map.video_type.data_text|downcase}
    {else}
        {set $nv_type = cond( $nv_map.video_type.data_int|eq( 2 ), 'vimeo',
                              $nv_map.video_type.data_int|eq( 3 ), 'dailymotion',
                              $nv_map.video_type.data_int|eq( 4 ), 'upload',
                              'youtube' )}
    {/if}
{/if}
    <div class="view-type view-type-full ng-video vf3">
        <div class="full-video-player">
{if $nv_type|contains( 'upload' )}
    {if and( is_set( $nv_map.video_file ), $nv_map.video_file.has_content )}
            <div class="embed-responsive embed-responsive-16by9">
                <video class="embed-responsive-item" controls preload="metadata" width="770" height="433"{if $nv_autoplay} autoplay{/if}{if and( is_set( $nv_map.poster ), $nv_map.poster.has_content )} poster="{$nv_map.poster.content['cjw_i1200'].url|ezroot( 'no' )}"{/if}>
                    <source src={concat( 'content/download/', $node.contentobject_id, '/', $nv_map.video_file.id )|ezurl} type="{$nv_map.video_file.content.mime_type|wash}" />
                </video>
            </div>
    {/if}
{elseif $nv_id|ne( '' )}
    {if $nv_type|contains( 'vimeo' )}
            <div class="video-vimeo embed-responsive embed-responsive-16by9">
                <iframe frameborder="0" class="embed-responsive-item" src="https://player.vimeo.com/video/{$nv_id|wash}{if $nv_autoplay}?autoplay=1{/if}" title="{$node.name|wash}" width="770" height="433" allowfullscreen></iframe>
            </div>
    {elseif $nv_type|contains( 'dailymotion' )}
            <div class="video-dailymotion embed-responsive embed-responsive-16by9">
                <iframe frameborder="0" class="embed-responsive-item" src="https://www.dailymotion.com/embed/video/{$nv_id|wash}{if $nv_autoplay}?autoplay=1{/if}" title="{$node.name|wash}" width="770" height="433" allowfullscreen></iframe>
            </div>
    {else}
            {include uri='design:content/parts/youtube_player.tpl' yt_id=$nv_id yt_title=$nv_map.title.content}
    {/if}
{/if}
        </div>

        <header class="full-video-header">
            <h1 class="title"><span class="ezstring-field">{$nv_map.title.content|wash}</span></h1>
            {if $node.object.published}
                <p class="info">
                    <time>{$node.object.published|datetime( 'custom', '%j' )} {$nv_months[$node.object.published|datetime( 'custom', '%n' )|dec]} {$node.object.published|datetime( 'custom', '%Y' )}</time>
                </p>
            {/if}
        </header>

        {if $nv_map.teaser_intro.has_content}
            <div class="short">
                <div class="ezxmltext-field">{$nv_map.teaser_intro.content.output.output_text}</div>
            </div>
        {/if}

        {if $nv_map.description.has_content}
            <div class="body">
                <div class="ezxmltext-field">{$nv_map.description.content.output.output_text}</div>
            </div>
        {/if}
    </div>
{undef $nv_map $nv_id $nv_type $nv_autoplay $nv_months}
{/if}
{undef $nv_part}
