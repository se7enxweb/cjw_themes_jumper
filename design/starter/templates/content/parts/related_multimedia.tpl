{* The images and videos of a full view (v2: ngsite.controller.parts:viewRelatedMultimediaItems with
   includeChildren and the content types image + ng_video, template common/parts/related_multimedia.html.twig).
   The items, in v2's order: the node itself, its image and ng_video children, then the objects of its
   related_multimedia field (a gallery stands for its image and ng_video children).
   More than one item draws a swiper slider, except two items of which the first has no image.
   Input: rm_node, the node of the full view. *}
{def $rm_items = array( $rm_node )
     $rm_children = fetch( 'content', 'list', hash( 'parent_node_id', $rm_node.node_id,
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'image', 'ng_video' ),
                                                    'sort_by', $rm_node.sort_array,
                                                    'limit', 25 ) )}
{set $rm_items = $rm_items|merge( $rm_children )}
{if and( is_set( $rm_node.data_map.related_multimedia ), $rm_node.data_map.related_multimedia.has_content )}
    {foreach $rm_node.data_map.related_multimedia.content.relation_list as $rm_relation}
        {def $rm_related = fetch( 'content', 'object', hash( 'object_id', $rm_relation.contentobject_id ) )}
        {if and( $rm_related, $rm_related.main_node )}
            {if $rm_related.class_identifier|eq( 'ng_gallery' )}
                {set $rm_items = $rm_items|merge( fetch( 'content', 'list', hash( 'parent_node_id', $rm_related.main_node_id,
                                                                                    'class_filter_type', 'include',
                                                                                    'class_filter_array', array( 'image', 'ng_video' ),
                                                                                    'sort_by', $rm_related.main_node.sort_array,
                                                                                    'limit', 25 ) ) )}
            {else}
                {set $rm_items = $rm_items|append( $rm_related.main_node )}
            {/if}
        {/if}
        {undef $rm_related}
    {/foreach}
{/if}
{def $rm_slider = $rm_items|count|gt( 1 )}
{if and( $rm_items|count|eq( 2 ), is_set( $rm_items[0].data_map.image ), $rm_items[0].data_map.image.has_content|not )}
    {set $rm_slider = false()}
{/if}
{if $rm_slider}
        <div class="related-multimedia swiper-container">
            <div class="swiper-wrapper">
{else}
        <div>
{/if}
{foreach $rm_items as $rm_item}
{include uri='design:content/parts/related_multimedia_item.tpl' rmi_node=$rm_item rmi_slider=$rm_slider}
{/foreach}
{if $rm_slider}
            </div>
            <div class="swiper-navigation">
                <div class="swiper-pagination"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        </div>
{else}
        </div>
{/if}
{undef $rm_items $rm_children $rm_slider}
