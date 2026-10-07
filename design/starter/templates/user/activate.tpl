{* Account activation (kernel user/activate), in v2's markup (themes/app/user/activate_done.html.twig and
   activate_admin_activation_pending.html.twig). *}
        <div class="full-form-content">
        {if $account_activated}
        <div class="full-form-response">
            {if $is_pending}
            <p>{'Your account was successfully created. Before you can log into the site, your account must be activated by the site administrator. You will receive an email confirming activation of your account soon.'|i18n( 'design/starter/user' )}</p>
            {else}
            <p>{'Your account has been activated. You can now <a href="%link">log in here</a>.'|i18n( 'design/starter/user', '', hash( '%link', '/user/login'|ezurl( 'no' ) ) )}</p>
            {/if}
        </div>
        {elseif $already_active}
        <div class="full-form-response">
            <p>{'Your account is already active.'|i18n( 'design/starter/user' )} <a href={'/user/login'|ezurl}>{'Log in'|i18n( 'design/starter/user' )}</a></p>
        </div>
        {else}
        <div class="alert alert-danger">{'The activation key is not valid or has been used.'|i18n( 'design/starter/user' )}</div>
        {/if}
    </div>
