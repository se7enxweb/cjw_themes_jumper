{* Item view "standard" of a landing page (v2: cjw_app/content/standard/ng_landing_page.html.twig).
   Parameters: node, view_type, with_intro. *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-landing-page vl1">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=$node.url_alias|ezurl( 'no' )}

    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    </header>

    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
