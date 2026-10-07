{* The table cell as v2 draws it: the vertical alignment as a style only. *}
<td{if $classification} class="{$classification|wash}"{/if}{if $colspan} colspan="{$colspan|wash}"{/if}{if $rowspan} rowspan="{$rowspan|wash}"{/if} style="vertical-align: {first_set( $valign, 'top' )|wash};">{$content}</td>
