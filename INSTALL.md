# Installing CJW Themes Jumper

1. Put the extension in `extension/cjw_themes_jumper` (or `composer require se7enxweb/cjw_themes_jumper`).
2. Activate it for the whole installation, in `settings/override/site.ini.append.php`:

   ```ini
   [ExtensionSettings]
   ActiveExtensions[]=cjw_themes_jumper
   ```

   Global are only the custom XML tags of the starter content (`settings/content.ini.append.php`), the image
   aliases, the design and the extension's own settings files, so every siteaccess (the admin and the online
   editor included) can open and save that content without losing its tags. Everything that changes how a site
   behaves (template overrides, search, information collection, layout block view types, the `osm_proxy`
   module) is in `settings/siteaccess/cjw_starter/` and reaches only the siteaccesses that ask for it. In
   `settings/siteaccess/<siteaccess>/site.ini.append.php` of each siteaccess that uses the design:

   ```ini
   [SiteAccessSettings]
   ExtensionSettingsSiteAccess=cjw_starter

   [DesignSettings]
   SiteDesign=starter
   AdditionalSiteDesignList[]
   AdditionalSiteDesignList[]=standard
   ```

3. Give the siteaccess its content root (`[NodeSettings] RootNode` in `content.ini`, `IndexPage` and
   `DefaultPage` in `site.ini`) and add it to `AvailableSiteAccessList[]` and `SiteList[]`.
4. The design draws the CJW starter content and its layouts. The CJW starter content package installs them and
   reads the images and files of that content from `share/content-images/` and `share/content-files/` of this
   extension, so keep both folders in place. The design finds what its page chrome needs by remote id
   (`settings/cjw_jumper.ini.append.php`), never by node id.
5. Regenerate the extension autoloads and clear the caches:

   ```bash
   php bin/php/ezpgenerateautoloads.php -e
   php bin/php/ezcache.php --clear-tag=ini --allow-root-user
   php bin/php/ezcache.php --clear-tag=template --allow-root-user
   php bin/php/ezcache.php --clear-id=template-override --allow-root-user
   ```

The `cjw_*` image aliases need the PHP extension `imagick`. The map tiles of the Leaflet maps are fetched by the
module `osm_proxy` from the server named in `settings/osm_proxy.ini.append.php`; mind that server's tile usage
policy.
