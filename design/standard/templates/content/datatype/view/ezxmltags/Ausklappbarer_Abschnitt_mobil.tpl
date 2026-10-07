{* Custom tag "Ausklappbarer_Abschnitt_mobil" of the starter content, for every design other than starter (the
   admin preview among them): the section shown open, its label (attribute Name) as a tooltip. The starter design
   draws v2's fold for small screens. *}
<div class="cjw-fold"{if and( is_set( $Name ), $Name|ne( '' ) )} title="{$Name|wash}"{/if}>{$content}</div>
