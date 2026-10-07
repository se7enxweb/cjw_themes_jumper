{* Full view of ng_category (v2: cjw_app/content/full/ng_category.html.twig).
   part = 'content' (the whole view) or one of the Twig block names content_header, title, intro, body;
   other names draw nothing.
   The body lists the children when show_children is set: classes from children_class_filter_include (comma
   separated, empty: all), the whole subtree with fetch_subtree, page_limit per page (default 12, v2's), in the
   item view of view_type (default standard) and the grid_columns column classes. v2's pagerfanta pager is
   not drawn (no category of the starter has more children than one page).
   Input: node, part. *}
{def $fc_part = first_set( $part, 'content' )
     $fc_map = $node.data_map}
{def $fc_all = $fc_part|eq( 'content' )}
{if or( $fc_all, $fc_part|eq( 'content_header' ) )}
        <header class="full-page-header">
{/if}
{if or( $fc_all, $fc_part|eq( 'content_header' ), $fc_part|eq( 'title' ) )}
                <h1 class="full-page-title"><span class="ezstring-field">{$fc_map.title.content|wash}</span></h1>
{/if}
{if or( $fc_all, $fc_part|eq( 'content_header' ), $fc_part|eq( 'intro' ) )}
                {if $fc_map.full_intro.has_content}
                    <div class="full-page-intro">
                        <div class="ezxmltext-field">{$fc_map.full_intro.content.output.output_text}</div>
                    </div>
                {/if}
{/if}
{if or( $fc_all, $fc_part|eq( 'content_header' ) )}
        </header>
{/if}
{if or( $fc_all, $fc_part|eq( 'body' ) )}
        <div class="view-type view-type-full ng-category vf2">

            {if $fc_map.body.has_content}
                <div class="category-body">
                    <div class="ezxmltext-field">{$fc_map.body.content.output.output_text}</div>
                </div>
            {/if}

            <div class="category-featured-content">
                {if $fc_map.featured_content.has_content}
                {foreach $fc_map.featured_content.content.relation_list as $fc_rel}
                    {def $fc_obj = fetch( 'content', 'object', hash( 'object_id', $fc_rel.contentobject_id ) )}
                    {if and( $fc_obj, $fc_obj.main_node )}
                        {def $fc_tpl = item_view_template( 'standard', $fc_obj.class_identifier )}
                        {if $fc_tpl|ne( '' )}{include uri=concat( 'design:', $fc_tpl ) node=$fc_obj.main_node view_type='standard'}{/if}
                        {undef $fc_tpl}
                    {/if}
                    {undef $fc_obj}
                {/foreach}
                {/if}
            </div>

            {if $fc_map.show_children.data_int|eq( 1 )}
                {def $fc_vt = 'standard'
                     $fc_cols = '3'
                     $fc_classes = array()
                     $fc_limit = cond( $fc_map.page_limit.data_int|gt( 0 ), $fc_map.page_limit.data_int, 12 )}
                {if and( is_set( $fc_map.view_type.content.0 ), $fc_map.view_type.content.0|ne( '' ) )}{set $fc_vt = $fc_map.view_type.content.0}{/if}
                {if and( is_set( $fc_map.grid_columns.content.0 ), $fc_map.grid_columns.content.0|ne( '' ) )}{set $fc_cols = $fc_map.grid_columns.content.0}{/if}
                {foreach $fc_map.children_class_filter_include.content|explode( ',' ) as $fc_c}{if $fc_c|trim|ne( '' )}{set $fc_classes = $fc_classes|append( $fc_c|trim )}{/if}{/foreach}
                {def $fc_params = hash( 'parent_node_id', $node.node_id,
                                        'sort_by', $node.sort_array,
                                        'limit', $fc_limit,
                                        'offset', first_set( $view_parameters.offset, 0 ) )}
                {if $fc_classes|count}{set $fc_params = $fc_params|merge( hash( 'class_filter_type', 'include', 'class_filter_array', $fc_classes ) )}{/if}
                {def $fc_children = fetch( 'content', cond( $fc_map.fetch_subtree.data_int|eq( 1 ), 'tree', 'list' ), $fc_params )
                     $fc_col_class = cond( $fc_cols|eq( '1' ), 'col-12', $fc_cols|eq( '2' ), 'col-sm-6', $fc_cols|eq( '4' ), 'col-lg-3 col-md-4 col-sm-6', 'col-md-4 col-sm-6' )}
                {if $fc_children|count}
                    <div class="category-children">
                        {if $fc_vt|eq( 'listitem' )}
                            <ul class="listitem-list">
                                {foreach $fc_children as $fc_child}
                                    <li>
                                        {def $fc_tpl = item_view_template( $fc_vt, $fc_child.class_identifier )}
                                        {if $fc_tpl|ne( '' )}{include uri=concat( 'design:', $fc_tpl ) node=$fc_child view_type=$fc_vt}{/if}
                                        {undef $fc_tpl}
                                    </li>
                                {/foreach}
                            </ul>
                        {else}
                            <div class="row">
                                {foreach $fc_children as $fc_child}
                                    <div class="{$fc_col_class}">
                                        {def $fc_tpl = item_view_template( $fc_vt, $fc_child.class_identifier )}
                                        {if $fc_tpl|ne( '' )}{include uri=concat( 'design:', $fc_tpl ) node=$fc_child view_type=$fc_vt}{/if}
                                        {undef $fc_tpl}
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                    </div>
                {/if}
                {undef $fc_vt $fc_cols $fc_classes $fc_limit $fc_params $fc_children $fc_col_class}
            {/if}

        </div>
{/if}
{undef $fc_part $fc_map $fc_all}
