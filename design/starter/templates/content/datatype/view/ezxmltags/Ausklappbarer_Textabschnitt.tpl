{* Custom tag "Ausklappbarer_Textabschnitt" (a folded text section, the "Name" attribute is the label of the fold),
   as v2's ezxml_tags.xsl draws it: the text once hidden (d-none), and once in the fold. The folding is the
   ".toggle-block .control-section" handler of the design's inline script. *}
<span class="d-none">{$content}</span><span class="toggle-block state-closed close-others has-custom-title section">
<span class="content">{$content}</span><span class="control-section">
<span class="text-is-closed">{first_set( $Name, '' )|wash}</span><span class="text-is-opened">{first_set( $Name, '' )|wash}</span>
</span>
</span>
