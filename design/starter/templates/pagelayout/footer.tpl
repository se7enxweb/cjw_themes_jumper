{* The footer (v2: themes/cjw_app/page_footer.html.twig): the footer logo and the footer menu. The menu is the
   additional_menu of the site info object; without one, the bottom list of the offcanvas menu (the children of
   the root from [Menu] BreakPriority on), which is what v2's additional menu holds. *}
{def $ft_info = fetch( 'content', 'node', hash( 'remote_id', ezini( 'SiteInfo', 'NodeRemoteID', 'cjw_jumper.ini' ) ) )
     $ft_items = array()}
{if and( $ft_info, is_set( $ft_info.data_map.additional_menu ), $ft_info.data_map.additional_menu.has_content )}
    {foreach $ft_info.data_map.additional_menu.content.relation_list as $ft_rel}
        {def $ft_obj = fetch( 'content', 'object', hash( 'object_id', $ft_rel.contentobject_id ) )}
        {if and( $ft_obj, $ft_obj.main_node )}{set $ft_items = $ft_items|append( $ft_obj.main_node )}{/if}
        {undef $ft_obj}
    {/foreach}
{elseif $pl_root_node}
    {set $ft_items = fetch( 'content', 'list', hash( 'parent_node_id', $pl_root_node.node_id, 'sort_by', array( 'priority', true() ),
                                                   'limit', ezini( 'Menu', 'Limit', 'cjw_jumper.ini' ),
                                                   'attribute_filter', array( 'and', array( 'priority', '>=', ezini( 'Menu', 'BreakPriority', 'cjw_jumper.ini' ) ),
                                                                                     array( 'priority', '<=', ezini( 'Menu', 'MaxPriority', 'cjw_jumper.ini' ) ) ) ) )}
{/if}
<footer>
    <div class="container">
        <div class="row">
            <div class="col-6">
                <div class="footer-logo">
{include uri='design:parts/site_logo.tpl' logo=ezini( 'Footer', 'Logo', 'cjw_jumper.ini' )}
                </div>
            </div>

            <div class="col-6">
{if $ft_items|count}
                                            <ul class="nav navbar-nav">
{foreach $ft_items as $ft_index => $ft_item}
                <li id="menu-item-location-id-{$ft_item.node_id}" class="{if $ft_index|eq( 0 )}firstli{/if}{if $ft_index|eq( $ft_items|count|dec )}{if $ft_items|count|eq( 1 )} {/if}lastli{/if}">        <a href={$ft_item.url_alias|ezurl}>{$ft_item.name|wash}</a>        
    </li>

{/foreach}
    </ul>
{/if}
                            </div>
        </div>
    </div>
</footer>
{undef $ft_info $ft_items}
