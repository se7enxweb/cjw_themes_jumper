{* Item view "event" (v2: cjw_app/content/event.html.twig): the date (day, English month abbreviation as
   v2's Twig date filter prints it) from publish_date, published_from, else the publication date; the image
   (teaser_image, else image, cjw_i480); title and intro, linked unless the body is empty (a related object
   or url always links). Parameters: node, view_type. *}
{def $ev_dm = $node.data_map
     $ev_link = true()
     $ev_ts = $node.object.published
     $ev_img = false()
     $ev_months = array( 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' )}
{if and( is_set( $ev_dm.body ), $ev_dm.body.has_content|not )}{set $ev_link = false()}{/if}
{if or( and( is_set( $ev_dm.related_object ), $ev_dm.related_object.has_content ), and( is_set( $ev_dm.link ), $ev_dm.link.has_content ) )}{set $ev_link = true()}{/if}
{if and( is_set( $ev_dm.publish_date ), $ev_dm.publish_date.has_content )}
    {set $ev_ts = $ev_dm.publish_date.content.timestamp}
{elseif and( is_set( $ev_dm.published_from ), $ev_dm.published_from.has_content )}
    {set $ev_ts = $ev_dm.published_from.content.timestamp}
{/if}
{if and( is_set( $ev_dm.teaser_image ), $ev_dm.teaser_image.has_content )}
    {set $ev_img = $ev_dm.teaser_image}
{elseif and( is_set( $ev_dm.image ), $ev_dm.image.has_content )}
    {set $ev_img = $ev_dm.image}
{/if}
<article class="view-type view-type-{first_set( $view_type, 'event' )|wash} {$node.class_identifier|explode( '_' )|implode( '-' )}">
    <div class="container">
        <div class="row">
            <div class="col-3 col-sm-4 col-md-4 col-lg-4 article-image">
                    <div class="date">
                        <span class="day">{$ev_ts|datetime( 'custom', '%d' )}</span>
                        {$ev_months[$ev_ts|datetime( 'custom', '%m' )|int|dec]}
                    </div>

                <figure class="image">
                    {if $ev_img}
                        {if $ev_link}
                        <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$node}>
                            <img src="{$ev_img.content['cjw_i480'].url|ezroot( 'no' )}" alt="{cond( $ev_img.content.alternative_text|ne( '' ), $ev_img.content.alternative_text, $node.name )|wash}" />
                        </a>
                        {else}
                            <img src="{$ev_img.content['cjw_i480'].url|ezroot( 'no' )}" alt="{$ev_img.content.alternative_text|wash}" />
                        {/if}
                    {/if}
                </figure>
            </div>

            <div class="col-8 article-content">
                <header class="article-header">
                    <h2 class="title">
                        {if $ev_link}
                            <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$node}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a>
                        {else}
                            {include uri='design:content/item_parts/title.tpl' it_node=$node}
                        {/if}
                    </h2>
                </header>

                <div class="short">
                    {include uri='design:content/item_parts/intro.tpl' in_node=$node}
                </div>
            </div>
        </div>
    </div>
</article>
{undef $ev_dm $ev_link $ev_ts $ev_img $ev_months}
