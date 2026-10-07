{* Item view "line" of ng_recipe (v2: app/content/line/ng_recipe.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'line' )|wash} ng-recipe vl4">
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i320' ip_link=$node.url_alias|ezurl( 'no' )}
    <div class="article-content">
        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
            <div class="info">
                {include uri='design:content/item_parts/info.tpl' if_node=$node}
                {include uri='design:content/item_parts/recipe_details.tpl' rd_node=$node}
            </div>
        </header>
        <div class="short">
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        </div>
    </div>
</article>
