{* Item view "mini" of ng_blog_post (v2: app/content/mini/ng_blog_post.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'mini' )|wash} ng-blog-post vl5">
    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i160' ip_link=$node.url_alias|ezurl( 'no' )}
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
        <div class="info">
            {include uri='design:content/item_parts/info.tpl' if_node=$node if_time=true()}

        </div>
    </header>
</article>
