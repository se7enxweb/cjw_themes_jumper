{* v2's blog post byline in slides and galleries: the linked authors and a bar. Input: $gp_dm (data map). *}
{if and( is_set( $gp_dm.authors ), $gp_dm.authors.has_content )}
{foreach $gp_dm.authors.content.relation_list as $gp_rel}{def $gp_author = fetch( 'content', 'object', hash( 'object_id', $gp_rel.contentobject_id ) )}{if and( $gp_author, $gp_author.main_node )}
                    <a href={$gp_author.main_node.url_alias|ezurl} class="article-author">{$gp_author.name|wash}</a>
{/if}{undef $gp_author}{/foreach} |
{/if}
