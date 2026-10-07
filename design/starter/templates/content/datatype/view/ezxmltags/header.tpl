{* The header tag as v2 draws it: the table-of-contents anchor (<a id="eztoc_<n>_<m>"></a>), then the heading one
   level down (level 1 is <h2>), with align as an attribute. *}
<a id="eztoc{$toc_anchor_name|wash}"></a>{def $hd_level = cond( and( is_set( $level ), $level|gt( 0 ) ), $level|inc, 2 )}{if $hd_level|gt( 6 )}{set $hd_level = 6}{/if}<h{$hd_level}{if and( is_set( $align ), $align )} align="{$align|wash}"{/if}{if $classification|trim} class="{$classification|trim|wash}"{/if}>{$content}</h{$hd_level}>{undef $hd_level}
