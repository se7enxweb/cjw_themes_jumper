<?php /* #?ini charset="utf-8"?

# The osm_proxy module (/osm_proxy/tiles/(get)/1?x=&y=&z=), the tile source of the Leaflet maps
# of the design "starter". The map tiles come from TileServer and are cached
# on this installation, so visitors never contact the tile server themselves.
# Mind the tile usage policy of the server you name here
# (https://operations.osmfoundation.org/policies/tiles/): a real User-Agent,
# caching for at least 7 days, no bulk downloads.

[OsmProxy]
# https only; {z}, {x}, {y} are replaced by validated integers
TileServer=https://tile.openstreetmap.org/{z}/{x}/{y}.png
MinZoom=0
MaxZoom=19
# seconds a cached tile is used before it is fetched again (7 days)
CacheTTL=604800
ConnectTimeout=5
Timeout=10
# empty: "Exponential osm_proxy (cjw_themes_jumper; <SiteURL>)"
UserAgent=

*/ ?>
