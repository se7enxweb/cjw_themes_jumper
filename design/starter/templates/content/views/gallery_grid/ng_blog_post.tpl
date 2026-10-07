{* v2: themes/app/content/gallery_grid/ng_blog_post.html.twig - as the generic grid item, the link title naming
   the first author (else the owner) and the date. Input: $node, $view_type. *}
{def $gb_dm = $node.data_map
     $gb_title = cond( and( is_set( $node.data_map.teaser_title ), $node.data_map.teaser_title.has_content ), $node.data_map.teaser_title.content, and( is_set( $node.data_map.title ), $node.data_map.title.has_content ), $node.data_map.title.content, $node.name )
     $gb_author = $node.object.owner.name}
{if and( is_set( $gb_dm.image ), $gb_dm.image.has_content )}
{if and( is_set( $gb_dm.authors ), $gb_dm.authors.has_content )}{def $gb_first = fetch( 'content', 'object', hash( 'object_id', $gb_dm.authors.content.relation_list[0].contentobject_id ) )}{if $gb_first}{set $gb_author = $gb_first.name}{/if}{undef $gb_first}{/if}
    <div class="view-type view-type-{$view_type|wash} ng-blog-post vl3">
        <a href="{$gb_dm.image.content['cjw_i1200'].url|ezroot( 'no' )}" title="{$gb_title|wash} by {$gb_author|wash} ({include uri='design:content/gallery_parts/date.tpl' gp_dm=$gb_dm})" class="js-mfp-item">
            {include uri='design:content/gallery_parts/image_field.tpl' gp_image=$gb_dm.image.content gp_alias='cjw_i1200' gp_alt=$gb_title}
        </a>
    </div>
{/if}
{undef $gb_dm $gb_title $gb_author}
