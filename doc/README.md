# CJW Themes Jumper documentation

- The design `starter` is the first design of its siteaccess; `standard` is the only fallback, so a page the design
  has no template for renders with the standard templates.
- Override templates go in `design/starter/override/templates/` and are declared in
  `settings/siteaccess/cjw_starter/override.ini.append.php`. Match by class or by remote id, never by node id: node
  ids differ between installations.
- Content the chrome needs (the site info object, the header links) is found by remote id
  (`settings/cjw_jumper.ini.append.php`), so the same settings work on every installation with the starter content.
- [layouts-view-types.md](layouts-view-types.md): the Exponential Layouts view types and item views the design
  draws (list, grid, tiles, zig-zag, accordion, the galleries; standard, card, the line variants ...), the settings
  that offer them to editors (`ItemViewTypes[]`), which item view a block draws, the block wrapper's classes, and the
  offcanvas menu's further nodes (`cjw_jumper.ini [Menu] AdditionalNodeIDs[]`).
- Templates carry no fixed `style=""`: fixed styles go in `design/starter/stylesheets/starter.css`. Only values
  computed from the content (a background image, a width) stay inline, and the mail templates.
- `source/` keeps the compiled stylesheet and script of the v2 starter site the design was ported from, for
  reference. `design/starter/javascript/app.js` is written from `source/app.js` by a script; its header names every
  change, so never edit it by hand.
- Each change adds its entry to `CHANGELOG.md`.
