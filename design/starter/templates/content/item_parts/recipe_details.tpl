{* The preparation time and calories of a recipe (v2 app templates, span.recipe-details). Parameter: rd_node. *}
{def $rdd_dm = $rd_node.data_map}
                <span class="recipe-details">
                    {if and( is_set( $rdd_dm.preparation_time ), $rdd_dm.preparation_time.has_content )}
                        <span><i class="far fa-clock"></i> <span class="ezinteger-field">{$rdd_dm.preparation_time.content|wash}</span> {'Min'|i18n( 'design/starter/content' )}</span>
                    {/if}
                    {if and( is_set( $rdd_dm.serving_calories ), $rdd_dm.serving_calories.has_content )}
                        <span><i class="fas fa-fire"></i> <span class="ezinteger-field">{$rdd_dm.serving_calories.content|wash}</span> {'Cal'|i18n( 'design/starter/content' )}</span>
                    {/if}
                </span>
{undef $rdd_dm}
