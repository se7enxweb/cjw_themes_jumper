{* v2: themes/app/content/slide/ng_news.html.twig - image, date, linked title. Input: $node, $view_type. *}
{def $sn_dm = $node.data_map
     $sn_title = cond( and( is_set( $node.data_map.teaser_title ), $node.data_map.teaser_title.has_content ), $node.data_map.teaser_title.content, and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )}
<div class="view-type view-type-{$view_type|wash} ng-news vl3">
{if and( is_set( $sn_dm.image ), $sn_dm.image.has_content )}
    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$sn_dm.image.content gp_alias='cjw_i1200' gp_alt=$sn_title}
{/if}
    <div class="info">
        <div class="date">
            {include uri='design:content/gallery_parts/date.tpl' gp_dm=$sn_dm}
        </div>
        <h2 class="title"><a href={$node.url_alias|ezurl}>{$sn_title|wash}</a></h2>
    </div>
</div>
{undef $sn_dm $sn_title}
