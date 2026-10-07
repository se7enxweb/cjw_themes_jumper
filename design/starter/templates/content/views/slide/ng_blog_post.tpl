{* v2: themes/app/content/slide/ng_blog_post.html.twig - image, linked title, authors and date. *}
{def $sb_dm = $node.data_map
     $sb_title = cond( and( is_set( $node.data_map.teaser_title ), $node.data_map.teaser_title.has_content ), $node.data_map.teaser_title.content, and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )}
<div class="view-type view-type-{$view_type|wash} ng-blog-post vl3">
{if and( is_set( $sb_dm.image ), $sb_dm.image.has_content )}
    {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$sb_dm.image.content gp_alias='cjw_i1200' gp_alt=$sb_title}
{/if}
    <div class="info">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{$sb_title|wash}</a></h2>
        <div class="date">
            {include uri='design:content/gallery_parts/authors.tpl' gp_dm=$sb_dm}
            {include uri='design:content/gallery_parts/date.tpl' gp_dm=$sb_dm}
        </div>
    </div>
</div>
{undef $sb_dm $sb_title}
