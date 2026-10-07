{* A YouTube video that loads nothing from Google until the visitor asks: the click-to-load player of
   sevenx_themes_media 1.5.41, in the design starter.

   Params: yt_id     the stored video identifier (or a YouTube URL)
           yt_title  the video's title (optional)

   What is drawn is a local copy of the video's image (video_thumbnail keeps one in storage), a play button,
   the title, and one line saying where the video comes from. exp-youtube-consent.js turns the link into a
   button that swaps in the player from www.youtube-nocookie.com, and offers to remember the choice for the
   whole site in localStorage (the cookie banner's "Embedded videos" choice drives the same key). Without
   JavaScript it stays a plain link to the video on YouTube, so nothing from Google loads either way.
   The script and its stylesheet are asked for here (ezscript_require, ezcss_require): the page head loads
   them only on pages with a video.

   The privacy policy is the page named per siteaccess in menu.ini ([SiteInfo] PrivacyPolicyID); without one
   the line names it without a link. *}
{def $ytp_id = youtube_id( first_set( $yt_id, '' ) )}
{if $ytp_id|ne('')}
{ezscript_require( 'exp-youtube-consent.js' )}
{ezcss_require( 'exp-youtube-consent.css' )}
{def $ytp_title = first_set( $yt_title, '' )}
{def $ytp_thumb = video_thumbnail( 'youtube', $ytp_id, 'hqdefault' )}
{def $ytp_pp_node = false()}
{if and( ezini_hasvariable( 'SiteInfo', 'PrivacyPolicyID', 'menu.ini' ), ezini( 'SiteInfo', 'PrivacyPolicyID', 'menu.ini' )|ne( '' ) )}
    {set $ytp_pp_node = fetch( 'content', 'node', hash( 'node_id', ezini( 'SiteInfo', 'PrivacyPolicyID', 'menu.ini' ) ) )}
{/if}
{def $ytp_privacy = cond( is_object( $ytp_pp_node ),
                          concat( '<a href="', $ytp_pp_node|site_url|wash, '">',
                                  'Privacy policy'|i18n('design/starter/media'), '</a>' ),
                          'Privacy policy'|i18n('design/starter/media') )}
{def $ytp_label = cond( $ytp_title|ne(''), 'Play video: %title'|i18n('design/starter/media', '', hash('%title', $ytp_title)), 'Play video'|i18n('design/starter/media') )}
<div class="exp-yt js-exp-yt" data-exp-yt-id="{$ytp_id}" data-exp-yt-title="{$ytp_title|wash}">
    <div class="exp-yt-frame video-youtube ratio ratio-16x9">
        <a class="exp-yt-poster js-exp-yt-play" href="https://www.youtube.com/watch?v={$ytp_id}"
           aria-label="{$ytp_label|wash}"
           data-exp-yt-label="{$ytp_label|wash}">
            <img src="{$ytp_thumb|ezroot(no)}" alt="" width="480" height="360" decoding="async">
            <span class="exp-yt-play" aria-hidden="true"></span>
            {if $ytp_title|ne('')}<span class="exp-yt-title" aria-hidden="true">{$ytp_title|wash}</span>{/if}
        </a>
    </div>
    <div class="exp-yt-consent">
        <p class="exp-yt-notice">{'Playing this video loads it from YouTube (Google). See our %privacy_link.'|i18n('design/starter/media', '', hash('%privacy_link', $ytp_privacy))}</p>
        <label class="exp-yt-always" hidden><input type="checkbox" class="js-exp-yt-always"> {'Always allow YouTube videos on this site'|i18n('design/starter/media')}</label>
        <button type="button" class="exp-yt-stop js-exp-yt-stop" hidden>{'Stop loading YouTube automatically'|i18n('design/starter/media')}</button>
    </div>
</div>
{undef $ytp_title $ytp_thumb $ytp_pp_node $ytp_privacy $ytp_label}
{/if}
{undef $ytp_id}
