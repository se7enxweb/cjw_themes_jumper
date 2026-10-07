{* v2's twig_block: one named part of the page, resolved by its block name (plan decision D-04: by name, in this
   design, not through sevenx_themes_media's tpl_block_template()). The names this design draws are listed in
   cjw_jumper.ini [LayoutSettings] TplBlockNames; the template is explayouts/tpl_block/<name>.tpl. *}
{def $tb_name = first_set( $block.parameters.block_name, first_set( $block.values.block_name, '' ) )}
{if and( $tb_name|ne( '' ), ezini( 'LayoutSettings', 'TplBlockNames', 'cjw_jumper.ini' )|contains( $tb_name ) )}
{include uri=concat( 'design:explayouts/tpl_block/', $tb_name, '.tpl' )}
{/if}
{undef $tb_name}
