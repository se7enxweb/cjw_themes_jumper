{* The images of a gallery as a row of lightbox thumbnails (v2: common/parts/related_multimedia_grid.html.twig with
   cjw_app/parts/related_multimedia/image_grid.html.twig): the gallery's image and video children, at most
   column_count of them (none without it, as in v2), each as wide as 100% divided by min(items, 3).
   Input: rg_node (the gallery node). *}
{def $rg_items = fetch( 'content', 'list', hash( 'parent_node_id', $rg_node.node_id,
                                                 'class_filter_type', 'include',
                                                 'class_filter_array', array( 'image', 'ng_video' ),
                                                 'sort_by', $rg_node.sort_array,
                                                 'limit', 25 ) )
     $rg_max = cond( and( is_set( $rg_node.data_map.column_count ), $rg_node.data_map.column_count.has_content ), $rg_node.data_map.column_count.content, 0 )}
{def $rg_divider = cond( $rg_items|count|le( 3 ), $rg_items|count, 3 )}
<div class="nglayouts-flex-row">
{foreach $rg_items as $rg_index => $rg_item}
    {if $rg_index|lt( $rg_max )}
<figure class="image-wrapper" style="width:{div( 100, $rg_divider )}%">
        {if and( is_set( $rg_item.data_map.image ), $rg_item.data_map.image.has_content )}
        {def $rg_image = $rg_item.data_map.image.content}
        <a href="{$rg_image['cjw_i1200'].url|ezroot( 'no' )}"
           title="{$rg_image.alternative_text|wash}" data-caption="{$rg_image.alternative_text|wash}" data-fancybox="embed">
            <img src="{$rg_image['cjw_i30'].url|ezroot( 'no' )}" data-src="{$rg_image['cjw_i770_16-9'].url|ezroot( 'no' )}" alt="{if $rg_image.alternative_text|ne( '' )}{$rg_image.alternative_text|wash}{else}{$rg_item.name|wash}{/if}" class="ezimage-field" />
        </a>
        {undef $rg_image}
        {/if}
</figure>
    {/if}
{/foreach}
</div>
{undef $rg_items $rg_max $rg_divider}
