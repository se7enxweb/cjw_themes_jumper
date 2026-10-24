# Changelog

## 0.1.10

- Updated: Remember me is checked by default on the starter design's login form, as on the kernel's login forms
  in Exponential 6.0.15 (site.ini [Session] RememberMeTimeout, now 360 days).

## 0.1.5

- Fixed: The starter design passes the contrast, target size and link name checks (axe, WCAG 2.2 AA). The small
  logo link of the top navigation is named by its image ("Go to home page"). `starter.css` darkens, in the same
  hue, the v2 colours that carried white text or sat as text on white below 4.5:1 (the footer, the coloured tiles,
  the single tile's title backdrop below the desktop width, the event teasers, the orange of rich text links, a
  light orange on the dark grey teasers) and makes the footer menu links 24px high; the v2 stylesheets stay
  unchanged. Related multimedia images and linked event images fall back to the object's name for their alt text.

## 0.1.4

- Fixed: The single-location map (`content/parts/leaflet_map_single.tpl`) escapes the address and the title for
  HTML before it escapes them for JavaScript (`|wash|wash( 'javascript' )`). Both go into
  `L.popup().setContent()`, which reads HTML, so markup in an address or a title ran in the popup. Pull request
  #1 by ekked (address), title fixed alongside. ezgmaplocation 6.0.8 stores the address as typed; run its
  upgrade step (`decodeaddressentities.php`) so that older addresses do not show their HTML entities.

## 0.1.3

- Updated: The login page shows the register link only to a visitor who may open `user/register`
  (`fetch( 'user', 'can_open' )`): unchanged on a site that keeps `user/register` in the policy omit list,
  hidden on a new Exponential 6.0.15 installation until the Anonymous role gets the `user/register` policy. The
  idea comes from LoveStack, Mugo Web's distribution (commit 98854ab935), with thanks.

## 0.1.2

- Added: Open Graph and Twitter tags on every page of the design `starter` (`pagelayout/head/opengraph.tpl`):
  `og:title`, `og:description`, `og:url` (with the siteaccess path), `og:type` (`article` for the classes of
  `cjw_jumper.ini [OpenGraph] ArticleClasses`), `og:site_name`, `og:locale` (from the siteaccess locale),
  `twitter:card` and exactly one `og:image` with `twitter:image`.
- Added: `og:image` is the image of the metadata field (its own or the class default, with xrowmetadata 1.4.7 and
  later), else the page's image field or its first related multimedia item in `cjw_i1200_16-9`, else the new
  design image `images/opengraph/starter_default.png` (1200 x 630). Settings in `cjw_jumper.ini [OpenGraph]`.

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
