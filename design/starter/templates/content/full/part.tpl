{* One part of the full view of the page's node, for a tpl block (v2: a twig_block renders the Twig block of
   that name from the node's full view template). Draws nothing without a content node or for a class
   without a full view template (cjw_jumper.ini [FullViews] Classes).
   Input: fp_part; the page layout's $pl_node. *}
{if and( is_set( $pl_node ), $pl_node, ezini( 'FullViews', 'Classes', 'cjw_jumper.ini' )|contains( $pl_node.class_identifier ) )}
{include uri=concat( 'design:content/full/', $pl_node.class_identifier, '.tpl' ) node=$pl_node part=$fp_part}
{/if}
