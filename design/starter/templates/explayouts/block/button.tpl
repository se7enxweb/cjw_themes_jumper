{* v2 button block: button/<view type>.tpl. JAC's view types button_lightblue, button_blue and button_green (and the
   older button_custom) are drawn by button_custom.tpl, whose class is the view type; "button" is Netgen's own. *}
{if first_set( $block.view_type, '' )|eq( 'button' )}
{include uri='design:explayouts/block/button/button.tpl' block=$block}
{else}
{include uri='design:explayouts/block/button/button_custom.tpl' block=$block}
{/if}
