{* Emphasis as v2 writes it (eZXml2Html5_core.xsl: <em>), not the standard design's <i>. *}<em{if ne( $classification|trim, '' )} class="{$classification|wash}"{/if}>{$content}</em>
