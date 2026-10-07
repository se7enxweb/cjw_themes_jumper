{* Item view "flexline" of a news item (v2: cjw_app/content/flexline/ng_news.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'flexline' )|wash} ng-news vl4">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i480' ip_link=$node.url_alias|ezurl( 'no' )}

    <div class="article-content">
        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
        </header>
        <div class="short">
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        </div>
    </div>

</article>
