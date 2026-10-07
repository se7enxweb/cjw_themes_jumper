{* v2 macro content_relation_parameters: the href of an item, which is its url field (target _blank when
   target_blank is set), else the main location of its related_object (not itself), else its own location;
   plus class. Output: attributes only. Parameters: rl_node, rl_class. *}
{def $rla_dm = $rl_node.data_map
     $rla_href = $rl_node.url_alias|ezurl( 'no' )
     $rla_blank = false()}
{if and( is_set( $rla_dm.url ), $rla_dm.url.has_content )}
    {set $rla_href = $rla_dm.url.content}
    {if and( is_set( $rla_dm.target_blank ), $rla_dm.target_blank.data_int )}{set $rla_blank = true()}{/if}
{elseif and( is_set( $rla_dm.related_object ), $rla_dm.related_object.has_content )}
    {def $rla_rel = cond( $rla_dm.related_object.data_type_string|eq( 'ezobjectrelationlist' ), fetch( 'content', 'object', hash( 'object_id', $rla_dm.related_object.content.relation_list[0].contentobject_id ) ), $rla_dm.related_object.content )}
    {if and( $rla_rel, $rla_rel.id|ne( $rl_node.contentobject_id ), $rla_rel.main_node )}{set $rla_href = $rla_rel.main_node.url_alias|ezurl( 'no' )}{/if}
    {undef $rla_rel}
{/if}
href="{$rla_href|wash}"{if first_set( $rl_class, '' )|ne( '' )} class="{$rl_class|wash}"{/if}{if $rla_blank} target="_blank" rel="nofollow noopener noreferrer"{/if}{undef $rla_dm $rla_href $rla_blank}
