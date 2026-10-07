{* v2: themes/cjw_app/content/slide/image.html.twig - the image (cjw_i770, lazy) linking the large one (fancybox
   group named after the view type), with its caption. Input: $node, $view_type. *}
{def $sl_dm = $node.data_map}
{if and( is_set( $sl_dm.image ), $sl_dm.image.has_content )}
<a href="{$sl_dm.image.content['cjw_i1920'].url|ezroot( 'no' )}" title="{$node.name|wash}" data-fancybox="{$view_type|wash}">
    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$sl_dm.image.content gp_alias='cjw_i770' gp_alt=$node.name}
{if and( is_set( $sl_dm.caption ), $sl_dm.caption.has_content )}
        <div class="ezxmltext-field">{$sl_dm.caption.content.output.output_text}</div>
{/if}
</a>
{/if}
{undef $sl_dm}
