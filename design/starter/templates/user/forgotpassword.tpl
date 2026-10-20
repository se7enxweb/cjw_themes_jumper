{* The forgotten-password page of the design starter (v2: themes/app/user/forgot_password.html.twig and
   forgot_password_sent.html.twig), drawn in the main zone like v2's full_view block. The kernel's
   user/forgotpassword does the work (UserEmail, GenerateButton; the mail with the link, then the new password);
   the confirmation never says whether an account with that address exists.
   In demo mode (EXP_DEMO_MODE=1) a notice from the kernel says, to everyone, that administrator passwords cannot be
   reset. *}
{if first_set( $demo_mode_text, '' )|ne( '' )}
        <div class="full-form-content">
        <div class="alert alert-warning" role="status">{$demo_mode_text|wash}</div>
    </div>
{/if}
{if $link}
        <div class="full-form-content">
        <div class="full-form-response">
            <p>{'We have sent you an e-mail with further instructions. Please check your inbox (and spam folder).'|i18n( 'design/starter/user' )}</p>
        </div>
    </div>
{elseif $generated}
        <div class="full-form-content">
        <div class="full-form-response">
            <p>{'A new password has been sent to %email.'|i18n( 'design/starter/user', '', hash( '%email', $email|wash ) )}</p>
        </div>
    </div>
{elseif $wrong_key}
        <div class="full-form-content">
        <div class="alert alert-danger">{'The key is invalid or has been used.'|i18n( 'design/starter/user' )}</div>
    </div>
{else}
        <div class="full-form-content">
        <form name="form" method="post" action={'/user/forgotpassword'|ezurl}>
        {if $wrong_email}
            <div class="alert alert-danger">{'Please enter a valid e-mail address.'|i18n( 'design/starter/user' )}</div>
        {/if}

        <fieldset>
            <div class="form-group">
                <div><label for="form_email" class="required">{'E-mail'|i18n( 'design/starter/user' )}</label><input type="email" id="form_email" name="UserEmail" required="required" class="form-control" /></div>
            </div>

            <button type="submit" name="GenerateButton" class="btn btn-primary">{'Send'|i18n( 'design/starter/user' )}</button>
        </fieldset>

        </form>
    </div>
{/if}
