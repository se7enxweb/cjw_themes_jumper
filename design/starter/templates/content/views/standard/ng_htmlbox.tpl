{* Item view "standard" of an HTML box (v2: app/content/standard/ng_htmlbox.html.twig): its HTML code as is. *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-htmlbox vl1">
    <header class="article-header">
        {if is_set( $node.data_map.html_code )}{$node.data_map.html_code.content}{/if}
    </header>
</article>
