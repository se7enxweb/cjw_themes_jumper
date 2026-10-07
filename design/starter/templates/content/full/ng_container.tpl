{* Full view of ng_container (v2: cjw_app/content/full/ng_container.html.twig): the landing page markup
   without the .container around the header. Input: node, part. *}
{include uri='design:content/full/ng_landing_page.tpl' node=$node part=first_set( $part, 'content' ) lp_container=false()}
