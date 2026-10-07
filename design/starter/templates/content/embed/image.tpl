{* Embed view of image in rich text (v2: app/content/embed/image.html.twig): the image (cjw_i770 when the embed
   is aligned, else cjw_i1200, lazy with the cjw_i30 placeholder), linked when the embed has a link, and its caption.
   Input: ei_object (the image object), ei_params (object parameters), ei_link (link parameters). *}
{def $ei_map = $ei_object.data_map}
{if and( is_set( $ei_map.image ), $ei_map.image.has_content )}
{def $ei_image = $ei_map.image.content
     $ei_alias = cond( and( is_set( $ei_params.align ), $ei_params.align|ne( '' ) ), 'cjw_i770', 'cjw_i1200' )
     $ei_href = cond( and( is_set( $ei_link.href ), $ei_link.href|ne( '' ) ), $ei_link.href, '' )}
    <div class="view-type view-type-embed image">
        <figure class="image-wrapper">
            {if $ei_href|ne( '' )}<a href={$ei_href|ezurl}{if and( is_set( $ei_link.class ), $ei_link.class|ne( '' ) )} class="{$ei_link.class|wash}"{/if}{if and( is_set( $ei_link.target ), $ei_link.target|ne( '' ) )} target="{$ei_link.target|wash}"{/if}{if and( is_set( $ei_link.title ), $ei_link.title|ne( '' ) )} title="{$ei_link.title|wash}"{/if}>{/if}
            <img src="{$ei_image['cjw_i30'].url|ezroot( 'no' )}" data-src="{$ei_image[$ei_alias].url|ezroot( 'no' )}" alt="{if $ei_image.alternative_text|ne( '' )}{$ei_image.alternative_text|wash}{else}{$ei_object.name|wash}{/if}" class="ezimage-field" />
            {if $ei_href|ne( '' )}</a>{/if}

            {if and( is_set( $ei_map.caption ), $ei_map.caption.has_content )}
                <figcaption>
                    <div class="ezxmltext-field">{$ei_map.caption.content.output.output_text}</div>
                </figcaption>
            {/if}
        </figure>
    </div>
{undef $ei_image $ei_alias $ei_href}
{/if}
{undef $ei_map}
