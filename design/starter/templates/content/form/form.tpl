{* The form of a feedback form object (cjw_feedback_form, ng_feedback_form), sent to the information collector
   (content/action, ActionCollectInformation). v2: Symfony's form_start/form_rest/form_end with the form theme.
   Every attribute marked as information collector becomes a field (content/form/field.tpl), in class order.
   - style 'cjw': the fields one after another, the button in its own form-group (v2 cjw_feedback_form)
   - style 'ng':  the fields and the button inside a fieldset (v2 ng_feedback_form)
   Spam protection (plan D-F4 A): the form token of ezformtoken, added to every POST form by its output
   filter, and a honeypot field (a website address no person sees or fills in); a submission that fills it
   in is dropped before the collector runs (cjwJumperFormHoneypot, site.ini [Event]).
   Input: fm_node (the node), fm_style ('cjw' or 'ng'), fm_control (the class of the inputs) *}
{def $fm_object = $fm_node.object
     $fm_name = concat( $fm_node.class_identifier, '_', $fm_node.contentobject_id )
     $fm_errors = hash()
     $fm_collected = false()}
{* After a failed submission the collector shows the page again with $validation and $collection_attributes *}
{if and( is_set( $validation ), is_set( $validation.processed ), $validation.processed, is_set( $validation.attributes ) )}
    {foreach $validation.attributes as $fm_invalid}
        {set $fm_errors = $fm_errors|merge( hash( concat( 'a', $fm_invalid.id ), cond( $fm_invalid.description, $fm_invalid.description, 'Enter a valid value'|i18n( 'design/starter/form' ) ) ) )}
    {/foreach}
{/if}
{if and( is_set( $collection_attributes ), is_array( $collection_attributes ) )}{set $fm_collected = $collection_attributes}{/if}
<form name="{$fm_name}" method="post" action={'/content/action'|ezurl}>
{if $fm_style|eq( 'ng' )}
                    <fieldset>
{foreach $fm_object.contentobject_attributes as $fm_attr}{if $fm_attr.contentclass_attribute.is_information_collector}
                        {include uri='design:content/form/field.tpl' ff_attr=$fm_attr ff_form=$fm_name ff_control=$fm_control ff_errors=$fm_errors ff_collected=$fm_collected}
{/if}{/foreach}
                        <button type="submit" name="ActionCollectInformation" value="1" class="btn btn-primary">{'Send form'|i18n( 'design/starter/form' )}</button>
                    </fieldset>
{else}
                        {foreach $fm_object.contentobject_attributes as $fm_attr}{if $fm_attr.contentclass_attribute.is_information_collector}{include uri='design:content/form/field.tpl' ff_attr=$fm_attr ff_form=$fm_name ff_control=$fm_control ff_errors=$fm_errors ff_collected=$fm_collected}{/if}{/foreach}
                        <div class="form-group">
                            <button type="submit" name="ActionCollectInformation" value="1" class="btn btn-primary">{'Send form'|i18n( 'design/starter/form' )}</button>
                        </div>
{/if}
                    <div class="cjw-form-hp" aria-hidden="true" style="position:absolute;left:-10000px;top:auto;width:1px;height:1px;overflow:hidden;"><label for="{$fm_name}_website">Website</label><input type="text" id="{$fm_name}_website" name="CjwFormWebsite" value="" tabindex="-1" autocomplete="off" /></div>
                    <input type="hidden" name="ContentNodeID" value="{$fm_node.node_id}" />
                    <input type="hidden" name="ContentObjectID" value="{$fm_node.contentobject_id}" />
                    <input type="hidden" name="ViewMode" value="full" />
                </form>
{undef $fm_object $fm_name $fm_errors $fm_collected}
