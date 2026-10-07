{* v2 title block: drawn by its view type, title/<view type>.tpl (title, title_centered, section,
   section_centered, boat_blue, boat_brown). An unknown view type is drawn as a plain title. *}
{def $tb_vt = first_set( $block.view_type, '' )}
{if array( 'title', 'title_centered', 'centered', 'section', 'section_centered', 'boat_blue', 'boat_brown' )|contains( $tb_vt )|not}{set $tb_vt = 'title'}{/if}
{include uri=concat( 'design:explayouts/block/title/', $tb_vt, '.tpl' ) block=$block}
{undef $tb_vt}
