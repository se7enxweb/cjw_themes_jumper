{* Item view "mini" for classes without their own mini template (v2: app/content/mini.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'mini' )|wash} {$node.class_identifier|explode( '_' )|implode( '-' )} vl5">
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i160' ip_link=$node.url_alias|ezurl( 'no' )}
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    </header>
</article>
