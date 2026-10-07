{* Item view "standard" of a video (v2: app/content/standard/ng_video.html.twig): only when it has a file or an
   identifier; the poster (v2 parts/video.html.twig macro poster) in a 16:9 link. *}
{def $sv_dm = $node.data_map}
{if or( and( is_set( $sv_dm.video_file ), $sv_dm.video_file.has_content ), and( is_set( $sv_dm.video_file_hd ), $sv_dm.video_file_hd.has_content ), and( is_set( $sv_dm.video_identifier ), $sv_dm.video_identifier.has_content ) )}
    <article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-video vl1">
        <i class="fas fa-play article-icon" aria-hidden="true"></i>
        <figure class="image">
            {include uri='design:content/item_parts/video_poster.tpl' vp_node=$node}
        </figure>

        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
            <div class="info">
                {include uri='design:content/item_parts/info.tpl' if_node=$node if_no_authors=true()}
            </div>
        </header>
        {if first_set( $with_intro, false() )}
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        {/if}
    </article>
{/if}
{undef $sv_dm}
