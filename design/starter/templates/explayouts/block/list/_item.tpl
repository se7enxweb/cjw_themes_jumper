{* One item of a list or gallery block, drawn in its item view: content/views/<view>/<class>.tpl, else
   content/views/<view>.tpl (v2: nglayouts_render_result / ng_view_content with the block's item view type).
   Input: $item (node), $ivt (item view type), $block. Extra input for the views: $image_type (gallery_thumb).
   A block switched in the editor to a view type without an item view select (grid tiles, every gallery) keeps the
   item view it had (the editor posts the stored value), so the view types that can draw one item view only always
   draw that one ($it_fixed: grid_tiles tile, the galleries their own, list_zigzag and list_accordion theirs); the
   item views zigzag and accordion belong to their list view types only, any other view type draws standard. *}
{def $it_ivt = $ivt
     $it_vt = first_set( $block.view_type, '' )
     $it_fixed = hash( 'grid_tiles', 'tile', 'list_zigzag', 'zigzag', 'list_accordion', 'accordion',
                    'carousel', 'carousel', 'grid_gallery', 'gallery_grid', 'slider', 'slide', 'thumb_gallery', 'gallery_thumb',
                    'grid_gallery_fixed_height', 'gallery_grid_fixed_height', 'grid_gallery_fixed_width', 'gallery_grid_fixed_width' )}
{if is_set( $it_fixed[$it_vt] )}
    {set $it_ivt = $it_fixed[$it_vt]}
{elseif and( array( 'zigzag', 'accordion' )|contains( $it_ivt ), array( 'list_zigzag', 'list_accordion' )|contains( $it_vt )|not )}
    {set $it_ivt = 'standard'}
{/if}
{def $it_tpl = item_view_template( $it_ivt, $item.class_identifier )}
{if $it_tpl|ne( '' )}{include uri=concat( 'design:', $it_tpl ) node=$item view_type=$it_ivt children_submenu=first_set( $block.parameters.children_submenu, 'none' ) block=$block image_type=first_set( $image_type, '' )}{/if}
{undef $it_tpl $it_ivt $it_vt $it_fixed}
