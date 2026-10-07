{* A paragraph as v2 renders the stored XML (eZXml2Html5_core.xsl):
   - a paragraph that holds nothing but custom tags gets no <p> of its own (v2: paragraph[not(text())][custom]):
     a lone <sup> or <sub> line, or custom tags that leave an empty element behind;
   - a paragraph with nothing in it is not printed (the standard design prints <p>&nbsp;</p>, which v2 never has:
     such a paragraph comes from a custom tag that draws nothing, or from the space next to a block embed);
   - otherwise <p> with the class and the alignment, as the standard design. *}
{def $pa_text = $content|trim
     $pa_bare = false()}
{if $pa_text|eq( '' )}
    {set $pa_bare = true()}
{else}
    {foreach array( 'sup', 'sub' ) as $pa_tag}
        {if and( $pa_text|begins_with( concat( '<', $pa_tag, '>' ) ), $pa_text|ends_with( concat( '</', $pa_tag, '>' ) ),
                 $pa_text|explode( concat( '<', $pa_tag, '>' ) )|count|eq( 2 ) )}{set $pa_bare = true()}{/if}
    {/foreach}
    {if and( $pa_text|begins_with( '<custom ' ), $pa_text|strip_tags|trim|eq( '' ) )}{set $pa_bare = true()}{/if}
{/if}
{if $pa_bare}{$pa_text}{else}
{set $classification = cond( and( is_set( $align ), $align ), concat( $classification, ' text-', $align ), $classification )}
<p{if $classification|trim} class="{$classification|wash}"{/if}>{$content}</p>
{/if}
{undef $pa_text $pa_bare}
