{* Item view "mini" of a video (v2: app/content/mini/ng_video.html.twig). *}
{def $mv_dm = $node.data_map}
{if or( and( is_set( $mv_dm.video_file ), $mv_dm.video_file.has_content ), and( is_set( $mv_dm.video_file_hd ), $mv_dm.video_file_hd.has_content ), and( is_set( $mv_dm.video_identifier ), $mv_dm.video_identifier.has_content ) )}
    <article class="view-type view-type-{first_set( $view_type, 'mini' )|wash} ng-video vl5">
        <figure class="image">
            <i class="fas fa-play article-icon" aria-hidden="true"></i>
            {include uri='design:content/item_parts/video_poster.tpl' vp_node=$node}
        </figure>
        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
            <div class="info">
                {include uri='design:content/item_parts/info.tpl' if_node=$node if_no_authors=true()}
            </div>
        </header>
    </article>
{/if}
{undef $mv_dm}
