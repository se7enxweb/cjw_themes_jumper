{* v2's CJW spacer block (NetgenLayoutsExtendedBundle): spacer/line.tpl or spacer/image.tpl. *}
{include uri=concat( 'design:explayouts/block/spacer/', cond( first_set( $block.view_type, '' )|eq( 'image' ), 'image', 'line' ), '.tpl' ) block=$block}
