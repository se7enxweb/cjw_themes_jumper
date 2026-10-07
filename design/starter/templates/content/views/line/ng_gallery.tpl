{* Item view "line" of a gallery (v2: app/content/line/ng_gallery.html.twig): its first image child. *}
{def $lgl_first = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id, 'class_filter_type', 'include', 'class_filter_array', array( 'image' ), 'sort_by', $node.sort_array, 'limit', 1 ) )}
<article class="view-type view-type-{first_set( $view_type, 'line' )|wash} ng-gallery vl4">
    <i class="fas fa-camera article-icon" aria-hidden="true"></i>
    {if $lgl_first|count|gt( 0 )}
        {include uri='design:content/item_parts/image.tpl' ip_node=$lgl_first[0] ip_link=$node.url_alias|ezurl( 'no' ) ip_fields=array( 'image' )}
    {/if}
    <div class="article-content">
        <header class="article-header">
            <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
            <div class="info">
                {include uri='design:content/item_parts/info.tpl' if_node=$node if_no_authors=true()}
            </div>
        </header>
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    </div>
</article>
{undef $lgl_first}
