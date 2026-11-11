{* Item view "accordion" for every class (the list view type list_accordion; from the media design, v2 has none):
   the title opens and closes a panel with the intro and a link to the item (Bootstrap 4 collapse from app.js; the
   panels of one block share the parent #accordion-<block id> of list_accordion.tpl). Parameters: node, view_type,
   block. *}
{def $ac_cls = $node.class_identifier|explode( '_' )|implode( '-' )
     $ac_vt = first_set( $view_type, 'accordion' )
     $ac_id = concat( 'collapse-', first_set( $block.id, 0 ), '-', $node.node_id )}
<article class="view-type view-type-{$ac_vt|wash} {$ac_cls} vl10">
    <h3 class="title" id="heading-{$ac_id|wash}">
        <a class="collapsed" role="button" href="#{$ac_id|wash}" data-toggle="collapse" aria-expanded="false" aria-controls="{$ac_id|wash}">
            {include uri='design:content/item_parts/title.tpl' it_node=$node it_fields=array( 'title', 'teaser_title', 'short_title', 'name' )}
        </a>
    </h3>
    <div id="{$ac_id|wash}" class="collapse" aria-labelledby="heading-{$ac_id|wash}"{if is_set( $block.id )} data-parent="#accordion-{$block.id|wash}"{/if}>
        <div class="accordion-body">
            {include uri='design:content/item_parts/intro.tpl' in_node=$node}
            <a class="read-more" href={$node.url_alias|ezurl}>{'Read more'|i18n( 'design/starter/content' )}</a>
        </div>
    </div>
</article>
{undef $ac_cls $ac_vt $ac_id}
