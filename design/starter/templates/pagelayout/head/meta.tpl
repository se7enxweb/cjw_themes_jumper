{* Head: title and meta tags. v2: themes/app/page_head.html.twig (title and meta part).
   Title: "<page name> - <site name>", the site name alone on the root of the site.
   The Google site verification and kjkey metas of v2 are JAC's own accounts and are not carried (plan D-10). *}
{def $mt_title = $pl_site_name}
{if and( $pl_node, $pl_node.depth|gt( $pl_root_depth ) )}
    {set $mt_title = concat( $pl_node.name, ' – ', $pl_site_name )}
{elseif and( $pl_node|not, is_array( $module_result.path ) )}
    {foreach $module_result.path as $mt_item}{if and( is_set( $mt_item.text ), $mt_item.text|ne('') )}{set $mt_title = concat( $mt_item.text, ' – ', $pl_site_name )}{/if}{/foreach}
{/if}
<title>{$mt_title|wash}</title>

{def $mt_site_meta = ezini( 'SiteSettings', 'MetaDataArray', 'site.ini' )}
{if and( is_set( $mt_site_meta.keywords ), $mt_site_meta.keywords|ne('') )}
            <meta name="keywords" content="{$mt_site_meta.keywords|wash}" />
{/if}
{if and( is_set( $mt_site_meta.description ), $mt_site_meta.description|ne('') )}
                <meta name="description" content="{$mt_site_meta.description|wash}" />
{/if}

<meta name="generator" content="{'Exponential powered by JAC Systeme'|i18n( 'design/starter/pagelayout' )|wash}">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2">
{undef $mt_title $mt_site_meta}
