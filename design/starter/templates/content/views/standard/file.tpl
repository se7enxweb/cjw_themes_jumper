{* Item view "standard" of a file (v2: cjw_app/content/standard/file.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} file vl1">
    <header class="article-header">
        <h2 class="title">
            <a href={$node.url_alias|ezurl} target="_blank" rel="nofollow noopener noreferrer">
                {if is_set( $node.data_map.name )}{$node.data_map.name.content|wash}{else}{$node.name|wash}{/if}
            </a>
        </h2>
    </header>
</article>
