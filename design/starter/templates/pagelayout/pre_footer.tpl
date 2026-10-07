{* The pre-footer (v2: themes/cjw_app/page_pre_footer.html.twig): the footer block of the site info object
   (cjw_jumper.ini [SiteInfo] NodeRemoteID). *}
{def $pf_info = fetch( 'content', 'node', hash( 'remote_id', ezini( 'SiteInfo', 'NodeRemoteID', 'cjw_jumper.ini' ) ) )}
<div class="site-footer">
    <div class="container">
        <div class="footer-info">
{if and( $pf_info, is_set( $pf_info.data_map.footer_block ), $pf_info.data_map.footer_block.has_content )}
                            <div class="ezxmltext-field">{$pf_info.data_map.footer_block.content.output.output_text}</div>
{/if}
                    </div>
    </div>
</div>
{undef $pf_info}
