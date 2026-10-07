{* Full view of ng_feedback_form (v2: app/content/full/ng_feedback_form.html.twig). v2's page header block
   (pre_content: title and intro) is not drawn by v2's layouts, so it is not drawn here either.
   part = 'content' (the whole view) or 'content_body' (the same, for a twig_block of that name).
   After a successful submission the collector shows content/collectedinfo/ng_feedback_form.tpl, which draws
   this template with success = true: v2's "success" block in place of the form.
   Input: node, part, success *}
{def $nf_part = first_set( $part, 'content' )
     $nf_map = $node.data_map
     $nf_success = first_set( $success, false() )}
{if or( $nf_part|eq( 'content' ), $nf_part|eq( 'content_body' ) )}
    <div class="view-type view-type-full ng-feedback-form">
        <div class="full-form-content">
    {if $nf_success}
            <div class="full-form-response">
                {if $nf_map.success_text.has_content}
                    <div class="ezxmltext-field">{$nf_map.success_text.content.output.output_text}</div>
                {else}
                    <p>{'Thank you for your feedback.'|i18n( 'design/starter/form' )}</p>
                {/if}

                <a href={$node.parent.url_alias|ezurl}>{'Return to site'|i18n( 'design/starter/form' )}</a>
            </div>
    {else}
            {if $nf_map.body.has_content}
                <div class="ezxmltext-field">{$nf_map.body.content.output.output_text}</div>
            {/if}

                {include uri='design:content/form/form.tpl' fm_node=$node fm_style='ng' fm_control='form-control form-control'}
    {/if}
        </div>
    </div>
{/if}
{undef $nf_part $nf_map $nf_success}
