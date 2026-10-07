{* The pager of the design starter (v2: the "ngsite" Pagerfanta view, site-bundle views/pagerfanta/ngsite2.html.twig,
   with its page arithmetic from Pagerfanta/View/SiteView.php: two pages either side of the current one).
   Included with:
     pg_count    number of pages
     pg_current  the current page (1 based)
     pg_url      the address of a page without its number, ending in "page=" (already through ezurl, not washed)
   Draws nothing for a single page. The words "Previous", "Next" and "of" stay English, as v2 shows them. *}
{if $pg_count|gt( 1 )}
{def $pg_start = $pg_current|sub( 2 )
     $pg_end = $pg_current|sum( 2 )}
{if $pg_start|lt( 1 )}{set $pg_end = min( $pg_end|sum( 1|sub( $pg_start ) ), $pg_count ) $pg_start = 1}{/if}
{if $pg_end|gt( $pg_count )}{set $pg_start = max( $pg_start|sub( $pg_end|sub( $pg_count ) ), 1 ) $pg_end = $pg_count}{/if}

<nav class="page-navigation">
    <ul>

        {if $pg_current|gt( 2 )}
            <li class="page-item d-block d-xs-none"><a href="{concat( $pg_url, 1 )|wash}" class="page-link"><i class="fa fa-angle-double-left"></i></a></li>
        {/if}

        {if $pg_current|gt( 1 )}
            <li class="page-item"><a href="{concat( $pg_url, $pg_current|dec )|wash}" class="page-link" rel="prev">Previous</a></li>
        {/if}

        {if $pg_start|gt( 1 )}
            <li class="page-item d-none d-xs-block"><a href="{concat( $pg_url, 1 )|wash}" class="page-link">1</a></li>
        {/if}

        {if $pg_start|eq( 3 )}
            <li class="page-item d-none d-xs-block"><a href="{concat( $pg_url, 2 )|wash}" class="page-link">2</a></li>
        {/if}

        {if $pg_start|gt( 3 )}
            <li class="page-item disabled d-none d-xs-block"><span class="page-link page-link-separate">...</span></li>
        {/if}

        {for $pg_start to $pg_end as $pg_i}
            {if $pg_i|eq( $pg_current )}
                <li class="page-item current"><span class="page-link">{$pg_i}<span class="d-inline d-xs-none"> of {$pg_count}</span></span></li>
            {else}
                <li class="page-item d-none d-xs-block"><a href="{concat( $pg_url, $pg_i )|wash}" class="page-link">{$pg_i}</a></li>
            {/if}
        {/for}

        {if $pg_end|lt( $pg_count|sub( 2 ) )}
            <li class="page-item disabled d-none d-xs-block"><span class="page-link page-link-separate">...</span></li>
        {/if}

        {if $pg_end|eq( $pg_count|sub( 2 ) )}
            <li class="page-item d-none d-xs-block"><a href="{concat( $pg_url, $pg_count|dec )|wash}" class="page-link">{$pg_count|dec}</a></li>
        {/if}

        {if $pg_count|gt( $pg_end )}
            <li class="page-item d-none d-xs-block"><a href="{concat( $pg_url, $pg_count )|wash}" class="page-link">{$pg_count}</a></li>
        {/if}

        {if $pg_current|lt( $pg_count )}
            <li class="page-item"><a href="{concat( $pg_url, $pg_current|inc )|wash}" class="page-link" rel="next">Next</a></li>
        {/if}

        {if $pg_current|lt( $pg_count|dec )}
            <li class="page-item d-block d-xs-none"><a href="{concat( $pg_url, $pg_count )|wash}" class="page-link"><i class="fa fa-angle-double-right"></i></a></li>
        {/if}

    </ul>
</nav>
{undef $pg_start $pg_end}
{/if}
