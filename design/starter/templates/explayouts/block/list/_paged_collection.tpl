{* Paged collection of a list or grid block (v2: @NetgenLayouts/collection/paged_collection.html.twig, pager.html.twig
   and default_pager.html.twig): the .ajax-collection around the items and the .ajax-navigation after them, which the
   design's nglayouts.js turns into a pager or a "Load more" link. data-base-url is the view
   cjw_paging/page (class cjwJumperPagedCollection), to which the script appends "&page=<n>"; it answers the
   items of that page drawn by the block's own template.
   Input: $block, $part ('open': wrapper and container start; 'close': container end, navigation, wrapper end),
   $wrap_class (class of the container: 'row' for grids, empty for lists).
   Page count as v2's pager: total / items of the first page, rounded up, at most paged_collections:max_pages. *}
{if $part|eq( 'open' )}
{def $pc_url = concat( 'cjw_paging/page/', $block.id, '?node_id=', first_set( $module_result.node_id, $node.node_id, 0 ) )}
        <div class="ajax-collection" {if first_set( $block.parameters['paged_collections:ajax_first'], '' )|eq( '1' )}data-load-initial{/if} data-base-url="{$pc_url|ezurl( 'no' )}">
    <div class="ajax-container {$wrap_class}" >
{undef $pc_url}
{else}
{def $pc_type = first_set( $block.parameters['paged_collections:type'], '' )
     $pc_count = $block.values.items|count
     $pc_total = first_set( $block.values.total, $pc_count )
     $pc_pages = 1
     $pc_max = first_set( $block.parameters['paged_collections:max_pages'], '' )}
{if $pc_type|ne( 'load_more' )}{set $pc_type = 'pager'}{/if}
{if and( $pc_count|gt( 0 ), $pc_total|gt( $pc_count ) )}{set $pc_pages = ceil( $pc_total|div( $pc_count ) )}{/if}
{if and( $pc_max|ne( '' ), $pc_max|int|gt( 0 ), $pc_pages|gt( $pc_max|int ) )}{set $pc_pages = $pc_max|int}{/if}
                            </div>

    
<nav class="ajax-navigation"
    data-page="1"
    data-total-pages="{$pc_pages}"
    data-type="{$pc_type}"
{if $pc_type|eq( 'pager' )}
{literal}
    data-template="
    &lt;ul&gt;
        &lt;li &lt;%=if (this.page === 1) {%&gt;class=&#039;disabled&#039;&lt;%=}%&gt;&gt;
            &lt;a href=&#039;&lt;%=this.url(this.page - 1)%&gt;&#039; class=&#039;ajax-nav-prev&#039; rel=&#039;prev nofollow noopener noreferrer&#039;&gt;
                Previous
            &lt;/a&gt;
        &lt;/li&gt;
        &lt;%=for(var i = 1; i &lt;= this.pages; i++) {%&gt;
            &lt;%=if (this.pages &lt; 10 || i === 1 || i === this.pages || i === this.page || i-1 === this.page || i-2 === this.page || i+1 === this.page || i+2 === this.page) {%&gt;
                &lt;li &lt;%=if (this.page === i) {%&gt;class=&#039;current&#039;&lt;%=}%&gt;&gt;
                    &lt;a href=&#039;&lt;%=this.url(i)%&gt;&#039; class=&#039;ajax-nav-link&#039; &lt;%=if (this.page-1 === i) {%&gt;rel=&#039;prev nofollow noopener noreferrer&#039;&lt;%=}else if (this.page+1 === i) {%&gt;rel=&#039;next nofollow noopener noreferrer&#039;&lt;%=} else {%&gt;rel=&#039;nofollow noopener noreferrer&#039;&lt;%=}%&gt;&gt;
                        &lt;%=i%&gt;
                    &lt;/a&gt;
                &lt;/li&gt;
            &lt;%=}else if (i === 2 || i === this.pages - 1) {%&gt;
                &lt;li&gt;&lt;span&gt;...&lt;/span&gt;&lt;/li&gt;
            &lt;%=}%&gt;
        &lt;%=}%&gt;
        &lt;li &lt;%=if (this.page === this.pages) {%&gt;class=&#039;disabled&#039;&lt;%=}%&gt;&gt;
            &lt;a href=&#039;&lt;%=this.url(this.page + 1)%&gt;&#039; class=&#039;ajax-nav-next&#039; rel=&#039;next nofollow noopener noreferrer&#039;&gt;
                Next
            &lt;/a&gt;
        &lt;/li&gt;
    &lt;/ul&gt;

">{/literal}
{else}
{literal}
    data-template="
    &lt;%=if (this.page &lt; this.pages) {%&gt;
        &lt;a href=&#039;&lt;%=this.url(this.page + 1)%&gt;&#039; class=&#039;ajax-load-more&#039; rel=&#039;nofollow noopener noreferrer&#039;&gt;
            Load more
        &lt;/a&gt;
    &lt;%=}%&gt;

">{/literal}
{/if}
</nav>

</div>
{undef $pc_type $pc_count $pc_total $pc_pages $pc_max}
{/if}
