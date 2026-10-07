{* Item view "standard" of a shortcut (v2: cjw_app/content/standard/ng_shortcut.html.twig): image and title
   link to the shortcut's target when it has one. Parameters: node, view_type, with_intro. *}
{def $ss_dm = $node.data_map
     $ss_vt = first_set( $view_type, 'standard' )
     $ss_target = or( and( is_set( $ss_dm.link ), $ss_dm.link.has_content ), and( is_set( $ss_dm.url ), $ss_dm.url.has_content ), and( is_set( $ss_dm.related_object ), $ss_dm.related_object.has_content ) )}
<article class="view-type view-type-{$ss_vt|wash} ng-shortcut vl1">

    {if $ss_target}<a {include uri='design:parts/shortcut_link_attributes.tpl' shortcut=$node}>{/if}{include uri='design:content/item_parts/image.tpl' ip_node=$node ip_alias='cjw_i480' ip_figure_class='image cjw-image' ip_fields=array( 'teaser_image', 'image', 'icon', 'picture' ) ip_always=true()}{if $ss_target}</a>{/if}

    <header class="article-header ng-shortcut-{$ss_vt|wash}-body">
        <h2 class="title">
            {if $ss_target}<a {include uri='design:parts/shortcut_link_attributes.tpl' shortcut=$node}>{/if}{include uri='design:content/item_parts/title.tpl' it_node=$node}{if $ss_target}</a>{/if}
        </h2>
    </header>

    <section class="article-body ng-shortcut-{$ss_vt|wash}-body">
        {if first_set( $with_intro, false() )}
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
        {/if}
    </section>

</article>
{undef $ss_dm $ss_vt $ss_target}
