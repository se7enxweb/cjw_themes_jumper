{* Item view "tile" (v2: cjw_app/content/tile.html.twig): a link with the teaser image (16:9) as background,
   the title and the teaser intro. Parameters: node, view_type. *}
{def $tl_dm = $node.data_map}
<a href={$node.url_alias|ezurl}
   class="view-type view-type-{first_set( $view_type, 'tile' )|wash}"{if and( is_set( $tl_dm.teaser_image ), $tl_dm.teaser_image.has_content )} style="background-image: url( '{$tl_dm.teaser_image.content['cjw_i770_16-9'].url|ezroot( 'no' )}' );"{/if}>

    <div class="tile-feature">
        <header class="article-header">

            {if and( is_set( $tl_dm.title ), $tl_dm.title.has_content )}
                <div class="tile-title">
                    {include uri='design:content/item_parts/title.tpl' it_node=$node}
                </div>
            {/if}

            {if and( is_set( $tl_dm.teaser_intro ), $tl_dm.teaser_intro.has_content )}
                <div class="tile-intro">
                    {include uri='design:content/item_parts/xml.tpl' ix_attr=$tl_dm.teaser_intro}
                </div>
            {/if}

        </header>
    </div>
</a>
{undef $tl_dm}
