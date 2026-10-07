{* Item view "line" of an audio item (v2: app/content/line/ng_audio.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'line' )|wash} ng-audio vl4">
    <i class="fas fa-volume-up article-icon" aria-hidden="true"></i>
    <div class="article-content">
        <header class="article-header">
            <h2 class="title">
                <a href={$node.url_alias|ezurl}>
                    {include uri='design:content/item_parts/title.tpl' it_node=$node}
                </a>
            </h2>
        </header>
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    </div>
</article>
