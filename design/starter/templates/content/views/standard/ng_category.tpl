{* Item view "standard" of ng_category (v2: app/content/standard/ng_category.html.twig). Parameters: node, view_type, with_intro. *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-category vl1">
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    </header>

    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
