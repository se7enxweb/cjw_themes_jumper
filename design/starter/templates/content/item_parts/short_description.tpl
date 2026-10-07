{* v2's cjw macro short_description: the first non-empty of teaser_intro, teaser_text, short_description,
   intro, drawn as its field. Parameter: sd_node, sd_fields (another field list, e.g. the description fields). *}
{def $sdd_dm = $sd_node.data_map
     $sdd_done = false()}
{foreach first_set( $sd_fields, array( 'teaser_intro', 'teaser_text', 'short_description', 'intro' ) ) as $sdd_f}
    {if and( $sdd_done|not, is_set( $sdd_dm[$sdd_f] ), $sdd_dm[$sdd_f].has_content )}
        {set $sdd_done = true()}
        {if $sdd_dm[$sdd_f].data_type_string|eq( 'ezxmltext' )}{include uri='design:content/item_parts/xml.tpl' ix_attr=$sdd_dm[$sdd_f]}{else}{$sdd_dm[$sdd_f].content|wash}{/if}
    {/if}
{/foreach}
{undef $sdd_dm $sdd_done}
