{* Item view "listitem" of ng_recipe (v2: app/content/listitem/ng_recipe.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'listitem' )|wash} ng-recipe vl6">
    <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    <div class="info">
        {include uri='design:content/item_parts/info.tpl' if_node=$node}
        {include uri='design:content/item_parts/recipe_details.tpl' rd_node=$node}
    </div>
</article>
