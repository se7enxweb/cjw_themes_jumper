{* v2: themes/cjw_app/content/gallery_grid/image.html.twig - the image (cjw_i770, lazy) linking the large one in the
   fancybox group named after the view type. Input: $node, $view_type. *}
{def $gi_dm = $node.data_map}
<div class="view-type view-type-{$view_type|wash} image vl3">
{if and( is_set( $gi_dm.image ), $gi_dm.image.has_content )}
                <a href="{$gi_dm.image.content['cjw_i1200'].url|ezroot( 'no' )}"
           title="{$node.name|wash}" data-fancybox="{$view_type|wash}" alt="{$gi_dm.image.content.alternative_text|wash}">
                    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$gi_dm.image.content gp_alias='cjw_i770' gp_alt=$node.name}
        </a>
{/if}
    </div>
{undef $gi_dm}
