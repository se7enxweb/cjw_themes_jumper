{* The line_30_70_* and line_50_50_* item views of an article (v2: cjw_app/content/line_x_y/ng_article.html.twig).
   Parameters: node, view_type. *}
<article class="view-type view-type-{$view_type|wash} ng-article vl4">

        {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770_16-9' ip_link=$node.url_alias|ezurl( 'no' )}

        <div class="article-content">
            <header class="article-header">
                <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
            </header>

            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        </div>

</article>
