{* Item view "mini" of an audio item (v2: app/content/mini/ng_audio.html.twig). *}
<article class="view-type view-type-{first_set( $view_type, 'mini' )|wash} ng-audio vl5">
    <figure class="image">
        <i class="fas fa-volume-up article-icon" aria-hidden="true"></i>
        {include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i160' ip_link=$node.url_alias|ezurl( 'no' ) ip_fields=array( 'image' ) ip_figure_class=''}
    </figure>
    <header class="article-header">
        <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    </header>
</article>
