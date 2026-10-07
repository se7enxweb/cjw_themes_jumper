{* Full view of ng_news (v2: cjw_app/content/full/ng_news.html.twig): as ng_article, the intro falling back to
   the teaser intro and without the column of additional images.
   part = 'content' (the whole view) or one of the Twig block names content_header, title, intro,
   content_body, image, body; other names draw nothing.
   Input: node, part. *}
{def $fn_part = first_set( $part, 'content' )
     $fn_map = $node.data_map}
{def $fn_all = $fn_part|eq( 'content' )
     $fn_body = or( $fn_part|eq( 'content' ), $fn_part|eq( 'content_body' ) )}
{if $fn_all}
    <article class="view-type view-type-full ng-article vf1">
{/if}
{if or( $fn_all, $fn_part|eq( 'content_header' ), $fn_part|eq( 'title' ) )}
                <h1 class="title"><span class="ezstring-field">{$fn_map.title.content|wash}</span></h1>
{/if}
{if or( $fn_all, $fn_part|eq( 'content_header' ), $fn_part|eq( 'intro' ) )}
                {if $fn_map.full_intro.has_content}
                    <div class="article-intro">
                        <div class="ezxmltext-field">{$fn_map.full_intro.content.output.output_text}</div>
                    </div>
                {elseif $fn_map.teaser_intro.has_content}
                    <div class="article-intro">
                        <div class="ezxmltext-field">{$fn_map.teaser_intro.content.output.output_text}</div>
                    </div>
                {/if}
{/if}
{if $fn_body}
            <div class="container">
{/if}
{if or( $fn_body, $fn_part|eq( 'image' ) )}
                    {if or( $fn_map.image.has_content, $fn_map.related_multimedia.has_content )}
                        <div class="full-article-image">
                            {include uri='design:content/parts/related_multimedia.tpl' rm_node=$node}
                        </div>
                    {/if}
{/if}
{if $fn_body}

                <div class="full-article-content">
{/if}
{if or( $fn_body, $fn_part|eq( 'body' ) )}
                        {if $fn_map.body.has_content}
                            <div class="full-article-body">
                                <div class="ezxmltext-field">{$fn_map.body.content.output.output_text}</div>
                            </div>
                        {/if}
                        {include uri='design:content/parts/location_map_toggle.tpl' lm_node=$node}
{/if}
{if $fn_body}
                </div>
            </div>
            <div style="clear: both"></div>
{/if}
{if $fn_all}
    </article>
{/if}
{undef $fn_part $fn_map $fn_all $fn_body}
