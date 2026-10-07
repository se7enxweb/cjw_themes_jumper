{* The header of v2's app article views (ng_blog_post, ng_recipe: block article_header): the sponsored tag or the
   main topic, the title, the authors and (with ah_time) the publishing date.
   Input: ah_node, ah_time (true: print the date, as ng_blog_post does). *}
{def $ah_map = $ah_node.data_map}
            <header class="full-page-header full-article-header">
                <div class="container">
                    {if and( is_set( $ah_map.sponsored_content_disclosure ), $ah_map.sponsored_content_disclosure.has_content )}
                        <div class="full-page-sponsored-tag">
                            <span>{$ah_map.sponsored_content_disclosure.content|wash}</span>
                        </div>
                    {elseif and( is_set( $ah_map.main_topic ), $ah_map.main_topic.has_content )}
                        <div class="full-page-main-tag">
                            <a href={concat( 'tags/view/', $ah_map.main_topic.content.tags.0.url )|ezurl}>{$ah_map.main_topic.content.tags.0.keyword|wash}</a>
                        </div>
                    {/if}
                    <h1 class="full-page-title"><span class="ezstring-field">{$ah_map.title.content|wash}</span></h1>
                    <div class="full-page-info">
                        {if and( is_set( $ah_map.authors ), $ah_map.authors.has_content )}
                            By
                            {foreach $ah_map.authors.content.relation_list as $ah_rel}
                                {def $ah_author = fetch( 'content', 'object', hash( 'object_id', $ah_rel.contentobject_id ) )}
                                {if $ah_author}<a href={$ah_author.main_node.url_alias|ezurl} class="article-author">{$ah_author.name|wash}</a>{/if}
                                {undef $ah_author}
                            {/foreach}{if $ah_time} –{/if}
                        {/if}
                        {if $ah_time}
                            <time>{include uri='design:content/parts/date_english.tpl' de_time=$ah_node.object.published}</time>
                        {/if}
                    </div>
                </div>
            </header>
{undef $ah_map}
