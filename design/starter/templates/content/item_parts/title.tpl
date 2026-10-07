{* The title of an item, as text (v2 macro content_fields.title): the first non-empty of teaser_title, title,
   name, else the content name. it_fields replaces the order (v2's cjw macro: title, teaser_title, short_title,
   name). Parameters: it_node, it_fields. *}
{def $itt_text = ''
     $itt_dm = $it_node.data_map}
{foreach first_set( $it_fields, array( 'teaser_title', 'title', 'name' ) ) as $itt_f}
    {if and( $itt_text|eq( '' ), is_set( $itt_dm[$itt_f] ), $itt_dm[$itt_f].has_content )}{set $itt_text = $itt_dm[$itt_f].content}{/if}
{/foreach}
{if $itt_text|eq( '' )}{set $itt_text = $it_node.name}{/if}
{$itt_text|wash}{undef $itt_text $itt_dm}
