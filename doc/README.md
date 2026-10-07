# CJW Themes Jumper documentation

- The design `starter` is the first design of its siteaccess; `standard` is the only fallback, so a page the design
  has no template for renders with the standard templates.
- Override templates go in `design/starter/override/templates/` and are declared in
  `settings/siteaccess/cjw_starter/override.ini.append.php`. Match by class or by remote id, never by node id: node
  ids differ between installations.
- Content the chrome needs (the site info object, the header links) is found by remote id
  (`settings/cjw_jumper.ini.append.php`), so the same settings work on every installation with the starter content.
- `source/` keeps the compiled stylesheet and script of the v2 starter site the design was ported from, for
  reference.
- Each change adds its entry to `CHANGELOG.md`.
