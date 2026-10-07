{* v2: layouts-standard block/column.html.twig - the blocks of the placeholder "main", each in its own wrapper. *}
{def $co_id = $block.id}
{foreach $zone.blocks as $co_child}{if and( first_set( $co_child.parent_id, 0 )|eq( $co_id ), first_set( $co_child.placeholder, '' )|eq( 'main' ), first_set( $co_child.definition_identifier, '' )|ne( '' ) )}
{include uri='design:explayouts/block/block.tpl' block=$co_child zone=$zone}
{/if}{/foreach}
{undef $co_id}
