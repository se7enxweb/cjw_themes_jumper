# Installing CJW Themes Jumper

1. Put the extension in `extension/cjw_themes_jumper` (or `composer require se7enxweb/cjw_themes_jumper`).
2. Activate it only in the siteaccesses that use the design, as an access extension. In
   `settings/siteaccess/<siteaccess>/site.ini.append.php`:

   ```ini
   [ExtensionSettings]
   ActiveAccessExtensions[]=cjw_themes_jumper

   [DesignSettings]
   SiteDesign=starter
   AdditionalSiteDesignList[]
   AdditionalSiteDesignList[]=standard
   ```

3. Give the siteaccess its content root (`[NodeSettings] RootNode` in `content.ini`, `IndexPage` and
   `DefaultPage` in `site.ini`) and add it to `AvailableSiteAccessList[]` and `SiteList[]`.
4. The starter root page shows the placeholder template when its object has the remote id
   `cjw-starter-o-root`.
5. Regenerate the extension autoloads and clear the caches:

   ```bash
   php bin/php/ezpgenerateautoloads.php -e
   php bin/php/ezcache.php --clear-tag=ini --allow-root-user
   php bin/php/ezcache.php --clear-tag=template --allow-root-user
   ```
