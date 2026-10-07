{* Kernel error 4 (moved): the kernel redirects to the new location; this page shows only when it cannot. *}
{include uri='design:error/parts/site_error.tpl'
         title='This page has moved'|i18n( 'design/starter/error' )
         message='The page is no longer available at this address.'|i18n( 'design/starter/error' )
         extra=cond( and( is_set( $parameters.new_location ), $parameters.new_location|ne( '' ) ), concat( '<p><a href=', $parameters.new_location|ezurl, '>', $parameters.new_location|ezurl( 'no' )|wash, '</a></p>' ), '' )}
