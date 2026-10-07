{* Item view "line" of a file (v2: app/content/line/file.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'line' )|wash} file vl4">
    <div class="article-content">
        <header class="article-header">
            <h2 class="title">
                <a href={$node.url_alias|ezurl}>
                    {if is_set( $node.data_map.name )}{$node.data_map.name.content|wash}{else}{$node.name|wash}{/if}
                </a>
            </h2>
        </header>
    </div>
</article>
