{* Head: the Open Graph and Twitter tags of every page (cjw_jumper.ini [OpenGraph]).
   og:title        the title of the page's metadata field, else the name of the node, else the site name
   og:description  the description of the metadata field, else the node's teaser text or (full) intro (plain text,
                   at most 200 characters), else the site's description ([SiteSettings] MetaDataArray)
   og:url          the canonical URL of the metadata field, else the page on the host of [SiteSettings] SiteURL,
                   with the siteaccess path (/starter/...); the front page is the siteaccess root
   og:type         "article" for the classes of ArticleClasses, else "website"
   og:locale       the siteaccess locale ([RegionalSettings] Locale: ger-DE is de_DE)
   og:image        exactly one: the image of the metadata field (its own or the class default, printed by
                   xrowmetadata's design:xrowmetadata/opengraph_image.tpl), else the first image field of
                   ImageAttributes, else the first related item's image (RelationAttributes), in ImageAlias,
                   else the design image DefaultImage. twitter:image is the same image.
   The variables of the page layout ($pl_node, $pl_site_name) are those of pagelayout.tpl. *}
{def $ogp_meta = false()
     $ogp_title = $pl_site_name
     $ogp_description = ''
     $ogp_type = 'website'
     $ogp_path = ''
     $ogp_url = ''
     $ogp_image = false()
     $ogp_server = '/'|ezroot( 'no', 'full' )|explode( '/' )|extract( 0, 3 )|implode( '/' )
     $ogp_scheme = cond( '/'|ezroot( 'no', 'full' )|begins_with( 'http://' ), 'http://', 'https://' )
     $ogp_site_url = ezini( 'SiteSettings', 'SiteURL', 'site.ini' )|trim
     $ogp_locale = fetch( 'content', 'locale', hash( 'locale_code', ezini( 'RegionalSettings', 'Locale', 'site.ini' ) ) )
     $ogp_locale_code = 'en_US'}
{* The host of the public site: SiteURL without its path, else the host of this request *}
{if $ogp_site_url|ne( '' )}
    {if $ogp_site_url|contains( '://' )}
        {set $ogp_scheme = concat( $ogp_site_url|explode( '://' ).0, '://' )
             $ogp_site_url = $ogp_site_url|explode( '://' ).1}
    {/if}
    {set $ogp_server = concat( $ogp_scheme, $ogp_site_url|explode( '/' ).0 )}
{/if}
{if and( $ogp_locale, $ogp_locale.http_locale_code|ne( '' ) )}
    {set $ogp_locale_code = $ogp_locale.http_locale_code|explode( '-' )|implode( '_' )}
{/if}

