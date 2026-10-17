{* A Leaflet map with one marker at the location field of a node (v2: cjw_app/parts/leaflet_map_single.html.twig).
   Zoom levels and the tile layer come from cjw_jumper.ini [Leaflet] (v2: cjwsite.leaflet.*); the tile layer is
   a module path of the current siteaccess, relative to the host (v2 writes the host in front; an absolute URL
   here would be kept in the view cache that Apache and Velocity share and send one server's visitors to the other).
   No inline code: the map is drawn by javascript/cjw_jumper_page.js (loaded in the page head) from the data
   attributes below. The popup's title and address go into L.popup().setContent(), which reads HTML: each is
   escaped for HTML (|wash) inside data-popup, and the attribute itself is escaped again.
   Input: lm_node, the node with the ezgmaplocation field "location". *}
{if and( is_set( $lm_node.data_map.location ), $lm_node.data_map.location.has_content )}
{def $lm_loc = $lm_node.data_map.location.content
     $lm_id = concat( 'leaflet_map', $lm_node.node_id )
     $lm_title = cond( is_set( $lm_node.data_map.title ), $lm_node.data_map.title.content, $lm_node.name )}
    <div id="{$lm_id}"
         class="leaflet-map map-content embed-responsive embed-responsive-16by9"
         data-cjw-leaflet="1"
         data-map-id="{$lm_node.node_id}"
         data-address="{$lm_loc.address|wash}"
         data-latitude="{$lm_loc.latitude|wash}"
         data-longitude="{$lm_loc.longitude|wash}"
         data-zoom="{ezini( 'Leaflet', 'InitialZoom', 'cjw_jumper.ini' )|wash}"
         data-min-zoom="{ezini( 'Leaflet', 'MinZoom', 'cjw_jumper.ini' )|wash}"
         data-max-zoom="{ezini( 'Leaflet', 'MaxZoom', 'cjw_jumper.ini' )|wash}"
         data-icon-url="{'images/grafiken/kartensymbol-allgemein.png'|ezdesign( 'no' )|wash}"
         data-tile-url="{ezini( 'Leaflet', 'TileLayer', 'cjw_jumper.ini' )|ezurl( 'no' )|wash}"
         data-popup="{concat( '<h1>', $lm_title|wash, '</h1><p>', $lm_loc.address|wash, '</p>' )|wash}">

    </div>
{undef $lm_loc $lm_id $lm_title}
{/if}
