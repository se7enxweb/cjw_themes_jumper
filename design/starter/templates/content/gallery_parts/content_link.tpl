{* v2 macro content_link (common/parts/macros): the name, linked to the content's url field (target_blank opens a
   new window) or to its related object; plain text without a target. Input: $gp_node, $gp_text. *}
{def $gp_ldm = $gp_node.data_map
     $gp_url = ''
     $gp_blank = false()}
{if and( is_set( $gp_ldm.url ), $gp_ldm.url.has_content )}
    {set $gp_url = $gp_ldm.url.content}
    {set $gp_blank = and( is_set( $gp_ldm.target_blank ), $gp_ldm.target_blank.data_int|eq( 1 ) )}
{elseif and( is_set( $gp_ldm.related_object ), $gp_ldm.related_object.has_content, $gp_ldm.related_object.content.id|ne( $gp_node.contentobject_id ), $gp_ldm.related_object.content.main_node )}
    {set $gp_url = $gp_ldm.related_object.content.main_node.url_alias|ezurl( 'no' )}
{elseif and( is_set( $gp_ldm.link ), $gp_ldm.link.has_content )}
    {* alpha's banner class keeps the target in an enhanced link *}
    {def $gp_el = enhanced_link( $gp_ldm.link )}
    {if $gp_el}{set $gp_url = cond( $gp_el.absolute, $gp_el.href, $gp_el.href|ezurl( 'no' ) ) $gp_blank = $gp_el.target|eq( '_blank' )}{/if}
    {undef $gp_el}
{/if}
{if $gp_url|ne( '' )}<a href="{$gp_url|wash}"{if $gp_blank} target="_blank" rel="nofollow noopener noreferrer"{/if}>{/if}{$gp_text|wash}{if $gp_url|ne( '' )}</a>{/if}
{undef $gp_ldm $gp_url $gp_blank}
