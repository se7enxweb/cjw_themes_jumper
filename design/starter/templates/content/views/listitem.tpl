{* Item view "listitem" for classes without their own listitem template (v2: app/content/listitem.html.twig).
   Parameters: node, view_type, with_intro. *}
<article class="view-type view-type-{first_set( $view_type, 'listitem' )|wash} {$node.class_identifier|explode( '_' )|implode( '-' )} vl6">
    <h2 class="title"><a href={$node.url_alias|ezurl}>{include uri='design:content/item_parts/title.tpl' it_node=$node}</a></h2>
    {if first_set( $with_intro, false() )}
        {include uri='design:content/item_parts/intro.tpl' in_node=$node}
    {/if}
</article>
