{* v2: layouts-standard block/three_columns/<view type>.html.twig - a row of three columns, the placeholders left,
   center and right (explayouts' own col_1, col_2, col_3 are read too). Widths by view type. *}
{def $th_id = $block.id
     $th_widths = array( 4, 4, 4 )
     $th_names = array( array( 'left', 'col_1' ), array( 'center', 'col_2' ), array( 'right', 'col_3' ) )}
{switch match=first_set( $block.view_type, '' )}
{case match='three_columns_25_25_50'}{set $th_widths = array( 3, 3, 6 )}{/case}
{case match='three_columns_25_50_25'}{set $th_widths = array( 3, 6, 3 )}{/case}
{case match='three_columns_50_25_25'}{set $th_widths = array( 6, 3, 3 )}{/case}
{case}{/case}
{/switch}
{* the children are drawn by block.tpl, whose "block" parameter replaces $block here: id kept first *}
{set-block variable=th_col_0}{foreach $zone.blocks as $th_child}{if and( first_set( $th_child.parent_id, 0 )|eq( $th_id ), $th_names[0]|contains( first_set( $th_child.placeholder, '' ) ), first_set( $th_child.definition_identifier, '' )|ne( '' ) )}{include uri='design:explayouts/block/block.tpl' block=$th_child zone=$zone}{/if}{/foreach}{/set-block}
{set-block variable=th_col_1}{foreach $zone.blocks as $th_child}{if and( first_set( $th_child.parent_id, 0 )|eq( $th_id ), $th_names[1]|contains( first_set( $th_child.placeholder, '' ) ), first_set( $th_child.definition_identifier, '' )|ne( '' ) )}{include uri='design:explayouts/block/block.tpl' block=$th_child zone=$zone}{/if}{/foreach}{/set-block}
{set-block variable=th_col_2}{foreach $zone.blocks as $th_child}{if and( first_set( $th_child.parent_id, 0 )|eq( $th_id ), $th_names[2]|contains( first_set( $th_child.placeholder, '' ) ), first_set( $th_child.definition_identifier, '' )|ne( '' ) )}{include uri='design:explayouts/block/block.tpl' block=$th_child zone=$zone}{/if}{/foreach}{/set-block}
        <div class="row">
        <div class="col-md-{$th_widths[0]}">
{$th_col_0}
        </div>
        <div class="col-md-{$th_widths[1]}">
{$th_col_1}
        </div>
        <div class="col-md-{$th_widths[2]}">
{$th_col_2}
        </div>
    </div>
{undef $th_id $th_widths $th_names $th_col_0 $th_col_1 $th_col_2}
