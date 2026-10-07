{* Full view of ng_article (v2: cjw_app/content/full/ng_article.html.twig).
   v2's layouts draw parts of it through twig_block blocks; this template draws the part asked for:
   part = 'content' (the whole view: the full view block and pages without a layout), or one of the
   Twig block names content_header, title, intro, content_body, image, additional_image, body.
   Other names draw nothing, as v2 does for a block the template does not have.
   The event dates of v2 (fields event_start, event_end) are not drawn: the starter's ng_article has no such fields.
   Input: node, part. *}
{def $fa_part = first_set( $part, 'content' )
     $fa_map = $node.data_map}
{def $fa_all = $fa_part|eq( 'content' )
     $fa_body = or( $fa_part|eq( 'content' ), $fa_part|eq( 'content_body' ) )}
{if $fa_all}
    <article class="view-type view-type-full ng-article vf1">
{/if}
{if or( $fa_all, $fa_part|eq( 'content_header' ), $fa_part|eq( 'title' ) )}
                <h1 class="title"><span class="ezstring-field">{$fa_map.title.content|wash}</span></h1>
{/if}
{if or( $fa_all, $fa_part|eq( 'content_header' ), $fa_part|eq( 'intro' ) )}
                {if $fa_map.full_intro.has_content}
                    <div class="article-intro">
                        <div class="ezxmltext-field">{$fa_map.full_intro.content.output.output_text}</div>
                    </div>
                {/if}
{/if}
{if $fa_body}
            <div class="container">
                <div class="col-full-article-images">
{/if}
{if or( $fa_body, $fa_part|eq( 'image' ) )}
                        {if or( $fa_map.image.has_content, $fa_map.related_multimedia.has_content )}
                            <div class="full-article-image">
                                {include uri='design:content/parts/related_multimedia.tpl' rm_node=$node}
                            </div>
                        {/if}
{/if}
{if or( $fa_body, $fa_part|eq( 'additional_image' ) )}
                        {if or( $fa_map.additional_image.has_content, $fa_map.related_multimedia.has_content )}
                            <div class="full-article-image">
                                {include uri='design:content/parts/image_additional.tpl' ia_node=$node}
                            </div>
                        {/if}
{/if}
{if $fa_body}
                </div>

                <div class="full-article-content">
{/if}
{if or( $fa_body, $fa_part|eq( 'body' ) )}
                        {if $fa_map.body.has_content}
                            <div class="full-article-body">
                                <div class="ezxmltext-field">{$fa_map.body.content.output.output_text}</div>
                            </div>
                        {/if}
                        {include uri='design:content/parts/location_map_toggle.tpl' lm_node=$node}
{/if}
{if $fa_body}
                </div>
            </div>

            <div style="clear: both"></div>
{/if}
{if $fa_all}
    </article>
{/if}
{undef $fa_part $fa_map $fa_all $fa_body}
