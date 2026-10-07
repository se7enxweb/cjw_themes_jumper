{* Item view "standard" of an article (v2: cjw_app/content/standard/ng_article.html.twig): no link when the
   body is empty; with_intro adds full_intro as a collapsible part. Parameters: node, view_type, with_intro. *}
{def $sa_dm = $node.data_map
     $sa_link = true()}
{if and( is_set( $sa_dm.body ), $sa_dm.body.has_content|not )}{set $sa_link = false()}{/if}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-article vl1">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770' ip_link=cond( $sa_link, $node.url_alias|ezurl( 'no' ), '' )}

    <header class="article-header">
        <h2 class="title">
            {if $sa_link}<a href={$node.url_alias|ezurl}>{/if}
                {include uri='design:content/item_parts/title.tpl' it_node=$node}
            {if $sa_link}</a>{/if}
        </h2>
        <div class="info">
            {include uri='design:content/item_parts/info.tpl' if_node=$node}
        </div>
    </header>

    <section class="article-body">
        {if and( is_set( $sa_dm.teaser_intro ), $sa_dm.teaser_intro.has_content )}
            {include uri='design:content/item_parts/xml.tpl' ix_attr=$sa_dm.teaser_intro}
        {/if}
        {if and( first_set( $with_intro, false() ), is_set( $sa_dm.full_intro ), $sa_dm.full_intro.has_content )}
                    <div class="collapse" id="offer-body-{$node.contentobject_id}">
                        {include uri='design:content/item_parts/xml.tpl' ix_attr=$sa_dm.full_intro}
                    </div>

                    <a class="arrow collapsed"
                       data-toggle="collapse"
    data-target="#offer-body-{$node.contentobject_id}"></a>
        {/if}
    </section>
</article>
{undef $sa_dm $sa_link}
