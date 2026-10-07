{* The language switcher (new: v2 has none; plan D-08/D-09). One link per other language of the site, to the same
   page in that language's siteaccess (language_switcher(), from [RegionalSettings] TranslationSA, so no siteaccess
   name is written here), labelled with its name there. The switcher carries the class cjw-language-switcher, which
   the pixel gate hides, since v2 has nothing in its place.
   Input: $variant 'top-link' (inline, after the top links, $separator: a "|" before it) or 'offcanvas' (a list item). *}
{def $ls_translations = language_switcher( concat( '', cond( and( $pl_node, $pl_node.url_alias|ne( '' ) ), $pl_node.url_alias, '' ) ) )
     $ls_locale = ezini( 'RegionalSettings', 'Locale', 'site.ini' )}
{if $ls_translations|count|gt( 1 )}
{if $variant|eq( 'offcanvas' )}
    <li class="nav-item cjw-language-switcher">
{foreach $ls_translations as $ls_sa => $ls_t}{if $ls_t.locale|ne( $ls_locale )}
                <a class="nav-link" href={$ls_t.url|ezurl} hreflang="{$ls_t.locale|wash}" title="{'Change language'|i18n( 'design/starter/pagelayout' )|wash}">
            {$ls_t.text|wash}
        </a>
{/if}{/foreach}
    </li>
{else}
                    <span class="cjw-language-switcher">{if $separator}|{/if}
{foreach $ls_translations as $ls_sa => $ls_t}{if $ls_t.locale|ne( $ls_locale )}
                    <a href={$ls_t.url|ezurl} hreflang="{$ls_t.locale|wash}" title="{'Change language'|i18n( 'design/starter/pagelayout' )|wash}">{$ls_t.text|wash}</a>
{/if}{/foreach}
                    </span>
{/if}
{/if}
{undef $ls_translations $ls_locale}
