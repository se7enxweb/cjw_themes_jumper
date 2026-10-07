{* One field of a feedback form, in the markup of v2's form theme (cjw_app/forms/theme.html.twig, form_row):
   <div class="form-group "><label for=".." class="required">Name</label>*<input .. /></div>, a checkbox as
   Bootstrap's form-check, and a field that did not validate with the class error-input and v2's
   <ul class="errors"> inside its label.
   The inputs carry the names the information collector reads (kernel datatypes ezstring, eztext, ezemail,
   ezboolean); a value the visitor typed comes back from the collection after a failed validation.
   Input: ff_attr          the content object attribute (an information collector)
          ff_form          the form name (the id prefix of the inputs, as v2: <class>_<object id>)
          ff_control       the class of the inputs ('form-control', or 'form-control form-control' as the
                           ng_feedback_form of v2 has it)
          ff_errors        hash( 'a' . attribute id => message ) of the fields that did not validate
          ff_collected     the collection attributes of a failed submission (hash by attribute id), or false *}
{def $ff_class = $ff_attr.contentclass_attribute
     $ff_dt = $ff_attr.data_type_string
     $ff_id = concat( $ff_form, '_', $ff_class.identifier )
     $ff_required = $ff_class.is_required
     $ff_error = first_set( $ff_errors[concat( 'a', $ff_attr.id )], false() )
     $ff_value = ''
     $ff_checked = false()}
{if and( $ff_collected, is_set( $ff_collected[$ff_attr.id] ) )}
    {set $ff_value = $ff_collected[$ff_attr.id].data_text
         $ff_checked = $ff_collected[$ff_attr.id].data_int|eq( 1 )}
{/if}
{def $ff_errors_html = cond( $ff_error, concat( '<ul class="errors"><li>', $ff_error|wash, '</li></ul>' ), '' )}
{if $ff_dt|eq( 'ezboolean' )}
<div class="form-group {if $ff_error}error-input{/if}"><div class="form-check">        <input type="checkbox" id="{$ff_id}" name="ContentObjectAttribute_data_boolean_{$ff_attr.id}"{if $ff_required} required="required"{/if} class="form-check-input" value="1"{if $ff_checked} checked="checked"{/if} />
        <label class="form-check-label{if $ff_required} required{/if}" for="{$ff_id}">{$ff_class.name|wash}{$ff_errors_html}</label>{if $ff_required}*{/if}</div></div>
{elseif $ff_dt|eq( 'eztext' )}
<div class="form-group {if $ff_error}error-input{/if}"><label for="{$ff_id}"{if $ff_required} class="required"{/if}>{$ff_class.name|wash}{$ff_errors_html}</label>{if $ff_required}*{/if}<textarea id="{$ff_id}" name="ContentObjectAttribute_data_text_{$ff_attr.id}" rows="10"{if $ff_required} required="required"{/if} class="{$ff_control}">{$ff_value|wash}</textarea></div>
{elseif $ff_dt|eq( 'ezemail' )}
<div class="form-group {if $ff_error}error-input{/if}"><label for="{$ff_id}"{if $ff_required} class="required"{/if}>{$ff_class.name|wash}{$ff_errors_html}</label>{if $ff_required}*{/if}<input type="email" id="{$ff_id}" name="ContentObjectAttribute_data_text_{$ff_attr.id}"{if $ff_required} required="required"{/if} class="{$ff_control}"{if $ff_value|ne( '' )} value="{$ff_value|wash}"{/if} /></div>
{else}
<div class="form-group {if $ff_error}error-input{/if}"><label for="{$ff_id}"{if $ff_required} class="required"{/if}>{$ff_class.name|wash}{$ff_errors_html}</label>{if $ff_required}*{/if}<input type="text" id="{$ff_id}" name="ContentObjectAttribute_ezstring_data_text_{$ff_attr.id}"{if $ff_required} required="required"{/if} class="{$ff_control}"{if $ff_value|ne( '' )} value="{$ff_value|wash}"{/if} /></div>
{/if}
{undef $ff_class $ff_dt $ff_id $ff_required $ff_error $ff_value $ff_checked $ff_errors_html}
