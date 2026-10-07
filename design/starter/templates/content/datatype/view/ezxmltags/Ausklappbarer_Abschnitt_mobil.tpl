{* Custom tag "Ausklappbarer_Abschnitt_mobil" (a section shown as is on large screens and folded on small ones,
   with the "Name" attribute as the label of the fold), as v2's ezxml_tags.xsl draws it. The folding is the
   ".toggle-block .control" handler of the design's inline script. *}
<div class="d-none d-lg-block">{$content}</div><div class="toggle-block state-closed close-others has-custom-title mobil d-lg-none">
<div class="content">
{$content}
<div style="clear: both; height: 1px;"></div>
</div>
<div class="control">
<span class="text-is-closed">{first_set( $Name, '' )|wash}</span><span class="text-is-opened">{first_set( $Name, '' )|wash}</span>
</div>
</div>
