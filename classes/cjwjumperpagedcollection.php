<?php
/**
 * One page of a paged Layouts list or grid block of the design starter (v2: Netgen Layouts' ajax block route).
 *
 * The design's nglayouts.js (v2's paging script) reads the block's data-base-url, appends "&page=<n>", fetches
 * that address and puts the body's elements into the block's .ajax-container (pager: replaces them, load_more:
 * appends them). The address is the view cjw_paging/page (module of this extension):
 *
 *   /<siteaccess>/cjw_paging/page/<block id>?node_id=<page the block is on>&page=<n>
 *
 * and the answer is the items of page <n>, drawn by the block's own template (list.tpl or grid.tpl with
 * $paged_page_only), so a later page carries exactly the markup of the first.
 *
 * Only published list/grid blocks with paged_collections enabled and a dynamic collection answer, only for a page
 * node the current user may read, and only for pages within paged_collections:max_pages when that is set;
 * anything else is an empty answer. The node is handed to the collection as its "current location"
 * (expLayoutsDynamicCollection::setContextNode) for the fetch only.
 *
 * @copyright Copyright (C) 1998 - 2026 Exponential Foundation and 7x and JAC Systeme. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */
class cjwJumperPagedCollection
{
    /**
     * @return string the items' markup, '' when there is nothing to show
     */
    public static function render( $blockId, $nodeId, $page )
    {
        $blockId = (int)$blockId;
        $nodeId = (int)$nodeId;
        $page = (int)$page;
        if ( $blockId <= 0 || $nodeId <= 0 || $page <= 0 )
            return '';

        $block = expLayoutsBlock::fetch( $blockId, true );
        if ( !$block || (int)$block->attribute( 'status' ) !== 2 )
            return '';
        $viewType = $block->attribute( 'view_type' );
        if ( $viewType !== 'list' && $viewType !== 'grid' )
            return '';
        $params = array();
        foreach ( expLayoutsBlockParameter::fetchByBlock( $blockId ) as $param )
            $params[$param->attribute( 'name' )] = $param->attribute( 'value' );
        if ( empty( $params['paged_collections:enabled'] ) )
            return '';
        if ( !empty( $params['paged_collections:max_pages'] ) && $page > (int)$params['paged_collections:max_pages'] )
            return '';

        $node = eZContentObjectTreeNode::fetch( $nodeId );
        if ( !$node instanceof eZContentObjectTreeNode || !$node->canRead() )
            return '';

        $collection = expLayoutsCollection::fetchByBlock( $blockId, true );
        if ( !$collection || $collection->attribute( 'collection_type' ) !== 'dynamic' )
            return '';
        $limit = (int)$collection->attribute( 'limit_value' );
        if ( $limit <= 0 )
            return '';

        // An explayouts without setContextNode() would fetch the page without its "current location": no answer
        // is better than the items of another page.
        if ( !method_exists( 'expLayoutsDynamicCollection', 'setContextNode' ) )
            return '';
        expLayoutsDynamicCollection::setContextNode( $node );
        try
        {
            $prepared = expLayoutsRenderer::prepareBlock( $block );
            $collection->setAttribute( 'offset_value', (int)$collection->attribute( 'offset_value' ) + ( $page - 1 ) * $limit );
            $result = expLayoutsDynamicCollection::fetch( $collection );
        }
        finally
        {
            expLayoutsDynamicCollection::setContextNode( null );
        }
        if ( $result === false || empty( $result['items'] ) )
            return '';

        $prepared['values'] = $result;
        $tpl = eZTemplate::factory();
        $tpl->setVariable( 'block', $prepared );
        $tpl->setVariable( 'node', $node );
        $tpl->setVariable( 'paged_page_only', true );
        return $tpl->fetch( 'design:explayouts/block/list/' . $viewType . '.tpl' );
    }
}
