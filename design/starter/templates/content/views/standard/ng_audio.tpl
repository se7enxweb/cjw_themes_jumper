{* Item view "standard" of an audio item (v2: app/content/standard/ng_audio.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-audio vl1">
    <i class="fas fa-volume-up article-icon" aria-hidden="true"></i>
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_link=$node.url_alias|ezurl( 'no' )}

    <header class="article-header">
        <h2 class="title">
            <a href={$node.url_alias|ezurl}>
                {include uri='design:content/item_parts/title.tpl' it_node=$node}
            </a>
        </h2>
    </header>

    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
