{* v2: themes/app/content/gallery_grid.html.twig and gallery_grid/<class> (ng_article, ng_news, ...): the image
   (cjw_i1200) linking the large one. Only for content with an image. Input: $node, $view_type. *}
{def $gd_dm = $node.data_map
     $gd_title = $node.name}
{if and( is_set( $gd_dm.teaser_title ), $gd_dm.teaser_title.has_content )}{set $gd_title = $gd_dm.teaser_title.content}
{elseif and( is_set( $gd_dm.title ), $gd_dm.title.has_content )}{set $gd_title = $gd_dm.title.content}{/if}
{if and( is_set( $gd_dm.image ), $gd_dm.image.has_content )}
    <div class="view-type view-type-{$view_type|wash} {$node.class_identifier|explode( '_' )|implode( '-' )|wash} vl3">
        <a href="{$gd_dm.image.content['cjw_i1200'].url|ezroot( 'no' )}" title="{$gd_title|wash}" class="js-mfp-item">
            {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$gd_dm.image.content gp_alias='cjw_i1200' gp_alt=$gd_title}
        </a>
    </div>
{/if}
{undef $gd_dm $gd_title}
