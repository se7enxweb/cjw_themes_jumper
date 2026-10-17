{* The speech bubble of a header image (v2 page_header.html.twig): its first ng_shortcut child, with a close link
   and the icon that opens it again. Input: $shortcut (node). *}
                <div class="speechbubble">
                    <a {include uri='design:parts/shortcut_link_attributes.tpl' shortcut=$shortcut}>
                        <h3><span class="ezstring-field">{$shortcut.data_map.title.content|wash}</span></h3>
{if and( is_set( $shortcut.data_map.teaser_intro ), $shortcut.data_map.teaser_intro.has_content )}
                        <div class="ezxmltext-field">{$shortcut.data_map.teaser_intro.content.output.output_text}</div>
{/if}
                    </a>

                    <a href="#" class="close-link" data-cjw-bubble="close">
                        <img src={'icons/close_white.png'|ezimage} alt="{'Close'|i18n( 'design/starter/pagelayout' )|wash}"/>
                    </a>
                </div>

                <a href="#" class="speechbubble-icon" data-cjw-bubble="open">
                    <img src={'icons/open-speechbubble.png'|ezimage} alt="{'Close'|i18n( 'design/starter/pagelayout' )|wash}"/>
                </a>
