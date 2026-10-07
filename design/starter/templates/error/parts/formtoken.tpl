{* Kernel error 6 (form token refused) in the look of the design starter: the v2 "site-error" box. The wording is
   the kernel's (context design/standard/error/formtoken, translated in every language). Included by the standard
   error/kernel/6.tpl with reason, reload_url, home_url, signed_out, login_form. *}
<div class="site-error formtoken-error formtoken-{$reason|wash}" role="alert">
	    <h1>{'This form has expired'|i18n( 'design/standard/error/formtoken' )}</h1>

	    <div>{'The page with this form was open for a long time, or the form was sent from another page. To keep your information safe, nothing was saved.'|i18n( 'design/standard/error/formtoken' )} {'Reload the form and send it again.'|i18n( 'design/standard/error/formtoken' )}{if $signed_out} {'You may have been signed out in the meantime. If so, please sign in again.'|i18n( 'design/standard/error/formtoken' )}{elseif and( is_set( $login_form ), $login_form )} {'If you were signing in, please sign in again.'|i18n( 'design/standard/error/formtoken' )}{/if}</div>

	    <p class="mt-4"><a class="btn btn-primary" href="{$reload_url|wash}">{'Reload the form'|i18n( 'design/standard/error/formtoken' )}</a> <a class="btn btn-secondary" href="{$home_url|wash}">{'Go to the front page'|i18n( 'design/standard/error/formtoken' )}</a></p>
	</div>
