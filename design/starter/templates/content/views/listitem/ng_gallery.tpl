{* Item view "listitem" of ng_gallery (v2: app/content/listitem/ng_gallery.html.twig, which has no "view-type" class). *}
<article class="view-type-{first_set( $view_type, 'listitem' )|wash} ng-gallery vl6 t1">
    <h2 class="title">
        <a href={$node.url_alias|ezurl}>
            <i class="fas fa-camera article-icon" aria-hidden="true"></i>{include uri='design:content/item_parts/title.tpl' it_node=$node}
        </a>
    </h2>
    <div class="info">
        {include uri='design:content/item_parts/info.tpl' if_node=$node if_no_authors=true()}
    </div>
</article>
