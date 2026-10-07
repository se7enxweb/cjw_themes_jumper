{* Item view "listitem_with_intro" (v2 content_view.yml: the listitem templates with with_intro = true; the
   view type name stays in the markup). Parameters: node, view_type. *}
{def $lwi_tpl = item_view_template( 'listitem', $node.class_identifier )}
{if $lwi_tpl|ne( '' )}{include uri=concat( 'design:', $lwi_tpl ) node=$node view_type=first_set( $view_type, 'listitem_with_intro' ) with_intro=true()}{/if}
{undef $lwi_tpl}
