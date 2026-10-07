{* Item view "line" of a video (v2: app/content/line/ng_video.html.twig). *}
{def $lv_dm = $node.data_map}
{if or( and( is_set( $lv_dm.video_file ), $lv_dm.video_file.has_content ), and( is_set( $lv_dm.video_file_hd ), $lv_dm.video_file_hd.has_content ), and( is_set( $lv_dm.video_identifier ), $lv_dm.video_identifier.has_content ) )}
<article class="view-type view-type-{first_set( $view_type, 'line' )|wash} ng-video vl4">
    <i class="fas fa-play article-icon" aria-hidden="true"></i>
    <figure class="image">
        {include uri='design:content/item_parts/video_poster.tpl' vp_node=$node}
    </figure>
    <div class="article-content">
        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
            <div class="info">
                {include uri='design:content/item_parts/info.tpl' if_node=$node if_no_authors=true()}
            </div>
        </header>
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    </div>
</article>
{/if}
{undef $lv_dm}
