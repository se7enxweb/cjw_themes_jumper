{* Full view of file (v2: cjw_app/content/full/file.html.twig, cjw_content_download_file): no page, a redirect to
   the download of the file, in the current siteaccess. Without a file the page stays empty, as in v2. *}
{if and( is_set( $node.data_map.file ), $node.data_map.file.has_content )}
{* swark's redirect puts the index dir of the siteaccess in front of the path *}
{redirect( concat( 'content/download/', $node.contentobject_id, '/', $node.data_map.file.id ), '302 Found' )}
{/if}
