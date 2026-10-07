{* The link tag as v2 draws it. v2 prints a target only when the stored link has one, and every link with a target
   gets rel="nofollow noopener noreferrer"; a link without a stored target has neither.
   Exponential's XML schema fills in target="_self" when none is stored, so a stored "_self" cannot be told from no
   target here: "_self" is treated as no target. That matches every v2 link without a target and every link with
   another target; a link stored with "_self" loses the attribute it would have on v2 (the browser's behaviour is
   the same). *}<a href={$href|ezurl}{if $id} id="{$id|wash}"{/if}{if $title} title="{$title|wash}"{/if}{if and( $target, ne( $target, '_self' ) )} target="{$target|wash}" rel="nofollow noopener noreferrer"{/if}{if $classification} class="{$classification|wash}"{/if}{if and( is_set( $hreflang ), $hreflang )} hreflang="{$hreflang|wash}"{/if}>{$content}</a>