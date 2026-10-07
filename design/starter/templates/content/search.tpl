{* The search page of the design starter (v2: themes/app/search/search.html.twig).
   The search runs here, not in the kernel (site.ini [SearchSettings] SearchViewHandling=template in this
   extension), so it is limited to the content tree of the siteaccess ([NodeSettings] RootNode of content.ini) and
   understands v2's addresses as well as the kernel's: the text from SearchText or v2's searchText, the page from
   v2's page=<n> or the kernel's /(offset)/<n>. Ten hits a page, as v2. *}
{def $s_text = ''
     $s_limit = 10
     $s_page = 1
     $s_root = ezini( 'NodeSettings', 'RootNode', 'content.ini' )}
{if and( is_set( $search_text ), is_string( $search_text ) )}{set $s_text = $search_text}{/if}
{if and( $s_text|eq( '' ), ezhttp_hasvariable( 'searchText', 'get' ) )}
    {set $s_text = ezhttp( 'searchText', 'get' )}
    {if is_string( $s_text )|not}{set $s_text = ''}{/if}
{/if}
{set $s_text = $s_text|trim}
{if ezhttp_hasvariable( 'page', 'get' )}
    {set $s_page = ezhttp( 'page', 'get' )|int}
{elseif and( is_set( $view_parameters.offset ), $view_parameters.offset|gt( 0 ) )}
    {set $s_page = $view_parameters.offset|int|div( $s_limit )|floor|inc}
{/if}
{if $s_page|lt( 1 )}{set $s_page = 1}{/if}
{def $s_result = array()
     $s_count = 0}
{if $s_text|ne( '' )}
    {def $s_search = fetch( 'content', 'search', hash( 'text', $s_text,
                                                      'subtree_array', array( $s_root ),
                                                      'offset', $s_page|dec|mul( $s_limit ),
                                                      'limit', $s_limit ) )}
    {set $s_result = $s_search.SearchResult
         $s_count = $s_search.SearchCount}
    {undef $s_search}
{/if}
{def $s_pages = $s_count|div( $s_limit )|ceil
     $s_page_url = concat( '/content/search'|ezurl( 'no' ), '?searchText=', $s_text|urlencode, '&page=' )}
                <form action={'/content/search'|ezurl} method="get" class="form-search">
        <header class="full-page-header full-search-header">
            <div class="container">
                <div class="search-inputs">
                    <div class="input-group">
                        <input type="text" value="{$s_text|wash}" name="SearchText" id="Search" class="form-control" placeholder="{'Search'|i18n( 'design/starter/search' )}" />
                        <button type="submit" class="btn btn-dark">{'Search'|i18n( 'design/starter/search' )}</button>
                    </div>

                    {if $s_text|ne( '' )}
                        {if $s_count|eq( 0 )}
                            <div class="result-message result-message-error">
                                <h2>{'No results were found when searching for "%searchText".'|i18n( 'design/starter/search', '', hash( '%searchText', $s_text|wash ) )}</h2>
                            </div>
                        {else}
                            <div class="result-message result-message-success">
                                <h2>{'Search for "%searchText" returned %searchCount matches'|i18n( 'design/starter/search', '', hash( '%searchText', $s_text|wash, '%searchCount', $s_count ) )}</h2>
                            </div>
                        {/if}
                    {/if}
                </div>
            </div>
        </header>

        <div class="full-search-results">
            <div class="container">
                {if $s_text|ne( '' )}
                    <div class="row">
                        <div class="col-xs-12">
                            {if $s_count|gt( 0 )}
                                {include uri='design:parts/pager.tpl' pg_count=$s_pages pg_current=$s_page pg_url=$s_page_url}

                                <div id="search-result">
                                    {foreach $s_result as $s_node}
                                        {include uri='design:content/search/item.tpl' node=$s_node}
                                    {/foreach}
                                </div>

                                {include uri='design:parts/pager.tpl' pg_count=$s_pages pg_current=$s_page pg_url=$s_page_url}
                            {else}
                                <ul class="full-no-results-list">
                                    <li>{'Check spelling of keywords.'|i18n( 'design/starter/search' )}</li>
                                    <li>{'Try changing some keywords (eg. "car" instead of "cars").'|i18n( 'design/starter/search' )}</li>
                                    <li>{'Try searching for less specific keywords.'|i18n( 'design/starter/search' )}</li>
                                    <li>{'Reduce number of keywords to get more results.'|i18n( 'design/starter/search' )}</li>
                                </ul>
                            {/if}
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </form>
{undef $s_text $s_limit $s_page $s_root $s_result $s_count $s_pages $s_page_url}
