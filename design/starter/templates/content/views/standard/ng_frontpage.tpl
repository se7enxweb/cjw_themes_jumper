{* Item view "standard" of a front page (v2: app/content/standard/ng_frontpage.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-frontpage vl1">
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{if and( is_set( $node.data_map.title ), $node.data_map.title.has_content )}<span class="ezstring-field">{$node.data_map.title.content|wash}</span>{else}{$node.name|wash}{/if}</a></h2>
    </header>
</article>
