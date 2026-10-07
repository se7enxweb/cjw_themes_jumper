{* Kernel error 1 (access denied): v2's 403 page. A visitor who is not signed in also gets the kernel's embedded
   sign-in form ($embed_content, the design's user/login.tpl), which brings them back to the page afterwards. *}
{include uri='design:error/parts/site_error.tpl'
         title='This is a restricted area'|i18n( 'design/starter/error' )
         message='You don\'t have necessary permissions to access this page.'|i18n( 'design/starter/error' )
         extra=cond( and( is_set( $embed_content ), eq( $current_user.contentobject_id, $anonymous_user_id ) ), $embed_content, '' )}
