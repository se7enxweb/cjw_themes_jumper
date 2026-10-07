{* The registration page of the design starter (v2: themes/app/user/register.html.twig with the Bootstrap 4 form
   theme), drawn in the main zone like v2's full_view block. The kernel's user/register does the work: every field
   carries the kernel's own name (ContentObjectAttribute_*), so its validation, the form token (ezformtoken), the
   e-mail verification and the user class stay as they are. String, text, user account and image fields are drawn
   in v2's markup; any other field of the user class (two-step sign-in, for one) through its own edit template.
   The account labels stay English, as v2 shows them. *}
        <div class="full-form-content">
        {if and( is_set( $checkErrNodeId ), $checkErrNodeId )}
            <div class="alert alert-danger">{$errMsg|wash}</div>
        {/if}
        {if and( is_set( $validation ), $validation.processed, $validation.attributes|count )}
            <div class="alert alert-danger">
            {foreach $validation.attributes as $rg_error}
                <div>{$rg_error.name|wash}: {$rg_error.description|wash}</div>
            {/foreach}
            </div>
        {/if}

        {if and( is_set( $content_attributes ), $content_attributes|count|gt( 0 ) )}
        <form name="ezforms_create_user" method="post" enctype="multipart/form-data" action={'/user/register'|ezurl}>

        <fieldset>
            {foreach $content_attributes as $rg_attr}
                {def $rg_id = $rg_attr.id
                     $rg_dt = $rg_attr.data_type_string
                     $rg_req = $rg_attr.contentclass_attribute.is_required
                     $rg_base = concat( 'ContentObjectAttribute_', $rg_id )}
                <input type="hidden" name="ContentObjectAttribute_id[]" value="{$rg_id}" />
                {switch match=$rg_dt}
                {case match='ezstring'}
                            <div class="form-group "><label for="{$rg_base}"{if $rg_req} class="required"{/if}>{$rg_attr.contentclass_attribute.name|i18n( 'design/starter/user' )|wash}</label>{if $rg_req}*{/if}<input type="text" id="{$rg_base}" name="ContentObjectAttribute_ezstring_data_text_{$rg_id}" value="{$rg_attr.data_text|wash}"{if $rg_req} required="required"{/if} class="form-control form-control" /></div>
                {/case}
                {case match='eztext'}
                            <div class="form-group "><label for="{$rg_base}"{if $rg_req} class="required"{/if}>{$rg_attr.contentclass_attribute.name|i18n( 'design/starter/user' )|wash}</label>{if $rg_req}*{/if}<textarea id="{$rg_base}" name="ContentObjectAttribute_data_text_{$rg_id}" rows="10"{if $rg_req} required="required"{/if} class="form-control form-control">{$rg_attr.content|wash}</textarea></div>
                {/case}
                {case match='ezuser'}
                                                <div class="form-group "><label for="{$rg_base}_email" class="required">E-mail address</label>*<input type="email" id="{$rg_base}_email" name="ContentObjectAttribute_data_user_email_{$rg_id}" value="{$rg_attr.content.email|wash}" required="required" class="form-control form-control" /></div>
                                <div class="form-group "><label for="{$rg_base}_login" class="required">Username</label>*<input type="text" id="{$rg_base}_login" name="ContentObjectAttribute_data_user_login_{$rg_id}" value="{$rg_attr.content.login|wash}" required="required" autocomplete="username" class="form-control form-control" /></div>
                                <div class="form-group "><label for="{$rg_base}_password" class="required">Password</label>*<input type="password" id="{$rg_base}_password" name="ContentObjectAttribute_data_user_password_{$rg_id}" required="required" autocomplete="new-password" class="form-control form-control" /></div>

            <div class="form-group "><label for="{$rg_base}_password_confirm" class="required">Repeat password</label>*<input type="password" id="{$rg_base}_password_confirm" name="ContentObjectAttribute_data_user_password_confirm_{$rg_id}" required="required" autocomplete="new-password" class="form-control form-control" /></div>
                {/case}
                {case match='ezimage'}
                            <div class="form-group "><label for="{$rg_base}"{if $rg_req} class="required"{/if}>{$rg_attr.contentclass_attribute.name|i18n( 'design/starter/user' )|wash}</label>{if $rg_req}*{/if}<input type="hidden" name="MAX_FILE_SIZE" value="{$rg_attr.contentclass_attribute.data_int1|mul( 1048576 )}" /><input type="file" id="{$rg_base}" name="ContentObjectAttribute_data_imagename_{$rg_id}" accept="image/*" class="form-control form-control-file" /><input type="hidden" name="ContentObjectAttribute_data_imagealttext_{$rg_id}" value="" /></div>
                {/case}
                {case}
                            <div class="form-group "><label{if $rg_req} class="required"{/if}>{$rg_attr.contentclass_attribute.name|i18n( 'design/starter/user' )|wash}</label>{if $rg_req}*{/if}{attribute_edit_gui attribute=$rg_attr}</div>
                {/case}
                {/switch}
                {undef $rg_id $rg_dt $rg_req $rg_base}
            {/foreach}

            {include uri='design:mailpreferences/parts/signup.tpl' categories=first_set( $mail_categories, array() )}

            <button type="submit" name="PublishButton" class="btn btn-primary"{if and( is_set( $checkErrNodeId ), $checkErrNodeId )} disabled="disabled"{/if}>{'Register'|i18n( 'design/starter/user' )}</button>
        </fieldset>

        </form>
        {else}
            <div class="alert alert-danger">{'Unable to register a new user.'|i18n( 'design/starter/user' )}</div>
        {/if}
    </div>
