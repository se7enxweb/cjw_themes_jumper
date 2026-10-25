{* Portions derived from LoveStack (mugoweb/ezpublish-legacy, commit 98854ab935), Copyright (C) Mugo Web, GPL v2 *}
{* The sign-in page of the design starter (v2: themes/app/user/login.html.twig), drawn in the main zone like v2's
   full_view block. The kernel's user/login does the work: the field and button names are the ones it reads (Login,
   Password, LoginButton, RedirectURI, Cookie, Last_*), the form token is added by ezformtoken, the address after
   signing in is the kernel's checked RedirectURI, and the second step of an account with two-step sign-in
   (user2fa/verify) follows on its own page. Also drawn inside the "access denied" error page ($embed_content).
   The wording of the messages never says whether an account exists. *}
        <div class="full-form-content">
            {if $User:user_is_not_allowed_to_login}
                <div class="alert alert-danger">{'There have been too many unsuccessful attempts, so signing in is paused for this account. Resetting the password unlocks it.'|i18n( 'design/starter/user' )}</div>
            {elseif $User:warning.bad_login}
                <div class="alert alert-danger">{'The username or password is not right.'|i18n( 'design/starter/user' )}</div>
            {/if}
            {if $site_access.allowed|not}
                <div class="alert alert-danger">{'This account isn\'t allowed to use %name.'|i18n( 'design/starter/user', '', hash( '%name', $site_access.name|wash ) )}</div>
            {/if}

            <form name="loginform" action={'/user/login'|ezurl} method="post" role="form">
                    <fieldset>
                        <div class="form-group">
                            <label for="username">{'Username or e-mail'|i18n( 'design/starter/user' )}:</label>
                            <input type="text" id="username" class="form-control" name="Login" value="{$User:login|wash}" required="required" autofocus="autofocus" autocomplete="on" placeholder="{'Enter your username or e-mail'|i18n( 'design/starter/user' )}" />
                        </div>
                        <div class="form-group{if $User:warning.bad_login} has-error{/if}">
                            <label for="password">{'Password'|i18n( 'design/starter/user' )}:</label>
                            <input type="password" id="password" class="form-control" name="Password" required="required" placeholder="{'Enter your password'|i18n( 'design/starter/user' )}" />
                        </div>
                        {if and( ezini_hasvariable( 'Session', 'RememberMeTimeout' ), ezini( 'Session', 'RememberMeTimeout' ) )}
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" name="Cookie" id="remember" checked="checked" />
                            <label class="form-check-label" for="remember">{'Remember me'|i18n( 'design/starter/user' )}</label>
                        </div>
                        {/if}

                        <input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />
                        {if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
                            {foreach $User:post_data as $lg_key => $lg_value}
                        <input type="hidden" name="Last_{$lg_key|wash}" value="{$lg_value|wash}" />
                            {/foreach}
                        {/if}

                        <button name="LoginButton" type="submit" class="btn btn-primary">{'Log in'|i18n( 'design/starter/user' )}</button>
                        <div class="float-right"><a href={'/user/forgotpassword'|ezurl}>{'Forgot password?'|i18n( 'design/starter/user' )}</a></div>
                    </fieldset>
            </form>

            {* "Sign in with a passkey" ([PasskeySettings] of site.ini), as a form of its own below the sign-in form;
               draws nothing when the view offers no passkeys. Drawn by stylesheets/starter.css. *}
            {include uri='design:user/parts/passkey_login.tpl'}

            {if ezmodule( 'user2fa/oauth' )}
                {include uri='design:user2fa/parts/social_buttons.tpl' context='login' redirect=$User:redirect_uri}
            {/if}

            {* the register link only for a user who may register (policy omit list or the user/register policy) *}
            {if fetch( 'user', 'can_open', hash( 'uri', 'user/register' ) )}
            <p class="text-center note mt-5">{"Don't have an account?"|i18n( 'design/starter/user' )} <a href={'/user/register'|ezurl}>{'Register'|i18n( 'design/starter/user' )}</a>.</p>
            {/if}
        </div>
