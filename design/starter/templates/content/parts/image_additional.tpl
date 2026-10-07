{* The additional image of an article (v2: cjw_app/parts/related_multimedia/image_additional.html.twig, rendered
   for the article itself; the title is the first of teaser_title, title and the object name, as v2's content_fields.title): a figure, with a lightbox link to the additional image when there is one.
   The image inside is v2's ng_render_field of an image field: the lazy placeholder and the original.
   Input: ia_node. *}
{def $ia_map = $ia_node.data_map}
<figure class="image-wrapper">
    {if and( $ia_map.additional_image.has_content, $ia_map.image.has_content )}
    {def $ia_image = $ia_map.additional_image.content
         $ia_title = cond( and( is_set( $ia_map.teaser_title ), $ia_map.teaser_title.has_content ), $ia_map.teaser_title.content, and( is_set( $ia_map.title ), $ia_map.title.has_content ), $ia_map.title.content, $ia_node.name )}
        <a href="{$ia_image['cjw_i1200'].url|ezroot( 'no' )}"
           title="{$ia_title|wash}" data-fancybox=""
           alt="{$ia_map.image.content.alternative_text|wash}">
            <img
            src="{$ia_image['cjw_i30'].url|ezroot( 'no' )}"
            data-src="{$ia_image['original'].url|ezroot( 'no' )}"
            alt="{if $ia_image.alternative_text|ne( '' )}{$ia_image.alternative_text|wash}{else}{$ia_title|wash}{/if}"
            class="ezimage-field" />
        </a>
    {undef $ia_image $ia_title}
    {/if}
</figure>
{undef $ia_map}
