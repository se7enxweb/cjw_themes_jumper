{* v2: themes/cjw_app/content/carousel/image.html.twig - a slick slide linking the large image (fancybox group
   "carousel"), showing the 16:9 crop. Input: $node, $view_type. *}
{def $ci_dm = $node.data_map}
{if and( is_set( $ci_dm.image ), $ci_dm.image.has_content )}
<div class="slick-slide">
    <a href="{$ci_dm.image.content['cjw_i1920'].url|ezroot( 'no' )}" title="{$node.name|wash}"
       data-fancybox="{$view_type|wash}">
        <img src="{$ci_dm.image.content['cjw_i900_16-9'].url|ezroot( 'no' )}"
             alt="{cond( $ci_dm.image.content.alternative_text|ne( '' ), $ci_dm.image.content.alternative_text, $node.name )|wash}"/>
            </a>
</div>
{/if}
{undef $ci_dm}
