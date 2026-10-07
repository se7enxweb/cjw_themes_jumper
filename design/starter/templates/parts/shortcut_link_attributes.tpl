{* The attributes of a link to what a shortcut points at (v2 macro content_link_parameters): href, and for an
   external target target="_blank" rel="nofollow noopener noreferrer". Reads the shortcut's "link" field
   (ngenhancedlink, the shortcut class on alpha) or v2's fields (url, related_object, target_blank); a shortcut
   without a target links to itself. Input: $shortcut (node). Output: attributes only, on one line. *}
{def $sl_href = ''
     $sl_blank = false()
     $sl_dm = $shortcut.data_map}
{if and( is_set( $sl_dm.link ), $sl_dm.link.has_content )}
    {def $sl_link = enhanced_link( $sl_dm.link )}
    {if $sl_link}
        {set $sl_href = cond( $sl_link.absolute, $sl_link.href, cond( and( $sl_link.href|begins_with( '/' ), $sl_link.href|begins_with( '//' )|not ), $sl_link.href|ezurl( 'no' ), $sl_link.href ) )}
        {set $sl_blank = $sl_link.target|eq( '_blank' )}
    {/if}
    {undef $sl_link}
{elseif and( is_set( $sl_dm.related_object ), $sl_dm.related_object.has_content, $sl_dm.related_object.content.main_node )}
    {set $sl_href = $sl_dm.related_object.content.main_node.url_alias|ezurl( 'no' )}
{elseif and( is_set( $sl_dm.url ), $sl_dm.url.has_content )}
    {set $sl_href = $sl_dm.url.content}
    {set $sl_blank = true()}
{/if}
{if and( is_set( $sl_dm.target_blank ), $sl_dm.target_blank.data_int )}{set $sl_blank = true()}{/if}
{if $sl_href|eq( '' )}{set $sl_href = $shortcut.url_alias|ezurl( 'no' )}{/if}
href="{$sl_href|wash}"{if $sl_blank} target="_blank" rel="nofollow noopener noreferrer"{/if}{undef $sl_href $sl_blank $sl_dm}
