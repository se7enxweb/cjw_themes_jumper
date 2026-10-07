{* The table header cell as v2 draws it: the vertical alignment as a style only. *}
<th{if $classification} class="{$classification|wash}"{/if}{if $colspan} colspan="{$colspan|wash}"{/if}{if $rowspan} rowspan="{$rowspan|wash}"{/if} style="vertical-align: {first_set( $valign, 'top' )|wash};">{$content}</th>
