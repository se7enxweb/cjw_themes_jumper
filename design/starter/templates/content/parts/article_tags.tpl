{* The tags below an app article body (v2: app ng_blog_post / ng_recipe, full-article-tags). Input: at_node. *}
{if and( is_set( $at_node.data_map.tags ), $at_node.data_map.tags.has_content )}
                            <div class="full-article-tags">
                                {foreach $at_node.data_map.tags.content.tags as $at_tag}
                                    <a href={concat( 'tags/view/', $at_tag.url )|ezurl}>{$at_tag.keyword|wash}</a>
                                {/foreach}
                            </div>
{/if}
