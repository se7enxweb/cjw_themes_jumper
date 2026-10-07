{* Head: title and meta tags. v2: themes/app/page_head.html.twig (title and meta part).
   Title as v2 builds it: a content page has the title of its metadata field when one is set, else
   "<name> - <site name>"; an error page "<error title> - <site name>" (the titles of v2's error pages, in the
   words of design/starter/error); any other module page the site name alone. The site name is $pl_site_name
   (the site info's site_name, else [SiteSettings] SiteName).
   The Google site verification and kjkey metas of v2 are JAC's own accounts and are not carried (plan D-10). *}
{def $mt_title = $pl_site_name
     $mt_meta = false()}
{if $pl_node}
    {if and( is_set( $pl_node.data_map.metadata ), $pl_node.data_map.metadata.has_content )}{set $mt_meta = metadata( $pl_node.node_id )}{/if}
    {if and( $mt_meta, is_set( $mt_meta.title ), $mt_meta.title|ne( '' ) )}
        {set $mt_title = $mt_meta.title}
    {else}
        {set $mt_title = concat( $pl_node.name, ' - ', $pl_site_name )}
    {/if}
{elseif is_set( $module_result.errorType )}
    {def $mt_error = concat( $module_result.errorType, '/', first_set( $module_result.errorNumber, '' ) )
         $mt_error_title = 'Something went wrong'|i18n( 'design/starter/error' )}
    {if $mt_error|eq( 'kernel/1' )}
        {set $mt_error_title = 'This is a restricted area'|i18n( 'design/starter/error' )}
    {elseif array( 'kernel/2', 'kernel/3', 'kernel/5', 'kernel/20', 'kernel/21', 'kernel/22' )|contains( $mt_error )}
        {set $mt_error_title = 'This page does not exist'|i18n( 'design/starter/error' )}
    {elseif $mt_error|eq( 'kernel/4' )}
        {set $mt_error_title = 'This page has moved'|i18n( 'design/starter/error' )}
    {/if}
    {set $mt_title = concat( $mt_error_title, ' - ', $pl_site_name )}
    {undef $mt_error $mt_error_title}
{/if}
<title>{$mt_title|wash}</title>

{def $mt_site_meta = ezini( 'SiteSettings', 'MetaDataArray', 'site.ini' )}
{if and( $mt_meta, is_set( $mt_meta.keywords ), $mt_meta.keywords|count )}
            <meta name="keywords" content="{$mt_meta.keywords|implode( ',' )|wash}" />
{elseif and( is_set( $mt_site_meta.keywords ), $mt_site_meta.keywords|ne('') )}
            <meta name="keywords" content="{$mt_site_meta.keywords|wash}" />
{/if}
{if and( $mt_meta, is_set( $mt_meta.description ), $mt_meta.description|ne( '' ) )}
                <meta name="description" content="{$mt_meta.description|wash}" />
{elseif and( is_set( $mt_site_meta.description ), $mt_site_meta.description|ne('') )}
                <meta name="description" content="{$mt_site_meta.description|wash}" />
{/if}

<meta name="generator" content="{'Exponential powered by JAC Systeme'|i18n( 'design/starter/pagelayout' )|wash}">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=2">
{undef $mt_title $mt_meta $mt_site_meta}
