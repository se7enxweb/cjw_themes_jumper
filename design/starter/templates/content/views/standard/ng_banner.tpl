{* Item view "standard" of a banner (v2: cjw_app/content/standard/ng_banner.html.twig): the image (cjw_i1920)
   as background, title linked only when the banner has a related object, the short description.
   Parameters: node, view_type. *}
{def $sb_dm = $node.data_map
     $sb_link = and( is_set( $sb_dm.related_object ), $sb_dm.related_object.has_content )}
    <article
        class="view-type view-type-{first_set( $view_type, 'standard' )|wash} banner"{if and( is_set( $sb_dm.image ), $sb_dm.image.has_content )} style="background-image: url( '{$sb_dm.image.content['cjw_i1920'].url|ezroot( 'no' )}' );"{/if}>
        <div class="article-content">
            <header class="article-header">
                <div class="title">
                    {if $sb_link}
                        <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$node}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a>
                    {else}
                        {include uri='design:content/item_parts/title.tpl' it_node=$node}
                    {/if}
                </div>
            </header>

            <div class="short">
                {include uri='design:content/item_parts/short_description.tpl' sd_node=$node sd_fields=array( 'teaser_intro', 'teaser_text', 'short_description', 'intro', 'description' )}
            </div>
        </div>
    </article>
{undef $sb_dm $sb_link}
