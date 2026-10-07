{* Item view "standard" for classes without their own template (v2: cjw_app/content/standard.html.twig).
   Parameters: node, view_type, with_intro. *}
{def $sg_cls = $node.class_identifier|explode( '_' )|implode( '-' )
     $sg_vt = first_set( $view_type, 'standard' )}
<article class="view-type view-type-{$sg_vt|wash} {$sg_cls} vl1">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=$node.url_alias|ezurl( 'no' ) ip_figure_class='image cjw-image' ip_fields=array( 'teaser_image', 'image', 'icon', 'picture' ) ip_always=true()}

    <header class="article-header {$sg_cls}-{$sg_vt|wash}-body">
        <h2 class="title">
            <a href={$node.url_alias|ezurl}>
                {include uri='design:content/item_parts/title.tpl' it_node=$node it_fields=array( 'title', 'teaser_title', 'short_title', 'name' )}
            </a>
        </h2>
    </header>

    <section class="article-body {$sg_cls}-{$sg_vt|wash}-body">
        {if first_set( $with_intro, false() )}
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        {/if}
    </section>

</article>
{undef $sg_cls $sg_vt}
