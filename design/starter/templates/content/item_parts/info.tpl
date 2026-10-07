{* The info line of an article-like item (v2 app templates): the authors (unless if_no_authors), the publish
   date (if_time, v2 format "j M Y"), then the sponsored note or the main topic. Parameters: if_node,
   if_no_authors, if_time. *}
{def $ifi_dm = $if_node.data_map}
{if and( first_set( $if_no_authors, false() )|not, is_set( $ifi_dm.authors ), $ifi_dm.authors.has_content )}
    {foreach $ifi_dm.authors.content.relation_list as $ifi_rel}
        {def $ifi_author = fetch( 'content', 'object', hash( 'object_id', $ifi_rel.contentobject_id ) )}
        {if and( $ifi_author, $ifi_author.main_node )}<a href={$ifi_author.main_node.url_alias|ezurl} class="article-author">{$ifi_author.name|wash}</a>{/if}
        {undef $ifi_author}
    {/foreach}
{/if}
{if and( first_set( $if_time, false() ), is_set( $ifi_dm.publish_date ), $ifi_dm.publish_date.has_content )}
            <time>{$ifi_dm.publish_date.content.timestamp|datetime( 'custom', '%j %M %Y' )}</time>
{/if}
{if and( is_set( $ifi_dm.sponsored_content_disclosure ), $ifi_dm.sponsored_content_disclosure.has_content )}
                <span class="sponsored-tag">{'Sponsored'|i18n( 'design/starter/content' )}</span>
{elseif and( is_set( $ifi_dm.main_topic ), $ifi_dm.main_topic.has_content, $ifi_dm.main_topic.content.tags|count|gt( 0 ) )}
                <a href="{ngsite_topic_path( $ifi_dm.main_topic.content.tags[0].id )|ezurl( 'no' )}">{$ifi_dm.main_topic.content.tags[0].keyword|wash}</a>
{/if}
{undef $ifi_dm}
