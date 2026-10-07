{* The map of a location field below the body, in a "Weiterlesen"-style toggle block (v2: the end of block body of
   cjw_app/content/full/ng_article and ng_news, the labels hard-coded in German there).
   Input: lm_node. Draws nothing without a filled field "location". *}
{if and( is_set( $lm_node.data_map.location ), $lm_node.data_map.location.has_content )}
                            <br />

                            <div class="toggle-block  state-opened">
                                <div class="control">
                                    <span class="text-is-closed"><strong>{'Map:'|i18n( 'design/starter/full' )}</strong> {'Open'|i18n( 'design/starter/full' )}</span>
                                    <span class="text-is-opened"><strong>{'Map:'|i18n( 'design/starter/full' )}</strong> {'Close'|i18n( 'design/starter/full' )}</span>
                                </div>

                                <div class="content">
                                    {include uri='design:content/parts/leaflet_map_single.tpl' lm_node=$lm_node}

                                    <div style="clear: both; height: 1px;"></div>
                                </div>
                            </div>
{/if}
