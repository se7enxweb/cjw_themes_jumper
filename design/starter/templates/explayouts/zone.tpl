{* The blocks of a zone, in their order (v2: nglayouts/themes/cjw_app/zone/zone.html.twig). The section around
   it belongs to the layout type's template. Top-level blocks: parent 0, or a parent that is the zone's root
   block (a block without definition, as Netgen Layouts stores one per zone). *}
{def $zn_roots = array( 0 )}
{foreach $zone.blocks as $zn_block}
    {if and( is_set( $zn_block.definition_identifier ), $zn_block.definition_identifier|eq( '' ) )}{set $zn_roots = $zn_roots|append( $zn_block.id )}{/if}
{/foreach}
{foreach $zone.blocks as $zn_block}
    {if and( is_set( $zn_block.definition_identifier ), $zn_block.definition_identifier|ne( '' ), $zn_roots|contains( first_set( $zn_block.parent_id, 0 ) ) )}
{include uri='design:explayouts/block/block.tpl' block=$zn_block zone=$zone}
    {/if}
{/foreach}
{undef $zn_roots}
