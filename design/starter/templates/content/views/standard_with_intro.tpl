{* Item view "standard_with_intro" (v2 content_view.yml: the standard templates with with_intro = true). The
   view type name stays in the markup, as in v2. Parameters: node, view_type. *}
{def $swi_tpl = item_view_template( 'standard', $node.class_identifier )}
{if $swi_tpl|ne( '' )}{include uri=concat( 'design:', $swi_tpl ) node=$node view_type=first_set( $view_type, 'standard_with_intro' ) with_intro=true()}{/if}
{undef $swi_tpl}
