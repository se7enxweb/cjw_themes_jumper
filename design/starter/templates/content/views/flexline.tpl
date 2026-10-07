{* Item view "flexline" for classes without their own flexline template (v2 content_view.yml: the line
   template without an image position, so the image on the right). Parameters: node, view_type. *}
{include uri='design:content/views/line.tpl' node=$node view_type=first_set( $view_type, 'flexline' ) ln_position='right'}
