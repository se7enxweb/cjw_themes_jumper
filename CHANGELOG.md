# Changelog

## 0.1.1

- Updated: The map tiles `osm_proxy` caches get the mode of `site.ini [FileSettings] StorageFilePermissions`
  within the limit for new files of the kernel (`EZP_FILE_MODE_MAX` in `config.php`, Exponential 6.0.15). Without
  that limit, or on an older kernel, they get exactly the mode they got before.

## 0.1.0

The first release: the design `starter`, a port of the Nexus v2 CJW starter look to Exponential 6.

- Added: The design `starter` with the stylesheets, fonts, images and scripts of the v2 starter site, the scripts
  running on the jQuery of ezjscore.
- Added: The page layout, header, offcanvas menu, breadcrumb, cookie banner, pre-footer and footer.
- Added: Templates for the layouts, zones and blocks of the starter layouts, with v2's view types; paged list and
  grid blocks load their later pages through the module `cjw_paging`.
- Added: The full, line, list, event, tile, teaser, button, slide, gallery and embed views of the starter classes.
- Added: The search, sign-in, registration, password and error pages.
- Added: The feedback forms, with a honeypot field that drops automated submissions, and the video and audio pages.
- Added: The custom XML tags of the starter content, with plain renderings for the admin and every other design.
- Added: The image aliases `cjw_i30` ... `cjw_i1920` and their 16:9 crops, drawn in v2's sizes and pixels.
- Added: The module `osm_proxy`, cached map tiles for the Leaflet maps.
- Added: The German design strings.
- Added: The original images and files of the starter content in `share/`.
- Added: The event container page shows its events when the extension `cjw_tmv` is active.
