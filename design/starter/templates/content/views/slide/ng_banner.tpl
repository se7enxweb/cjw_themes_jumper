{* v2: themes/app/content/slide/ng_banner.html.twig - image and the title linked to the banner's target. *}
{def $sa_dm = $node.data_map}
    <div class="view-type view-type-{$view_type|wash} ng-banner vl3">
{if and( is_set( $sa_dm.image ), $sa_dm.image.has_content )}
        {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$sa_dm.image.content gp_alias='cjw_i1200' gp_alt=$node.name}
{/if}
        <div class="info">
            <h2 class="title">
                {include uri='design:content/gallery_parts/content_link.tpl' gp_node=$node gp_text=cond( and( is_set( $sa_dm.title ), $sa_dm.title.has_content ), $sa_dm.title.content, $node.name )}
            </h2>
        </div>
    </div>
{undef $sa_dm}
