{* Item view "button" (v2: cjw_app/content/button.html.twig). Parameters: node, view_type. *}
<article class="view-type view-type-{first_set( $view_type, 'button' )|wash} {$node.class_identifier|explode( '_' )|implode( '-' )} vl1">
    <a class="btn" href={$node.url_alias|ezurl}>
        {include uri='design:content/item_parts/title.tpl' it_node=$node}
    </a>
</article>
