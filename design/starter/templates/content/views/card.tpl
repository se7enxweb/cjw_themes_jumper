{* Item view "card" for every class (from explayouts' item views; v2 has none), after the media design
   (content/views/card.tpl): the image on top in 16:9, below it on a light ground the title and, for
   card_with_intro, the intro (starter.css, .vl8). Parameters: node, view_type, with_intro. *}
{def $cd_cls = $node.class_identifier|explode( '_' )|implode( '-' )
     $cd_vt = first_set( $view_type, 'card' )}
<article class="view-type view-type-{$cd_vt|wash} {$cd_cls} vl8">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=$node.url_alias|ezurl( 'no' ) ip_figure_class='image cjw-image' ip_fields=array( 'teaser_image', 'image', 'icon', 'picture' ) ip_always=true()}

    <div class="article-content">
        <header class="article-header">
            <h3 class="title">
                <a href={$node.url_alias|ezurl}>
                    {include uri='design:content/item_parts/title.tpl' it_node=$node it_fields=array( 'title', 'teaser_title', 'short_title', 'name' )}
                </a>
            </h3>
        </header>
        {if first_set( $with_intro, false() )}
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        {/if}
    </div>

</article>
{undef $cd_cls $cd_vt}
