{* Item view "overlay" of a gallery (v2: app/content/overlay/ng_gallery.html.twig, which prints the class
   ng-article): its first image child. *}
{def $ogl_first = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id, 'class_filter_type', 'include', 'class_filter_array', array( 'image' ), 'sort_by', $node.sort_array, 'limit', 1 ) )}
<article class="view-type view-type-{first_set( $view_type, 'overlay' )|wash} ng-article vl2">
    <i class="fas fa-camera article-icon" aria-hidden="true"></i>
    {if $ogl_first|count|gt( 0 )}
        <a href={$node.url_alias|ezurl} class="image-16by9" aria-label="{$ogl_first[0].name|wash}">
            {include uri='design:content/item_parts/image.tpl' ip_node=$ogl_first[0] ip_fields=array( 'image' )}
        </a>
    {/if}
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
        <div class="info">
            {include uri='design:content/item_parts/info.tpl' if_node=$node if_no_authors=true()}
        </div>
    </header>
</article>
{undef $ogl_first}
