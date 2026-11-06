{* v2: themes/cjw_app/content/carousel/image.html.twig - a slick slide linking the large image (cjw_i1920, else the
   slide's crop) in the fancybox group named after the view type and the block (carousel-<block id>: two carousels
   on one page otherwise showed each other's images in fancyBox), showing the 16:9 crop (cjw_i900_16-9, lazy). The alt
   text is the image's own, else the caption, else the name; the link names it for screen readers and carries the
   caption. js-gallery-fancybox: cjw_jumper_page.js groups these links without the slides slick clones.
   Input: $node, $view_type, $block. *}
{def $ci_dm = $node.data_map
     $ci_caption = ''
     $ci_alt = ''
     $ci_large = ''
     $ci_slide = ''}
{if and( is_set( $ci_dm.caption ), $ci_dm.caption.has_content )}
    {set $ci_caption = $ci_dm.caption.content.output.output_text|strip_tags|trim}
{/if}
{if and( is_set( $ci_dm.image ), $ci_dm.image.has_content )}
    {set $ci_alt = $ci_dm.image.content.alternative_text|strip_tags|trim}
    {if $ci_alt|eq( '' )}{set $ci_alt = $ci_caption}{/if}
    {if $ci_alt|eq( '' )}{set $ci_alt = $node.name}{/if}
    {set $ci_slide = first_set( $ci_dm.image.content['cjw_i900_16-9'].url, '' )
         $ci_large = first_set( $ci_dm.image.content['cjw_i1920'].url, '' )}
    {if $ci_large|eq( '' )}{set $ci_large = $ci_slide}{/if}
    {if $ci_slide|eq( '' )}{set $ci_slide = $ci_large}{/if}
    {if $ci_slide|ne( '' )}
<div class="gallery-slide">
    <a href="{$ci_large|ezroot( 'no' )}" title="{$node.name|wash}"
       aria-label="{'Open larger view: %alt'|i18n( 'design/starter/gallery', , hash( '%alt', $ci_alt ) )|wash}"
       data-fancybox="{first_set( $view_type, 'carousel' )|wash}{if is_set( $block.id )}-{$block.id|wash}{/if}"
       {if $ci_caption|ne( '' )}data-caption="{$ci_caption|wash}"{/if}
       class="js-gallery-fancybox">
        <img src="{$ci_slide|ezroot( 'no' )}" alt="{$ci_alt|wash}" loading="lazy"/>
    </a>
</div>
    {/if}
{/if}
{undef $ci_dm $ci_caption $ci_alt $ci_large $ci_slide}
