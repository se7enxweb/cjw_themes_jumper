{* Full view of ng_gallery (v2: app/content/full/ng_gallery.html.twig): the related multimedia (the gallery's
   images and videos, a swiper slider for more than one) and the intro and description.
   part = 'content' (the whole view) or the Twig block name content (same); other names draw nothing.
   Input: node, part. *}
{if first_set( $part, 'content' )|eq( 'content' )}
{def $fg_map = $node.data_map}
    <div class="view-type view-type-full ng-gallery">
        {include uri='design:content/parts/related_multimedia.tpl' rm_node=$node}

        <div class="full-article-body">
            {if $fg_map.teaser_intro.has_content}
                <div class="article-intro">
                    <div class="ezxmltext-field">{$fg_map.teaser_intro.content.output.output_text}</div>
                </div>
            {/if}

            {if $fg_map.description.has_content}
                <div class="ezxmltext-field">{$fg_map.description.content.output.output_text}</div>
            {/if}
        </div>
    </div>
{undef $fg_map}
{/if}
