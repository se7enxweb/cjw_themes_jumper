{* v2: themes/app/content/slide/<class>.html.twig (ng_article, ng_news, ng_banner, ...): the image and the linked
   title. Input: $node, $view_type. *}
{def $sd_dm = $node.data_map
     $sd_title = $node.name}
{if and( is_set( $sd_dm.teaser_title ), $sd_dm.teaser_title.has_content )}{set $sd_title = $sd_dm.teaser_title.content}
{elseif and( is_set( $sd_dm.title ), $sd_dm.title.has_content )}{set $sd_title = $sd_dm.title.content}{/if}
<div class="view-type view-type-{$view_type|wash} {$node.class_identifier|explode( '_' )|implode( '-' )|wash} vl3">
{if and( is_set( $sd_dm.image ), $sd_dm.image.has_content )}
    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$sd_dm.image.content gp_alias='cjw_i1200' gp_alt=$sd_title}
{/if}
    <div class="info">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{$sd_title|wash}</a></h2>
    </div>
</div>
{undef $sd_dm $sd_title}
