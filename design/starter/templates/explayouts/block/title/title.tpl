{* v2: nglayouts/themes/app/block/title.html.twig: the heading in the tag of the block (default h1), an optional
   icon, the title linked when the block's link is used. *}
{def $tt_p = $block.parameters
     $tt_tag = first_set( $block.parameters.tag, '' )}
{if array( 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p', 'div', 'span' )|contains( $tt_tag )|not}{set $tt_tag = 'h1'}{/if}
        <{$tt_tag} class="title">
{if and( first_set( $tt_p['title_icon:enabled'], '' )|eq( '1' ), first_set( $tt_p['title_icon:css_class'], '' )|ne( '' ) )}
            <div class="title-icon"><i class="{$tt_p['title_icon:css_class']|wash}"></i></div>
{/if}
{if and( first_set( $tt_p.use_link, '' )|eq( '1' ), first_set( $block.values.has_link, false() ), first_set( $block.values.link_href, '' )|ne( '' ) )}
            <a href={$block.values.link_href|ezurl}{if first_set( $block.values.link_target, '' )|ne( '' )} target="{$block.values.link_target|wash}"{/if}>{first_set( $tt_p.title, '' )|wash}</a>
{else}
                                {first_set( $tt_p.title, '' )|wash}
{/if}
            </{$tt_tag}>
{undef $tt_p $tt_tag}
