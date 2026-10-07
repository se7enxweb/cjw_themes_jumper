{* The image of an item (v2 macros content_fields.image and cjw_content_fields.image): the first non-empty
   field of ip_fields (default teaser_image, image), drawn lazily as v2 does (src = the tiny cjw_i30 alias,
   data-src = the alias asked for), linked when ip_link is given. Nothing is drawn without an image, except the
   empty figure when ip_always is set (v2's cjw macro keeps its figure).
   Parameters: ip_node, ip_alias (default cjw_i480), ip_link (href, '' = no link), ip_link_class,
   ip_figure_class (default 'image', '' = no figure), ip_fields, ip_always. *}
{def $ipi_fields = first_set( $ip_fields, array( 'teaser_image', 'image' ) )
     $ipi_alias = first_set( $ip_alias, 'cjw_i480' )
     $ipi_href = first_set( $ip_link, '' )
     $ipi_figure = first_set( $ip_figure_class, 'image' )
     $ipi_dm = $ip_node.data_map
     $ipi_attr = false()
     $ipi_alt = ''}
{foreach $ipi_fields as $ipi_f}
    {if and( $ipi_attr|not, is_set( $ipi_dm[$ipi_f] ), $ipi_dm[$ipi_f].data_type_string|eq( 'ezimage' ), $ipi_dm[$ipi_f].has_content )}{set $ipi_attr = $ipi_dm[$ipi_f]}{/if}
{/foreach}
{if or( $ipi_attr, first_set( $ip_always, false() ) )}
{if $ipi_figure|ne( '' )}<figure class="{$ipi_figure|wash}">{/if}
{if $ipi_attr}
{set $ipi_alt = cond( $ipi_attr.content.alternative_text|ne( '' ), $ipi_attr.content.alternative_text, $ip_node.name )}
{if $ipi_href|ne( '' )}<a href="{$ipi_href|wash}"{if first_set( $ip_link_class, '' )|ne( '' )} class="{$ip_link_class|wash}"{/if} aria-label="{$ipi_alt|wash}">{/if}<img src="{$ipi_attr.content['cjw_i30'].url|ezroot( 'no' )}" data-src="{$ipi_attr.content[$ipi_alias].url|ezroot( 'no' )}" alt="{$ipi_alt|wash}" class="ezimage-field" />{if $ipi_href|ne( '' )}</a>{/if}
{/if}
{if $ipi_figure|ne( '' )}</figure>{/if}
{/if}
{undef $ipi_fields $ipi_alias $ipi_href $ipi_figure $ipi_dm $ipi_attr $ipi_alt}
