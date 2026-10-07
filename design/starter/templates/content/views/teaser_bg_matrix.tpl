{* Item view "teaser_bg_matrix" (v2 content_view.yml: cjw_app/content/teaser.html.twig, teaser_design chess):
   headline, title, intro, the "more" button, and the image (cjw_i480) as the chess field's background.
   Parameters: node, view_type. *}
{def $tz_dm = $node.data_map
     $tz_img = false()}
{if and( is_set( $tz_dm.teaser_image ), $tz_dm.teaser_image.has_content )}
    {set $tz_img = $tz_dm.teaser_image}
{elseif and( is_set( $tz_dm.image ), $tz_dm.image.has_content )}
    {set $tz_img = $tz_dm.image}
{/if}
<div class="view-type view-type-{first_set( $view_type, 'teaser_bg_matrix' )|wash} chess">
    <div class="top">
        {if and( is_set( $tz_dm.headline ), $tz_dm.headline.has_content )}
            <span class="headline">
                <span class="ezstring-field">{$tz_dm.headline.content|wash}</span>
            </span>
        {/if}

        <h2>
            {include uri='design:content/item_parts/title.tpl' it_node=$node}
        </h2>

        {include uri='design:content/item_parts/intro.tpl' in_node=$node}

        <a class="btn-more" href={$node.object.main_node.url_alias|ezurl}>{'MORE'|i18n( 'design/starter/content' )}</a>
    </div>

        <div class="bottom"{if $tz_img} style="background-image: url( {$tz_img.content['cjw_i480'].url|ezroot( 'no' )} );"{/if}></div>
</div>
{undef $tz_dm $tz_img}
