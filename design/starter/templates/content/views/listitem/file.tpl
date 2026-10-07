{* Item view "listitem" of a file (v2: app/content/listitem/file.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'listitem' )|wash} file vl6">
    <h2 class="title">
        <a href={$node.url_alias|ezurl}>
            <span class="ezstring-field">{if is_set( $node.data_map.name )}{$node.data_map.name.content|wash}{else}{$node.name|wash}{/if}</span>
        </a>
    </h2>
</article>
