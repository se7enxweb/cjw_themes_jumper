{* The name of a page in menus and the breadcrumb, as v2 shows it: v2 names its objects <teaser_title|title>, so
   a page with a teaser title appears under it ("Startseite"), whatever name this installation's class pattern
   gives the object. Input: $label_node. Output: the washed label, nothing else. *}{if and( is_set( $label_node.data_map.teaser_title ), $label_node.data_map.teaser_title.has_content )}{$label_node.data_map.teaser_title.content|wash}{else}{$label_node.name|wash}{/if}
