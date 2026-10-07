{* Item view "40_60_img_left_plus_list" of a folder (v2: cjw_app/content/container/ng_container.html.twig with
   image_position left): image left (lightbox link), title, intro, and with the list block's children_submenu
   the folder's shortcuts and articles as a menu (list_icons, list, else tags).
   Parameters: node, view_type, children_submenu. *}
{def $c46_vt = first_set( $view_type, '40_60_img_left_plus_list' )
     $c46_dm = $node.data_map
     $c46_nobody = and( is_set( $c46_dm.body ), $c46_dm.body.has_content|not )
     $c46_alias = 'cjw_i1200_16-9'
     $c46_menu = first_set( $children_submenu, 'none' )
     $c46_children = array()}
{if and( is_set( $c46_dm.image_crop ), $c46_dm.image_crop.data_int|not )}{set $c46_alias = 'cjw_i770'}{/if}
<article
    class="view-type view-type-line view-type-{$c46_vt|wash}">
    <div class="row">

            <header class="article-header-md">
                <h1 class="title">
                    {include uri='design:content/item_parts/title.tpl' it_node=$node}
                    {if and( is_set( $c46_dm.sub_title ), $c46_dm.sub_title.has_content )}
                        <small>
                            {$c46_dm.sub_title.content|wash}
                        </small>
                    {/if}
                </h1>
            </header>
            <div class="col-12 col-sm-12 col-md-12 col-lg-4dot8 image-left">
                {if $c46_nobody}
                    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias=$c46_alias}
                {elseif and( is_set( $c46_dm.image ), $c46_dm.image.has_content )}
                    <a href="{$c46_dm.image.content['cjw_i1200'].url|ezroot( 'no' )}"
                       data-fancybox="{$c46_vt|wash}" alt="{$c46_dm.image.content.alternative_text|wash}">
                        {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i770'}
                    </a>
                {/if}
            </div>

        <div class="col-12 col-sm-12 col-md-12 col-lg-7dot2 article-content">
            <header class="article-header">
                <h1 class="title">
                    {include uri='design:content/item_parts/title.tpl' it_node=$node}
                    {if and( is_set( $c46_dm.sub_title ), $c46_dm.sub_title.has_content )}
                        <small>
                            {$c46_dm.sub_title.content|wash}
                        </small>
                    {/if}
                </h1>
            </header>

            <div class="short">
                {if and( is_set( $c46_dm.full_intro ), $c46_dm.full_intro.has_content )}
                    {include uri='design:content/item_parts/xml.tpl' ix_attr=$c46_dm.full_intro}
                {elseif and( is_set( $c46_dm.teaser_intro ), $c46_dm.teaser_intro.has_content )}
                    {include uri='design:content/item_parts/xml.tpl' ix_attr=$c46_dm.teaser_intro}
                {/if}

                {if and( is_set( $c46_dm.body ), $c46_dm.body.has_content )}
                    <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$node rl_class='read-more'}>
                        {'Read more'|i18n( 'design/starter/content' )}
                    </a>
                {/if}
            </div>

            {if $c46_menu|ne( 'none' )}
                {set $c46_children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                                     'class_filter_type', 'include',
                                                                     'class_filter_array', array( 'ng_shortcut', 'ng_article' ),
                                                                     'attribute_filter', array( array( 'priority', '>=', 0 ) ),
                                                                     'sort_by', $node.sort_array ) )}
                {if $c46_children|count|gt( 0 )}
                    {if $c46_menu|eq( 'list_icons' )}
                        <div class="row container-menu-list_icons">
                            {foreach $c46_children as $c46_child}
                                <div class="col-12 col-sm-6">
                                    <div class="col">
                                        {if and( is_set( $c46_child.data_map.icon_title ), $c46_child.data_map.icon_title.has_content )}
                                            <img src="{$c46_child.data_map.icon_title.content['cjw_i160'].url|ezroot( 'no' )}"
                                                 alt="{$c46_child.data_map.icon_title.content.alternative_text|wash}"/>
                                        {/if}
                                            <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$c46_child}>
                                                {$c46_child.name|wash}
                                            </a>
                                    </div>
                                </div>
                            {/foreach}
                        </div>
                    {elseif $c46_menu|eq( 'list' )}
                        <div class="row container-menu-list">
                            {foreach $c46_children as $c46_child}
                                <div class="col-xxs-12 col-sm-6">
                                    <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$c46_child}>
                                        {$c46_child.name|wash}
                                    </a>
                                </div>
                            {/foreach}
                        </div>
                    {else}
                        <div class="row container-menu-tags">
                            {foreach $c46_children as $c46_child}
                                <div class="col-xxs-12 col-sm-6 col-md-4">
                                    <a {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$c46_child}>
                                        {$c46_child.name|wash}
                                    </a>
                                </div>
                            {/foreach}
                        </div>
                    {/if}
                {/if}
            {/if}
        </div>

    </div>
</article>
{undef $c46_vt $c46_dm $c46_nobody $c46_alias $c46_menu $c46_children}
