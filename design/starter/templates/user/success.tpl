{* After registering (kernel user/success), in v2's markup (themes/app/user/register_success.html.twig, and
   activate_sent.html.twig when the address has to be confirmed first). *}
        <div class="full-form-content">
        <div class="full-form-response">
        {if $verify_user_email}
            <p>{'We have sent you an e-mail with further instructions. Please check your inbox (and spam folder).'|i18n( 'design/starter/user' )}</p>
        {else}
            <p>{'Your account has successfully been created! You can now go ahead and <a href="%link">log in</a>.'|i18n( 'design/starter/user', '', hash( '%link', '/user/login'|ezurl( 'no' ) ) )}</p>
        {/if}
        </div>
    </div>
