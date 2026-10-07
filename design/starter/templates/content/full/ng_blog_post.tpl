{* Full view of ng_blog_post (v2: app/content/full/ng_blog_post.html.twig). v2's structured data block (JSON-LD
   in the page head) is not drawn. part = 'content' (the whole view) or the Twig block names article_header,
   image, body; other names draw nothing. Input: node, part. *}
{def $fb_part = first_set( $part, 'content' )
     $fb_map = $node.data_map}
{def $fb_all = $fb_part|eq( 'content' )}
{if $fb_all}
    <article class="view-type view-type-full ng-blog-post vf1">
{/if}
{if or( $fb_all, $fb_part|eq( 'article_header' ) )}
        {include uri='design:content/parts/article_header_info.tpl' ah_node=$node ah_time=true()}
{/if}
{if $fb_all}

        <div class="container">
{/if}
{if or( $fb_all, $fb_part|eq( 'image' ) )}
                {if $fb_map.image.has_content}
                    <div class="full-article-image">
                        {include uri='design:content/parts/related_multimedia.tpl' rm_node=$node}
                    </div>
                {/if}
{/if}
{if $fb_all}

            <div class="full-article-content">
{/if}
{if or( $fb_all, $fb_part|eq( 'body' ) )}
                    <div class="full-article-body">
                        {if $fb_map.full_intro.has_content}
                            <div class="article-intro">
                                <div class="ezxmltext-field">{$fb_map.full_intro.content.output.output_text}</div>
                            </div>
                        {/if}

                        {if $fb_map.body.has_content}
                            <div class="ezxmltext-field">{$fb_map.body.content.output.output_text}</div>
                        {/if}

                        {include uri='design:content/parts/article_tags.tpl' at_node=$node}
                    </div>
{/if}
{if $fb_all}

            </div>
        </div>
    </article>
{/if}
{undef $fb_part $fb_map $fb_all}
