{* Embed of an image node in rich text: content/embed/image.tpl. *}
{include uri='design:content/embed/image.tpl' ei_object=$node.object ei_params=first_set( $object_parameters, hash() ) ei_link=first_set( $link_parameters, hash() )}
