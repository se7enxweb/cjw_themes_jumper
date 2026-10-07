{* v2: nglayouts/themes/app/block/two_columns/two_columns_{33_66,50_50,66_33}.html.twig. The blocks of each
   placeholder (left, right); a column without content gives its width to the other, as in v2. *}
{def $tc_id = $block.id
     $tc_vt = $block.view_type}
{* the children are drawn by block.tpl, whose "block" parameter replaces $block here: id and view type kept first *}
{set-block variable=tc_left}{foreach $zone.blocks as $tc_child}{if and( first_set( $tc_child.parent_id, 0 )|eq( $tc_id ), first_set( $tc_child.placeholder, '' )|eq( 'left' ), first_set( $tc_child.definition_identifier, '' )|ne( '' ) )}{include uri='design:explayouts/block/block.tpl' block=$tc_child zone=$zone}{/if}{/foreach}{/set-block}
{set-block variable=tc_right}{foreach $zone.blocks as $tc_child}{if and( first_set( $tc_child.parent_id, 0 )|eq( $tc_id ), first_set( $tc_child.placeholder, '' )|eq( 'right' ), first_set( $tc_child.definition_identifier, '' )|ne( '' ) )}{include uri='design:explayouts/block/block.tpl' block=$tc_child zone=$zone}{/if}{/foreach}{/set-block}
{def $tc_left_class = 'col-md-6'
     $tc_right_class = 'col-md-6'}
{if $tc_vt|eq( 'two_columns_33_66' )}
    {if and( $tc_left|contains( '<img' )|not, $tc_left|strip_tags|trim|eq( '' ) )}
        {set $tc_left_class = 'col-0' $tc_right_class = 'col-12'}
    {else}
        {set $tc_left_class = 'col-12 col-sm-12 col-md-6 col-lg-4' $tc_right_class = 'col-12 col-sm-12 col-md-6 col-lg-8'}
    {/if}
{elseif $tc_vt|eq( 'two_columns_66_33' )}
    {if and( $tc_right|contains( '<img' )|not, $tc_right|strip_tags|trim|eq( '' ) )}
        {set $tc_left_class = 'col-md-12' $tc_right_class = 'col-md-0'}
    {else}
        {set $tc_left_class = 'col-md-8' $tc_right_class = 'col-md-4'}
    {/if}
{elseif $tc_right|strip_tags|trim|eq( '' )}
    {set $tc_left_class = 'col-md-12' $tc_right_class = 'col-md-0'}
{/if}
        <div class="row">
        <div class="{$tc_left_class}">
{$tc_left}
        </div>
        <div class="{$tc_right_class}">
{$tc_right}
        </div>
    </div>
{undef $tc_left_class $tc_right_class $tc_id $tc_vt $tc_left $tc_right}
