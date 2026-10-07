{* Full view of ng_recipe (v2: app/content/full/ng_recipe.html.twig). v2's structured data block (JSON-LD in the
   page head) is not drawn. part = 'content' (the whole view) or the Twig block names article_header, image,
   body, recipe_info; other names draw nothing. Input: node, part. *}
{def $fr_part = first_set( $part, 'content' )
     $fr_map = $node.data_map}
{def $fr_all = $fr_part|eq( 'content' )}
{if $fr_all}
    <article class="view-type view-type-full ng-recipe vf1">
{/if}
{if or( $fr_all, $fr_part|eq( 'article_header' ) )}
        {include uri='design:content/parts/article_header_info.tpl' ah_node=$node ah_time=false()}
{/if}
{if $fr_all}

        <div class="container">
{/if}
{if or( $fr_all, $fr_part|eq( 'image' ) )}
                {if or( $fr_map.image.has_content, $fr_map.related_multimedia.has_content )}
                    <div class="full-article-image">
                        {include uri='design:content/parts/related_multimedia.tpl' rm_node=$node}
                    </div>
                {/if}
{/if}
{if $fr_all}

            <div class="full-article-content">
{/if}
{if or( $fr_all, $fr_part|eq( 'body' ) )}
                    <div class="full-article-body">
                        {if $fr_map.full_intro.has_content}
                            <div class="article-intro">
                                <div class="ezxmltext-field">{$fr_map.full_intro.content.output.output_text}</div>
                            </div>
                        {/if}

                        {if $fr_map.body.has_content}
                            <div class="ezxmltext-field">{$fr_map.body.content.output.output_text}</div>
                        {/if}

                        {include uri='design:content/parts/article_tags.tpl' at_node=$node}
                    </div>
{/if}
{if or( $fr_all, $fr_part|eq( 'recipe_info' ) )}
                    <div class="full-recipe-info">
                        {if $fr_map.serving_calories.has_content}
                            <div class="recipe-calories">
                                <span class="ezinteger-field">{$fr_map.serving_calories.content}</span> {'cal'|i18n( 'design/starter/full' )}
                            </div>
                        {/if}

                        <ul class="recipe-serving-info">
                            {if $fr_map.serving_fat.has_content}
                                <li><span class="ezinteger-field">{$fr_map.serving_fat.content}</span> <span class="tt">{'fat'|i18n( 'design/starter/full' )}</span></li>
                            {/if}
                            {if $fr_map.serving_carbohydrates.has_content}
                                <li><span class="ezinteger-field">{$fr_map.serving_carbohydrates.content}</span> <span class="tt">{'carbs'|i18n( 'design/starter/full' )}</span></li>
                            {/if}
                            {if $fr_map.serving_protein.has_content}
                                <li><span class="ezinteger-field">{$fr_map.serving_protein.content}</span> <span class="tt">{'protein'|i18n( 'design/starter/full' )}</span></li>
                            {/if}
                        </ul>

                        {if $fr_map.preparation_time.has_content}
                            <div class="recipe-time">
                                {'Preparation time'|i18n( 'design/starter/full' )}
                                <time><span class="ezinteger-field">{$fr_map.preparation_time.content}</span> {'min'|i18n( 'design/starter/full' )}</time>
                            </div>
                        {/if}
                    </div>
{/if}
{if $fr_all}

            </div>
        </div>
    </article>
{/if}
{undef $fr_part $fr_map $fr_all}
