{* Item view "line" of ng_category (v2: app/content/line/ng_category.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'line' )|wash} ng-category vl4">
    <div class="article-content">
        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
        </header>
    </div>
</article>
