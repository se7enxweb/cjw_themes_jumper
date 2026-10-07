{* Item view "overlay" for classes without their own overlay template (v2: app/content/overlay.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'overlay' )|wash} {$node.class_identifier|explode( '_' )|implode( '-' )} vl2">
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_link=$node.url_alias|ezurl( 'no' ) ip_link_class='image-16by9'}
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    </header>
</article>
