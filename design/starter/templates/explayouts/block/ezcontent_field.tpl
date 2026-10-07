{* v2: layouts-ezplatform block/ezcontent_field - one field of the current content (field_identifier), drawn as
   v2's field templates draw it: ezxmltext in div.ezxmltext-field, a string in span.ezstring-field, an image as
   img.ezimage-field (alias cjw_i1200). v2 puts field-<identifier> on the block wrapper. *}
{def $cf_name = first_set( $block.parameters.field_identifier, '' )
     $cf_node = false()}
{if and( $cf_name|ne( '' ), is_set( $module_result.node_id ), $module_result.node_id|gt( 0 ) )}
    {set $cf_node = fetch( 'content', 'node', hash( 'node_id', $module_result.node_id ) )}
{/if}
{if and( $cf_node, is_set( $cf_node.data_map[$cf_name] ), $cf_node.data_map[$cf_name].has_content )}
{def $cf_attr = $cf_node.data_map[$cf_name]}
{switch match=$cf_attr.data_type_string}
{case match='ezxmltext'}
        <div class="ezxmltext-field">{$cf_attr.content.output.output_text}</div>
{/case}
{case match='ezimage'}
        <img src="{$cf_attr.content['cjw_i1200'].url|ezroot( 'no' )}" alt="{$cf_attr.content.alternative_text|wash}" class="ezimage-field" />
{/case}
{case in=array( 'ezstring', 'eztext', 'ezemail', 'ezinteger', 'ezfloat' )}
        <span class="{$cf_attr.data_type_string}-field">{$cf_attr.content|wash}</span>
{/case}
{case}
        {attribute_view_gui attribute=$cf_attr}
{/case}
{/switch}
{undef $cf_attr}
{/if}
{undef $cf_name $cf_node}