{if $pl_node}
    {* The metadata field: its title, description and canonical URL, and its Open Graph image *}
    {foreach $pl_node.data_map as $ogp_attr}
        {if $ogp_attr.data_type_string|eq( 'xrowmetadata' )}{set $ogp_meta = metadata( $pl_node.node_id )}{break}{/if}
    {/foreach}
    {if and( $ogp_meta, is_set( $ogp_meta.title ), $ogp_meta.title|ne( '' ) )}
        {set $ogp_title = $ogp_meta.title}
    {else}
        {set $ogp_title = $pl_node.name}
    {/if}
    {if and( $ogp_meta, is_set( $ogp_meta.description ), $ogp_meta.description|ne( '' ) )}
        {set $ogp_description = $ogp_meta.description}
    {else}
        {foreach array( 'teaser_intro', 'teaser_text', 'short_description', 'full_intro', 'intro', 'description' ) as $ogp_field}
            {if and( is_set( $pl_node.data_map[$ogp_field] ), $pl_node.data_map[$ogp_field].has_content )}
                {if $pl_node.data_map[$ogp_field].data_type_string|eq( 'ezxmltext' )}
                    {set $ogp_description = $pl_node.data_map[$ogp_field].content.output.output_text}
                {elseif $pl_node.data_map[$ogp_field].data_type_string|eq( 'ezrichtext' )}
                    {set $ogp_description = $pl_node.data_map[$ogp_field].content.output}
                {else}
                    {set $ogp_description = $pl_node.data_map[$ogp_field].content}
                {/if}
                {* plain text: a space before every tag keeps the words of two paragraphs apart; the entities of
                   the rendered text become characters again (|wash encodes them once when printed) *}
                {set $ogp_description = $ogp_description|explode( '<' )|implode( ' <' )|strip_tags}
                {set $ogp_description = $ogp_description|explode( '&nbsp;' )|implode( ' ' )|explode( '&quot;' )|implode( '"' )|explode( '&#039;' )|implode( "'" )}
                {set $ogp_description = $ogp_description|explode( '&lt;' )|implode( '<' )|explode( '&gt;' )|implode( '>' )|explode( '&amp;' )|implode( '&' )|simplify|trim|shorten( 200 )}
                {if $ogp_description|ne( '' )}{break}{/if}
            {/if}
        {/foreach}
    {/if}
    {if ezini( 'OpenGraph', 'ArticleClasses', 'cjw_jumper.ini' )|contains( $pl_node.class_identifier )}
        {set $ogp_type = 'article'}
    {/if}
    {* The front page ([SiteSettings] IndexPage) is the root of the siteaccess *}
    {if ezini( 'SiteSettings', 'IndexPage', 'site.ini' )|ends_with( concat( '/', $pl_node.node_id ) )|not}
        {set $ogp_path = $pl_node.url_alias}
    {/if}
    {if and( $ogp_meta, is_set( $ogp_meta.canonical_url ), $ogp_meta.canonical_url|begins_with( 'http' ) )}
        {set $ogp_url = $ogp_meta.canonical_url}
    {/if}

    {* The page's own image when the metadata field shows none *}
    {if or( $ogp_meta|not, $ogp_meta.og_image_info|not )}
        {def $ogp_alias_name = ezini( 'OpenGraph', 'ImageAlias', 'cjw_jumper.ini' )
             $ogp_candidates = array( $pl_node.object )}
        {foreach ezini( 'OpenGraph', 'RelationAttributes', 'cjw_jumper.ini' ) as $ogp_rel}
            {if and( is_set( $pl_node.data_map[$ogp_rel] ), $pl_node.data_map[$ogp_rel].has_content,
                     is_set( $pl_node.data_map[$ogp_rel].content.relation_list.0 ) )}
                {def $ogp_rel_object = fetch( 'content', 'object', hash( 'object_id', $pl_node.data_map[$ogp_rel].content.relation_list.0.contentobject_id ) )}
                {if $ogp_rel_object}{set $ogp_candidates = $ogp_candidates|append( $ogp_rel_object )}{/if}
                {undef $ogp_rel_object}
            {/if}
        {/foreach}
        {foreach $ogp_candidates as $ogp_object}
            {foreach ezini( 'OpenGraph', 'ImageAttributes', 'cjw_jumper.ini' ) as $ogp_field}
                {if and( is_set( $ogp_object.data_map[$ogp_field] ), $ogp_object.data_map[$ogp_field].data_type_string|eq( 'ezimage' ),
                         $ogp_object.data_map[$ogp_field].has_content )}
                    {def $ogp_alias = $ogp_object.data_map[$ogp_field].content[$ogp_alias_name]}
                    {if and( $ogp_alias, $ogp_alias.url|ne( '' ) )}
                        {set $ogp_image = hash( 'url', $ogp_alias.url|ezroot( 'no', 'full' ),
                                                'width', $ogp_alias.width, 'height', $ogp_alias.height,
                                                'type', $ogp_alias.mime_type,
                                                'alt', cond( $ogp_alias.alternative_text|ne( '' ), $ogp_alias.alternative_text, $ogp_object.name ) )}
                    {/if}
                    {undef $ogp_alias}
                {/if}
                {if $ogp_image}{break}{/if}
            {/foreach}
            {if $ogp_image}{break}{/if}
        {/foreach}
        {undef $ogp_alias_name $ogp_candidates}
    {/if}
{else}
    {set $ogp_path = $requested_uri_string}
{/if}

{if $ogp_url|eq( '' )}
    {set $ogp_url = concat( $ogp_server, $ogp_path|ezurl( 'no' ) )}
{/if}
{if $ogp_description|eq( '' )}
    {def $ogp_site_meta = ezini( 'SiteSettings', 'MetaDataArray', 'site.ini' )}
    {if and( is_set( $ogp_site_meta.description ), $ogp_site_meta.description|ne( '' ) )}
        {set $ogp_description = $ogp_site_meta.description}
    {/if}
    {undef $ogp_site_meta}
{/if}
{* The design image when neither the metadata field nor the page has one *}
{if and( $ogp_image|not, or( $ogp_meta|not, $ogp_meta.og_image_info|not ) )}
    {set $ogp_image = hash( 'url', concat( 'images/', ezini( 'OpenGraph', 'DefaultImage', 'cjw_jumper.ini' ) )|ezdesign( 'no' )|ezroot( 'no', 'full' ),
                            'width', ezini( 'OpenGraph', 'DefaultImageWidth', 'cjw_jumper.ini' ),
                            'height', ezini( 'OpenGraph', 'DefaultImageHeight', 'cjw_jumper.ini' ),
                            'type', ezini( 'OpenGraph', 'DefaultImageType', 'cjw_jumper.ini' ),
                            'alt', $pl_site_name )}
{/if}
<meta property="og:site_name" content="{$pl_site_name|wash}" />
<meta property="og:type" content="{$ogp_type}" />
<meta property="og:title" content="{$ogp_title|wash}" />
{if $ogp_description|ne( '' )}<meta property="og:description" content="{$ogp_description|wash}" />
{/if}
<meta property="og:url" content="{$ogp_url|wash}" />
<meta property="og:locale" content="{$ogp_locale_code|wash}" />
{if $ogp_image}
<meta property="og:image" content="{$ogp_image.url|wash}" />
{if $ogp_image.url|begins_with( 'https://' )}<meta property="og:image:secure_url" content="{$ogp_image.url|wash}" />
{/if}
{if $ogp_image.type|ne( '' )}<meta property="og:image:type" content="{$ogp_image.type|wash}" />
{/if}
{if $ogp_image.width|ne( '' )}<meta property="og:image:width" content="{$ogp_image.width|wash}" />
{/if}
{if $ogp_image.height|ne( '' )}<meta property="og:image:height" content="{$ogp_image.height|wash}" />
{/if}
<meta property="og:image:alt" content="{$ogp_image.alt|wash}" />
<meta name="twitter:image" content="{$ogp_image.url|wash}" />
{else}
{include uri='design:xrowmetadata/opengraph_image.tpl' meta=$ogp_meta}
{/if}
{if and( $pl_node, $ogp_type|eq( 'article' ) )}
<meta property="article:published_time" content="{$pl_node.object.published|datetime( 'custom', '%c' )}" />
<meta property="article:modified_time" content="{$pl_node.object.modified|datetime( 'custom', '%c' )}" />
{/if}
<meta name="twitter:card" content="summary_large_image" />
<meta name="twitter:title" content="{$ogp_title|wash}" />
{if $ogp_description|ne( '' )}<meta name="twitter:description" content="{$ogp_description|wash}" />
{/if}
{undef $ogp_meta $ogp_title $ogp_description $ogp_type $ogp_path $ogp_url $ogp_image $ogp_server $ogp_scheme
       $ogp_site_url $ogp_locale $ogp_locale_code}
