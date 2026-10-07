{* The mail of a feedback form submission, in the markup of v2's cjw_app/info_collection/email.html.twig: an HTML
   mail with the form's name, every collected field (yes/no for a checkbox) and a footer. The footer is the
   footer block of the site info object (cjw_jumper.ini [SiteInfo] NodeRemoteID) and the site's address, where
   v2 had one company's address written into the template.
   Sets for the collector (content/collectedinfomail/<class>.tpl includes this; scope root):
   subject        the object's subject field when it has one, else "<site name> - <form name>" (v2)
   email_receiver the object's recipient field (v2); the collector falls back to [InformationCollectionSettings]
                  EmailReceiver, then [MailSettings] AdminEmail
   email_cc_receivers, email_bcc_receivers  the fields recipients_cc / recipients_bcc (comma separated)
   content_type   text/html
   Input: $collection, $object (set by the collector) *}
{def $em_map = $object.data_map
     $em_site = ezini( 'SiteSettings', 'SiteName' )
     $em_info = fetch( 'content', 'node', hash( 'remote_id', ezini( 'SiteInfo', 'NodeRemoteID', 'cjw_jumper.ini' ) ) )}
{if and( $em_info, is_set( $em_info.data_map.site_name ), $em_info.data_map.site_name.has_content )}{set $em_site = $em_info.data_map.site_name.content|trim}{/if}
{set-block scope=root variable=subject}{if and( is_set( $em_map.subject ), $em_map.subject.has_content )}{$em_map.subject.content}{else}{$em_site} - {$object.name}{/if}{/set-block}
{set-block scope=root variable=email_receiver}{if and( is_set( $em_map.recipient ), $em_map.recipient.has_content )}{$em_map.recipient.content}{/if}{/set-block}
{if and( is_set( $em_map.recipients_cc ), $em_map.recipients_cc.has_content )}
    {set scope=root email_cc_receivers=$em_map.recipients_cc.content|explode( ',' )}
{/if}
{if and( is_set( $em_map.recipients_bcc ), $em_map.recipients_bcc.has_content )}
    {set scope=root email_bcc_receivers=$em_map.recipients_bcc.content|explode( ',' )}
{/if}
{set-block scope=root variable=content_type}text/html{/set-block}
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="initial-scale=1.0">
            <meta name="format-detection" content="telephone=no">

            <style type="text/css">
                body {ldelim}-webkit-text-size-adjust:none; -ms-text-size-adjust:none; margin: 0pt; padding: 0pt; background-color: #ffffff; color: #3e3e3e; font-family: Helvetica,"Helvetica Neue",Arial,sans-serif;{rdelim}
                h1, h2 {ldelim} margin: 0; padding: 0pt; font-family: Helvetica,"Helvetica Neue",Arial,sans-serif; color: #3e3e3e; font-size: 14px; font-weight: bold;{rdelim}
                h1 {ldelim} font-size: 16px; margin-bottom: 0.5em;{rdelim}
                h2 {ldelim} margin-bottom: 0.3em;{rdelim}
                p {ldelim} margin: 0.8em 0; line-height: 1.8; color: #3e3e3e;{rdelim}
                a {ldelim} color: #2f4d14; text-decoration: underline;{rdelim}
                table {ldelim} margin: 0pt; padding: 0pt; font-size: 14px;{rdelim}
                th, td {ldelim} padding: 0pt; color: #3e3e3e; vertical-align: top;{rdelim}
                td#footer {ldelim} background-color: #69af23; font-size: 10px; color: #ffffff;{rdelim}
                td#footer a, td#footer p {ldelim} color: #ffffff; margin: 0;{rdelim}
                @media print {ldelim} .no-print, .no-print * {ldelim} display: none !important;{rdelim} {rdelim}
            </style>
        </head>
        <body>
            <table width="750" cellpadding="0" cellspacing="0" border="0" style="background-color: #ffffff;">
                <tr class="no-print">
                    <td colspan="4" style="background-color: #69af23;">&nbsp;</td>
                </tr>
                <tr class="no-print">
                    <td width="120" style="background-color: #69af23;">&nbsp;</td>
                    <td id="title" height="50" colspan="2" align="right" valign="middle" style="font-size: 12px; font-weight: bold; background-color: #69af23;">{$em_site|wash}</td>
                    <td width="120" style="background-color: #69af23;">&nbsp;</td>
                </tr>
                <tr class="no-print">
                    <td colspan="4" style="background-color: #69af23;">&nbsp;</td>
                </tr>
                <tr>
                    <td width="120" style="background-color: #ffffff;">&nbsp;</td>
                    <td valign="top" colspan="2" style="border-top: 1.5em solid #ffffff; border-left: 1.5em solid #ffffff; border-right: 1.5em solid #ffffff; border-bottom: 1em solid #ffffff; background-color: #ffffff;">
                        <h1>{$object.name|wash}</h1>
                    </td>
                    <td width="120" style="background-color: #ffffff;">&nbsp;</td>
                </tr>
                <tr>
                    <td width="120" style="background-color: #ffffff;">&nbsp;</td>
                    <td id="description" valign="top" colspan="2" style="border-left: 1.5em solid #ffffff; background-color: #ffffff;">
{foreach $collection.attributes as $em_attr}
                        <h2>{$em_attr.contentclass_attribute_name|wash}</h2>

                        <p>{if $em_attr.contentclass_attribute.data_type_string|eq( 'ezboolean' )}{if $em_attr.data_int|eq( 1 )}{'Yes'|i18n( 'design/starter/form' )}{else}{'No'|i18n( 'design/starter/form' )}{/if}{else}{$em_attr.data_text|wash|nl2br}{/if}</p>
{/foreach}
                    </td>
                    <td width="120" style="background-color: #ffffff;">&nbsp;</td>
                </tr>
                <tr class="no-print">
                    <td width="120" style="background-color: #ffffff;">&nbsp;</td>
                    <td valign="top" colspan="2" style="border-top: 1.5em solid #ffffff; border-left: 1.5em solid #ffffff; border-right: 1.5em solid #ffffff; border-bottom: 1em solid #ffffff; background-color: #ffffff;">
                        <h2>{'Please note'|i18n( 'design/starter/form' )}</h2>

                        <p>{'This is an automatically generated e-mail. Please do not reply to it. Visit %site_url for more information and ways to contact us.'|i18n( 'design/starter/form', '', hash( '%site_url', concat( 'https://', ezini( 'SiteSettings', 'SiteURL' ) )|wash ) )}</p>
                    </td>
                    <td width="120" style="background-color: #ffffff;">&nbsp;</td>
                </tr>
                <tr class="no-print">
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr class="no-print">
                    <td width="120" style="background-color: #69af23;">&nbsp;</td>
                    <td id="footer" colspan="2" valign="top" style="color: #ffffff; border-left: 2em solid #69af23; background-color: #69af23;">
                        <br />
{if and( $em_info, is_set( $em_info.data_map.footer_block ), $em_info.data_map.footer_block.has_content )}
                        {$em_info.data_map.footer_block.content.output.output_text}
{else}
                        <p>{$em_site|wash}</p>
{/if}
                        <br />
                    </td>
                    <td width="120" style="background-color: #69af23;">&nbsp;</td>
                </tr>
            </table>
        </body>
    </html>
{undef $em_map $em_site $em_info}
