{* Item view "standard" of a blog post (v2: app/content/standard/ng_blog_post.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'standard' )|wash} ng-blog-post vl1">

    {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_link=$node.url_alias|ezurl( 'no' )}

    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
        <div class="info">
            {include uri='design:content/item_parts/info.tpl' if_node=$node if_time=true()}
        </div>
    </header>

    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
