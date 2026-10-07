{* Item view "standard" of a recipe (v2: app/content/standard/ng_recipe.html.twig). *}
{def $sr_dm = $node.data_map}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-recipe vl1">
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_link=$node.url_alias|ezurl( 'no' )}

    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
        <div class="info">
            {include uri='design:content/item_parts/info.tpl' if_node=$node}
            <span class="recipe-details">
                {if and( is_set( $sr_dm.preparation_time ), $sr_dm.preparation_time.has_content )}
                    <span><i class="far fa-clock"></i> <span class="ezinteger-field">{$sr_dm.preparation_time.content|wash}</span> {'Min'|i18n( 'design/starter/content' )}</span>
                {/if}
                {if and( is_set( $sr_dm.serving_calories ), $sr_dm.serving_calories.has_content )}
                    <span><i class="fas fa-fire"></i> <span class="ezinteger-field">{$sr_dm.serving_calories.content|wash}</span> {'Cal'|i18n( 'design/starter/content' )}</span>
                {/if}
            </span>
        </div>
    </header>

    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
{undef $sr_dm}
