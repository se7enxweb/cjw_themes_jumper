{* Full view of ng_htmlbox (v2: app/content/full/ng_htmlbox.html.twig): the HTML code as it is.
   Input: node, part ('content'; other names draw nothing). *}
{if first_set( $part, 'content' )|eq( 'content' )}
    <div class="view-type view-type-full ng-htmlbox clearfix">
        {$node.data_map.html_code.content}
    </div>
{/if}
