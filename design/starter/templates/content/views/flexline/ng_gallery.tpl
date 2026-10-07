{* Item view "flexline" of a gallery (v2: cjw_app/content/flexline/ng_gallery.html.twig): title, intro,
   description, then the image and video children in column_count columns (default 3), each a lightbox link
   to the original. *}
{def $fg_dm = $node.data_map
     $fg_items = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id, 'class_filter_type', 'include', 'class_filter_array', array( 'image', 'ng_video' ), 'sort_by', $node.sort_array ) )
     $fg_cols = 3}
{if and( is_set( $fg_dm.column_count ), $fg_dm.column_count.has_content, $fg_dm.column_count.content|int|gt( 0 ) )}{set $fg_cols = $fg_dm.column_count.content|int}{/if}
    <div class="view-type view-type-{first_set( $view_type, 'flexline' )|wash} ng-gallery cjw-gallery ng-gallery">

        <div class="gallery-title">
                <span class="ezstring-field">{$fg_dm.title.content|wash}</span>
        </div>

        <div class="gallery-body">
            {if and( is_set( $fg_dm.teaser_intro ), $fg_dm.teaser_intro.has_content )}
                <div class="article-intro">
                    {include uri='design:content/item_parts/xml.tpl' ix_attr=$fg_dm.teaser_intro}
                </div>
            {/if}

            {if and( is_set( $fg_dm.description ), $fg_dm.description.has_content )}
                {include uri='design:content/item_parts/xml.tpl' ix_attr=$fg_dm.description}
            {/if}
        </div>

        {if $fg_items|count|gt( 0 )}
            <div class="row no-gutters gallery-items">
            {foreach $fg_items as $fg_item}
                <div class="col-sm-6 col-md-6 col-lg-{div( 12, $fg_cols )|floor} {$fg_item.class_identifier|explode( '_' )|implode( '-' )}">
                    {if and( is_set( $fg_item.data_map.image ), $fg_item.data_map.image.has_content )}<a href="{$fg_item.data_map.image.content.original.url|ezroot( 'no' )}" data-gallery><img src="{$fg_item.data_map.image.content.original.url|ezroot( 'no' )}" alt="{$fg_item.data_map.image.content.alternative_text|wash}" class="ezimage-field" /></a>{/if}
                </div>
            {/foreach}
            </div>
        {/if}

    </div>
{undef $fg_dm $fg_items $fg_cols}
