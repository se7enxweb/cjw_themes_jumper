{* One item of a list or gallery block, drawn in its item view: content/views/<view>/<class>.tpl, else
   content/views/<view>.tpl (v2: nglayouts_render_result / ng_view_content with the block's item view type).
   Input: $item (node), $ivt (item view type), $block. Extra input for the views: $image_type (gallery_thumb). *}
{def $it_tpl = item_view_template( $ivt, $item.class_identifier )}
{if $it_tpl|ne( '' )}{include uri=concat( 'design:', $it_tpl ) node=$item view_type=$ivt children_submenu=first_set( $block.parameters.children_submenu, 'none' ) block=$block image_type=first_set( $image_type, '' )}{/if}
{undef $it_tpl}
