{* Head: stylesheets. v2: themes/cjw_app/page_head_style.html.twig + page_head_style_language_filter.html.twig.

   The five v2 stylesheets, in v2's order (the cascade order is the pixel contract: never reorder), packed by
   ezjscore into one file at pack level 1: concatenated, nothing minified, so every rule reaches the browser as v2
   serves it. The packer turns the relative url()s into absolute ones. app.css differs from v2 only in its url()
   prefixes (owner decision Q17); the others are byte-identical. ezcss_load also emits what a template asked for
   with ezcss_require, after these. The cookie banner's stylesheet comes last (owner decision Q20).

   The language filter: v2 hides every block carrying the class of another language (rich text blocks with the
   class "de" or "en") and shows the current one. The classes are the two-letter codes of the site languages. *}
{ezcss_load( array( 'opensans.css',
                    'app.css',
                    'nglayouts.css',
                    'nglayouts-standard.css',
                    'update.css',
                    'exp-cookie-consent.css',
                    'starter.css' ), 'all', 'text/css', 'stylesheet', 1 )}

{def $st_current = $site.http_equiv.Content-language|explode( '-' )|extract_left( 1 )|implode( '' )|downcase}
{def $st_codes = array()}
{foreach ezini( 'RegionalSettings', 'SiteLanguageList', 'site.ini' ) as $st_locale}
    {def $st_code = $st_locale|explode( '-' )|extract_left( 1 )|implode( '' )|downcase}
    {if $st_code|eq( 'ger' )}{set $st_code = 'de'}{elseif $st_code|eq( 'eng' )}{set $st_code = 'en'}{/if}
    {if $st_codes|contains( $st_code )|not}{set $st_codes = $st_codes|append( $st_code )}{/if}
    {undef $st_code}
{/foreach}
<style type="text/css">
{foreach $st_codes as $st_code}
            .{$st_code} {ldelim}
                display: none !important;
            {rdelim}
{/foreach}
{if $st_current|ne('')}
            .{$st_current} {ldelim}
                display: block !important;
            {rdelim}
{/if}
</style>
{undef $st_current $st_codes}
