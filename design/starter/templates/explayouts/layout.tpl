{* A layout of the design starter: the zones by identifier, handed to the template of the layout type
   (explayouts/layouts/<layout type>.tpl, the markup of v2's nglayouts app theme).
   Input: $layout (expLayoutsRenderer::prepareLayout(), or the chrome layout pagelayout.tpl builds). *}
{def $lo_zones = hash()}
{foreach $layout.zones as $lo_zone}
    {set $lo_zones = $lo_zones|merge( hash( $lo_zone.identifier, $lo_zone ) )}
{/foreach}
{include uri=concat( 'design:explayouts/layouts/', $layout.layout_type, '.tpl' ) zones=$lo_zones layout=$layout}
{undef $lo_zones}
