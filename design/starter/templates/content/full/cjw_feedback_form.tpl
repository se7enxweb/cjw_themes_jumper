{* Full view of cjw_feedback_form (v2: cjw_app/content/full/cjw_feedback_form.html.twig), the contact form.
   v2's layouts draw parts of it through twig_block blocks; this template draws the part asked for:
   part = 'content' (the whole view: the full view block and pages without a layout), or one of the Twig block
   names content_header, title, intro, content_body, body. Other names draw nothing.
   The form goes to the information collector; after a successful submission the collector shows
   content/collectedinfo/cjw_feedback_form.tpl (v2's "success" block) instead of the form.
   Input: node, part, success (true: draw the success text in place of the form) *}
{def $cf_part = first_set( $part, 'content' )
     $cf_map = $node.data_map
     $cf_success = first_set( $success, false() )}
{def $cf_all = $cf_part|eq( 'content' )
     $cf_body = or( $cf_part|eq( 'content' ), $cf_part|eq( 'content_body' ) )}
{if $cf_all}
    <article class="view-type view-type-full ng-article vf1">
{/if}
{if or( $cf_all, $cf_part|eq( 'content_header' ), $cf_part|eq( 'title' ) )}
                <h1 class="title"><span class="ezstring-field">{$cf_map.title.content|wash}</span></h1>
{/if}
{if or( $cf_all, $cf_part|eq( 'content_header' ), $cf_part|eq( 'intro' ) )}
                {if $cf_map.full_intro.has_content}
                    <div class="article-intro">
                        <div class="ezxmltext-field">{$cf_map.full_intro.content.output.output_text}</div>
                    </div>
                {/if}
{/if}
{if $cf_body}
            <div class="container">
                <div class="full-article-content">
{/if}
{if or( $cf_body, $cf_part|eq( 'body' ) )}
                        {if $cf_map.body.has_content}
                            <div class="full-article-body">
                                <div class="ezxmltext-field">{$cf_map.body.content.output.output_text}</div>
                            </div>
                        {/if}
{/if}
{if $cf_body}
                </div>

                <div class="full-form-response text-left">
    {if $cf_success}
                    <div class="message-feedback">
                        {if and( is_set( $cf_map.success_text ), $cf_map.success_text.has_content )}
                            <div class="ezxmltext-field">{$cf_map.success_text.content.output.output_text}</div>
                        {else}
                            <p>{'Thank you for your feedback.'|i18n( 'design/starter/form' )}</p>
                        {/if}
                    </div>
    {else}
                    {include uri='design:content/form/form.tpl' fm_node=$node fm_style='cjw' fm_control='form-control'}

                        <p>
                            * {'Required fields'|i18n( 'design/starter/form' )}
                        </p>
    {/if}
                </div>
            </div>
            <div style="clear: both"></div>
{/if}
{if $cf_all}
    </article>
{/if}
{undef $cf_part $cf_map $cf_success $cf_all $cf_body}
