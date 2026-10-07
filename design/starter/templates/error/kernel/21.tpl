{* Kernel error 21 (view not found): to a visitor a page that is not there, so v2's 404 page. *}
{include uri='design:error/parts/site_error.tpl'
         title='This page does not exist'|i18n( 'design/starter/error' )
         message='The requested page could not be found. Please use main navigation or search to find what you are looking for.'|i18n( 'design/starter/error' )}
