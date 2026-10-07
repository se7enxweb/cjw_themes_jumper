{* v2: themes/cjw_app/content/slide/ng_video.html.twig - only a Vimeo video is drawn in a slider: its poster
   with the intro and a play icon (fancybox), or the embedded player. Other videos draw nothing, as in v2. *}
{def $sv_dm = $node.data_map
     $sv_type = cond( is_set( $node.data_map.video_type ), $node.data_map.video_type.data_text|downcase, '' )
     $sv_id = cond( and( is_set( $node.data_map.video_identifier ), $node.data_map.video_identifier.has_content ), $node.data_map.video_identifier.content, '' )}
{if and( $sv_type|eq( '' ), is_set( $sv_dm.video_type ) )}{set $sv_type = cond( $sv_dm.video_type.data_int|eq( 2 ), 'vimeo', $sv_dm.video_type.data_int|eq( 3 ), 'dailymotion', $sv_dm.video_type.data_int|eq( 4 ), 'upload', 'youtube' )}{/if}
{if and( $sv_type|contains( 'vimeo' ), or( $sv_id|ne( '' ), and( is_set( $sv_dm.video_file ), $sv_dm.video_file.has_content ) ) )}
        <div class="embed-video-container">
{if and( is_set( $sv_dm.poster ), $sv_dm.poster.has_content )}
                <a data-fancybox="{$view_type|wash}" href="https://vimeo.com/{$sv_id|wash}" style="position: relative; display: inline-block">
                    <img src="{$sv_dm.poster.content['cjw_i770'].url|ezroot( 'no' )}" alt="" />
{if and( is_set( $sv_dm.teaser_intro ), $sv_dm.teaser_intro.has_content )}
                        <div class="ezxmltext-field">{$sv_dm.teaser_intro.content.output.output_text}</div>
{elseif and( is_set( $sv_dm.description ), $sv_dm.description.has_content )}
                        <div class="ezxmltext-field">{$sv_dm.description.content.output.output_text}</div>
{/if}
                    <img class="play" src={'icons/icon-play.png'|ezimage} alt=">" />
                </a>
{else}
                <div class="embed-video">
                    <a class="open-in-overlay" data-fancybox="{$view_type|wash}" href="https://vimeo.com/{$sv_id|wash}">
                        <img src={'icons/symbol-plus.png'|ezimage} alt="+" />
                    </a>
                    <iframe frameborder="0" class="embed-responsive-item" src="https://player.vimeo.com/video/{$sv_id|wash}?byline=false&title=false&portrait=false&loop=true" style="width: 100%;"></iframe>
                </div>
{/if}
        </div>
{/if}
{undef $sv_dm $sv_type $sv_id}
