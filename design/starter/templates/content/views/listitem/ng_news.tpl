{* Item view "listitem" of ng_news (v2: app/content/listitem/ng_news.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'listitem' )|wash} ng-news vl6">
    <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    <div class="info">
        {include uri='design:content/item_parts/info.tpl' if_node=$node if_time=true()}

    </div>
</article>
