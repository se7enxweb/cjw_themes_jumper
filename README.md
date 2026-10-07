# CJW Themes Jumper (cjw_themes_jumper)

The design `starter` for Exponential 6: the look of the Nexus v2 CJW starter site, ported to plain Exponential
template code. It draws the starter content (the CJW starter siteaccesses, English and German) with v2's markup,
stylesheets and scripts.

Status: 0.1.0, the first release.

## What it brings

- The design `starter` (`design/starter/`): the page layout, header, offcanvas menu, breadcrumb, pre-footer and
  footer; the full, line, list, tile, teaser, slide, gallery and embed views of the starter classes; the search,
  sign-in, registration, password and error pages; the feedback forms with a honeypot field.
- Templates for the Layouts blocks of the starter layouts (list, grid, gallery, title, rich text, columns, button
  and more) and their view types, including paged list and grid blocks (module `cjw_paging`).
- The custom XML tags of the starter content, with plain renderings for the admin and every other design
  (`design/standard/`).
- The image aliases `cjw_i30` ... `cjw_i1920` (and the 16:9 crops), drawn by the converter
  `cjwJumperImagineImageHandler` as v2 draws its own.
- The module `osm_proxy`: cached map tiles for the Leaflet maps, so visitors never contact the tile server.
- The German design strings (`translations/ger-DE/`).
- The original images and files of the starter content (`share/content-images/`, `share/content-files/`), which the
  CJW starter content package reads when it is installed.

## Global and siteaccess settings

The extension is a **global** extension (`ActiveExtensions[]`). Global are only the custom XML tags
(`settings/content.ini.append.php`), the image aliases, the design and the extension's own settings files, so every
siteaccess (the admin and the online editor included) can open and save the starter content without losing its
tags. Everything that changes how a site behaves (template overrides, search, information collection, Layouts block
view types, the modules) is in `settings/siteaccess/cjw_starter/` and reaches only the siteaccesses that ask for it
with `[SiteAccessSettings] ExtensionSettingsSiteAccess=cjw_starter`.

## Layout

```
design/starter/templates/              templates of the design
design/starter/override/templates/     override templates
design/starter/stylesheets/, javascript/, images/, fonts/
design/standard/templates/             the custom XML tags for every other design
classes/                               image converter, paged blocks, tile proxy, form honeypot
modules/osm_proxy/, modules/cjw_paging/
settings/                              global: design, content (XML tags), image aliases, cjw_jumper.ini, osm_proxy.ini
settings/siteaccess/cjw_starter/       site, override, module, collect and explayouts settings of the starter siteaccesses
share/content-images/, content-files/  the images and files of the starter content
translations/ger-DE/                   German design strings
doc/                                   notes on the design
```

## Requirements

- Exponential 6 (the legacy kernel with the `standard` design), PHP 8.0 or later.
- `explayouts` (the Layouts engine) and `ezjscore` (jQuery) for the pages and blocks.
- The PHP extension `imagick` for the `cjw_*` image aliases.
- Optional: `cjw_tmv` (the TMV event feed) for the event container pages.

See [INSTALL.md](INSTALL.md) to set it up and [CHANGELOG.md](CHANGELOG.md) for the releases.

## License

GNU General Public License v2.0 (or any later version). See [LICENSE](LICENSE).
