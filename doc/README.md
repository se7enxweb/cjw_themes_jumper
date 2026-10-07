# CJW Themes Jumper documentation

- The design `starter` is the first design of its siteaccess; `standard` is the only fallback, so a page the port
  has not reached yet renders with the standard templates.
- Override templates go in `design/starter/override/templates/` and are declared in
  `settings/override.ini.append.php`. Match by class or by remote id, never by node id: node ids differ between
  installations.
- Each port wave adds its templates, stylesheets and scripts here and its entry to `CHANGELOG.md`.
