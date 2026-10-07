{* Item view "standard" of a news item (v2: cjw_app/content/standard/ng_news.html.twig): linked unless the body
   is empty and there is no related object; the link may lead to the related object or an url.
   Parameters: node, view_type, with_intro. *}
{def $sn_dm = $node.data_map
     $sn_link = true()}
{if and( is_set( $sn_dm.body ), $sn_dm.body.has_content|not )}{set $sn_link = false()}{/if}
{if and( is_set( $sn_dm.related_object ), $sn_dm.related_object.has_content )}{set $sn_link = true()}{/if}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-news vl1">
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=cond( $sn_link, $node.url_alias|ezurl( 'no' ), '' )}

    <header class="article-header">
        <h2 class="title">
            {if $sn_link}
                <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$node}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a>
            {else}
                {include uri='design:content/item_parts/title.tpl' it_node=$node}
            {/if}
        </h2>
        <div class="info">
            {include uri='design:content/item_parts/info.tpl' if_node=$node}
        </div>
    </header>

    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
{undef $sn_dm $sn_link}
