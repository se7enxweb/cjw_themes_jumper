{* v2: nglayouts/themes/cjw_app/block/button/button_custom.html.twig - a link styled as a button (class btn and the
   view type), or a plain span when the link is empty. The handler resolves the link (url, mailto, tel, internal). *}
{def $bc_href = first_set( $block.values.link, '' )
     $bc_text = first_set( $block.parameters.text, first_set( $block.values.text, '' ) )}
{if and( $bc_href|ne( '' ), $bc_href|ne( 'tel:0' ) )}
        <article class="view-type view-type-button custom-button">
            <a href={cond( or( $bc_href|begins_with( 'http' ), $bc_href|begins_with( 'mailto:' ), $bc_href|begins_with( 'tel:' ) ), concat( '"', $bc_href|wash, '"' ), $bc_href|ezurl )} class="btn {first_set( $block.view_type, '' )|wash}"
                {if first_set( $block.values.target, first_set( $block.values.link_target, '' ) )|eq( '_blank' )} target="_blank" rel="noopener noreferrer" {/if}
            >
                {$bc_text|wash}
            </a>
        </article>
{else}
        <article class="view-type view-type-button custom-button">
            <span class="btn {first_set( $block.view_type, '' )|wash}" style="cursor: default;">
                {$bc_text|wash}
            </span>
        </article>
{/if}
{undef $bc_href $bc_text}
