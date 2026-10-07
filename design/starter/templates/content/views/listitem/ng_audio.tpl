{* Item view "listitem" of an audio item (v2: app/content/listitem/ng_audio.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'listitem' )|wash} ng-audio vl6 t1">
    <h2 class="title">
        <a href={$node.url_alias|ezurl}>
            <i class="fas fa-volume-up article-icon" aria-hidden="true"></i>{include uri='design:content/item_parts/title.tpl' it_node=$node}
        </a>
    </h2>
</article>
