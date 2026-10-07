# CJW Themes Jumper (cjw_themes_jumper)

The design `starter` for Exponential 6, served by the siteaccesses `starter` (English) and `starter_ger`
(German). It is the port of the Nexus v2 starter look to plain Exponential template code, landing in waves.

Status: 0.1.0, skeleton. The design holds only the placeholder of the starter root page; everything else falls
back to the `standard` design and looks bare on purpose until the port replaces it.

## Layout

```
design/starter/templates/             templates of the design
design/starter/override/templates/    override templates (settings/override.ini.append.php)
design/starter/stylesheets/           stylesheets
design/starter/javascript/            scripts
design/starter/images/                images
settings/design.ini.append.php        declares the design extension
settings/site.ini.append.php          access-only settings
settings/override.ini.append.php      template overrides of the design
doc/                                  documentation
```

## Requirements

- Exponential 6 (the legacy kernel with the `standard` design).

See [INSTALL.md](INSTALL.md) to set it up and [CHANGELOG.md](CHANGELOG.md) for the releases.

## License

GNU General Public License v2.0 (or any later version). See [LICENSE](LICENSE).
