{* The table cell as v2 draws it: the vertical alignment as a style only, and the text of the cell in its paragraph
   (<th><p>...</p></th>). The installation renders a single paragraph in a cell without <p>
   (ezxml.ini RenderParagraphInTableCells=disabled, from ezwebin, which the starter settings cannot outrank), so the
   paragraph is put back here when the cell does not start with a block of its own. *}
{def $cell_text = $content|trim}
<th{if $classification} class="{$classification|wash}"{/if}{if $colspan} colspan="{$colspan|wash}"{/if}{if $rowspan} rowspan="{$rowspan|wash}"{/if} style="vertical-align: {first_set( $valign, 'top' )|wash};">{if or( $cell_text|eq( '' ), $cell_text|begins_with( '<p' ), $cell_text|begins_with( '<ul' ), $cell_text|begins_with( '<ol' ), $cell_text|begins_with( '<table' ), $cell_text|begins_with( '<h' ), $cell_text|begins_with( '<div' ), $cell_text|begins_with( '<a id="eztoc' ) )}{$cell_text}{else}<p>{$cell_text}</p>{/if}</th>
{undef $cell_text}
