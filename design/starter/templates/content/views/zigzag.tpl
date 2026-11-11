{* Item view "zigzag" for every class (the list view type list_zigzag; from the media design, v2 has none): the
   image on one side, title and intro on the other; starter.css mirrors every second item and stacks both below
   768px. Parameters: node, view_type. *}
{def $zz_cls = $node.class_identifier|explode( '_' )|implode( '-' )
     $zz_vt = first_set( $view_type, 'zigzag' )}
<article class="view-type view-type-{$zz_vt|wash} {$zz_cls} vl9">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=$node.url_alias|ezurl( 'no' ) ip_figure_class='image cjw-image' ip_fields=array( 'teaser_image', 'image', 'icon', 'picture' )}

    <div class="article-content">
        <header class="article-header">
            <h3 class="title">
                <a href={$node.url_alias|ezurl}>
                    {include uri='design:content/item_parts/title.tpl' it_node=$node it_fields=array( 'title', 'teaser_title', 'short_title', 'name' )}
                </a>
            </h3>
        </header>
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        <a class="btn btn-primary" href={$node.url_alias|ezurl}>{'Read more'|i18n( 'design/starter/content' )}</a>
    </div>

</article>
{undef $zz_cls $zz_vt}
