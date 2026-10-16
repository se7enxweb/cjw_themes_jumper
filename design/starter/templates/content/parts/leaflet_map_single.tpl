{* A Leaflet map with one marker at the location field of a node (v2: cjw_app/parts/leaflet_map_single.html.twig).
   Zoom levels and the tile layer come from cjw_jumper.ini [Leaflet] (v2: cjwsite.leaflet.*); the tile layer is
   a module path of the current siteaccess, relative to the host (v2 writes the host in front; an absolute URL
   here would be kept in the view cache that Apache and Velocity share and send one server's visitors to the other).
   The statements end in semicolons (v2 relies on line breaks, which the template engine drops after {rdelim}).
   Input: lm_node, the node with the ezgmaplocation field "location". *}
{if and( is_set( $lm_node.data_map.location ), $lm_node.data_map.location.has_content )}
{def $lm_loc = $lm_node.data_map.location.content
     $lm_id = concat( 'leaflet_map', $lm_node.node_id )
     $lm_zoom = ezini( 'Leaflet', 'InitialZoom', 'cjw_jumper.ini' )
     $lm_title = cond( is_set( $lm_node.data_map.title ), $lm_node.data_map.title.content, $lm_node.name )}
    <div id="{$lm_id}"
         class="leaflet-map map-content embed-responsive embed-responsive-16by9"
         data-map-id="{$lm_node.node_id}"
         data-address="{$lm_loc.address|wash}"
         data-latitude="{$lm_loc.latitude|wash}"
         data-longitude="{$lm_loc.longitude|wash}">

    </div>

    <script type="text/javascript">
        (function ( $ ) {ldelim}
            let obj, map;

            $( function() {ldelim}

                obj = jQuery( '#' + '{$lm_id}' );

                mapOptions = {ldelim} 'zoom': {$lm_zoom}, 'center': [ obj.attr( 'data-latitude' ), obj.attr( 'data-longitude' ) ] {rdelim};
                map = L.map( {$lm_id}, mapOptions );

                markerIcon = L.icon({ldelim} iconUrl: '{'images/grafiken/kartensymbol-allgemein.png'|ezdesign( 'no' )}',
                                      iconSize: [38, 58],
                                      iconAnchor: [22, 54],
                                      popupAnchor: [0, -56]
                {rdelim});

                markerPopup = L.popup().setContent( '<h1>{$lm_title|wash( 'javascript' )}</h1><p>{$lm_loc.address|wash|wash( 'javascript' )}</p>' );

                markerOptions = {ldelim} 'icon': markerIcon {rdelim};

                L.tileLayer( "{ezini( 'Leaflet', 'TileLayer', 'cjw_jumper.ini' )|ezurl( 'no' )}?x={ldelim}x{rdelim}{ldelim}and{rdelim}y={ldelim}y{rdelim}{ldelim}and{rdelim}z={ldelim}z{rdelim}", {ldelim}
                    and: '&',
                    attribution: '&copy; <a href="http://openstreetmap.org/copyright" target="_blank">OpenStreetMap</a> contributors',
                    minZoom: {ezini( 'Leaflet', 'MinZoom', 'cjw_jumper.ini' )},
                    maxZoom: {ezini( 'Leaflet', 'MaxZoom', 'cjw_jumper.ini' )}
                {rdelim} ).addTo( map );

                var marker = L.marker( [
                    obj.attr( 'data-latitude' ),
                    obj.attr( 'data-longitude' )
                ], markerOptions ).addTo( map );

                marker.bindPopup( markerPopup );
            {rdelim} );

            // Expose object and map to the global scope
            window['obj_{$lm_id}'] = obj;
            window['map_{$lm_id}'] = map;
        {rdelim})( jQuery );
    </script>
{undef $lm_loc $lm_id $lm_zoom $lm_title}
{/if}
