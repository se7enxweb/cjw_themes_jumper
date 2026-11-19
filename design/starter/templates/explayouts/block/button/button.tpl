{* v2: layouts-standard nglayouts/themes/standard/block/button.html.twig - the view type "button": the link with the
   class of the style (default_button: btn btn-default, highlighted_button: btn btn-primary, link: link; the handler
   maps it), drawn only with both a link and a text. *}
{def $bb_href = first_set( $block.values.link, '' )
     $bb_text = first_set( $block.values.text, '' )}
{if and( $bb_href|ne( '' ), $bb_text|ne( '' ) )}
<a href={cond( or( $bb_href|begins_with( 'http' ), $bb_href|begins_with( 'mailto:' ), $bb_href|begins_with( 'tel:' ) ), concat( '"', $bb_href|wash, '"' ), $bb_href|ezurl )} class="{first_set( $block.values.class, '' )|wash}"{if first_set( $block.values.target, '' )|eq( '_blank' )} target="_blank" rel="noopener noreferrer"{/if}>{$bb_text|wash}</a>
{/if}
{undef $bb_href $bb_text}
