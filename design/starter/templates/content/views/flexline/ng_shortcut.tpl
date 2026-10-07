{* Item view "flexline" of a shortcut (v2: cjw_app/content/flexline/ng_shortcut.html.twig): the whole item is
   the link to the shortcut's target. *}
{def $fs_dm = $node.data_map}
    <a class="view-type view-type-{first_set( $view_type, 'flexline' )|wash} ng-shortcut" {include uri='design:content/item_parts/relation_link_attributes.tpl' rl_node=$node}>
            <h3 class="title">
                {if is_set( $fs_dm.title )}{$fs_dm.title.content|wash}{else}{$node.name|wash}{/if}
            </h3>
                {if and( is_set( $fs_dm.teaser_intro ), $fs_dm.teaser_intro.has_content )}{include uri='design:content/item_parts/xml.tpl' ix_attr=$fs_dm.teaser_intro}{/if}
    </a>
{undef $fs_dm}
