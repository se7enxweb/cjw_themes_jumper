<?php /* #?ini charset="utf-8"?

# Settings of the design "starter" (the page chrome of the Nexus v2 starter
# site). Global (every siteaccess), but read only by the templates of the design starter. Content is
# found by REMOTE ID, never by node id, so the same settings work on every
# installation that has the starter content (alpha and a CJW install alike).
# Anything not found is left out of the page; the chrome then builds itself
# from the content tree alone.

[SiteInfo]
# The site info object (class ng_site_info): footer block (pre-footer text),
# footer menu (additional_menu), site name. v2 node 65.
NodeRemoteID=cjw-starter-n-65

[Header]
# The folder whose ng_shortcut children are the links at the top right
# ("Verweise in der Kopfzeile", v2 node 1292).
TopLinkContainerNodeRemoteID=cjw-starter-n-1292
# Classes of the header images: children of a page in these classes are its
# header images (several: a slider). v2: header.image_content_types.
HeadImageClasses[]
HeadImageClasses[]=ng_banner
HeadImageClasses[]=cjw_banner_head
# Header image when no page on the way up to the root has one (design images).
FallbackImage=header_images/wieck_kopf_folge_bootwieck.jpg
FallbackImageLanding=header_images/wieck_kopf_start_hafen.jpg
# Classes whose page is marked as a landing page (v2: <div id="page" class="landing">).
LandingClasses[]
LandingClasses[]=ng_frontpage
LandingClasses[]=ng_landing_page
# Classes whose page gets the large header and its own fallback image, and no
# breadcrumb: the front page only (v2 page_header.html.twig: is_landing is
# ng_frontpage; a landing page has the normal header and a breadcrumb).
LargeHeaderClasses[]
LargeHeaderClasses[]=ng_frontpage
# Design images of the logos.
MenuIcon=grafiken/menue.png
NavigationLogo=logos/small.png
OffcanvasLogo=logos/icon.png
ColorRowLogo=logos/medium.png

[Menu]
# The offcanvas menu lists the children of the root node of the siteaccess,
# by priority: the top list below BreakPriority, the bottom list from it on
# (v2: cjw_treemenu with priorities 0-999 and 999-2000). The footer menu takes
# the site info's additional_menu, else the bottom list.
TopMinPriority=0
BreakPriority=999
MaxPriority=2000
Limit=100

[Footer]
Logo=logos/small.png

[Breadcrumb]
# Classes that appear in the breadcrumb (v2: breadcrumb.content_type_id).
ClassIdentifiers[]
ClassIdentifiers[]=ng_landing_page
ClassIdentifiers[]=ng_article
ClassIdentifiers[]=ng_category
ClassIdentifiers[]=cjw_feedback_form
# Characters of the last item before it is shortened (v2: truncate(15)).
LastItemLength=15
# Pages of these classes show no breadcrumb, although their layout has the
# breadcrumb block: v2 draws it only from the full view templates of its own
# theme, so the front page and the showcase pages of these classes have none.
# Module pages (user, errors, search) never show one either.
HiddenOnClasses[]
HiddenOnClasses[]=ng_frontpage
HiddenOnClasses[]=ng_banner
HiddenOnClasses[]=ng_blog_post
HiddenOnClasses[]=ng_feedback_form
HiddenOnClasses[]=ng_recipe
HiddenOnClasses[]=image

[LayoutSettings]
# Layouts the design renders: a resolved explayouts layout is used only when
# its name starts with one of these prefixes (the starter layouts imported
# from v2 are named "Starter - ..."; compared without trailing spaces), so a layout of another site that happens
# to match a page here is never drawn with this design. Without one, the page
# gets the chrome of v2's shared "Header / Footer" layout around the content.
LayoutNamePrefixes[]
LayoutNamePrefixes[]=Starter -
LayoutTypes[]
LayoutTypes[]=layout_1
LayoutTypes[]=layout_2
LayoutTypes[]=layout_4
# Module views v2 draws without any layout: header, #main, pre-footer and
# footer directly in the page (v2's search page).
PlainModuleViews[]
PlainModuleViews[]=content/search
# tpl_block blocks this design draws, by block name (v2 twig_block names);
# templates in explayouts/tpl_block/<name>.tpl. Others draw nothing.
TplBlockNames[]
TplBlockNames[]=header
TplBlockNames[]=breadcrumb
TplBlockNames[]=pre_footer
TplBlockNames[]=footer
# The parts of the full views (wave 4), drawn from content/full/<class>.tpl
# of the page's node ([FullViews] below).
TplBlockNames[]=content_header
TplBlockNames[]=title
TplBlockNames[]=intro
TplBlockNames[]=teaser_intro
TplBlockNames[]=content_body
TplBlockNames[]=body
TplBlockNames[]=menu_right
TplBlockNames[]=sub_menu_right

# --- Full views (wave 4) -------------------------------------------------------
[FullViews]
# Classes with a full view template content/full/<class>.tpl. A tpl block of a
# full view part (title, intro, content_body ...) draws the part from the
# template of the page node's class; a class not listed draws nothing.
Classes[]
Classes[]=ng_article
Classes[]=ng_news
Classes[]=ng_category
Classes[]=ng_landing_page
Classes[]=ng_container
Classes[]=ng_frontpage
Classes[]=ng_blog_post
Classes[]=ng_recipe
Classes[]=ng_gallery
Classes[]=ng_htmlbox
Classes[]=tmv_container

[Leaflet]
# The map of a location field (v2: cjwsite.default.leaflet.*). TileLayer is a
# path on the current host (v2: osm_proxy/tiles/(get)/1, served by cjw_osm_proxy).
InitialZoom=14
MinZoom=14
MaxZoom=16
TileLayer=osm_proxy/tiles/(get)/1
# --- end of full views ---------------------------------------------------------

# --- W5 forms and W5 video and audio ---------------------------------------------
# The full views of the feedback forms, the video and the audio class
# (content/full/<class>.tpl), added to the list above (no reset here). The
# contact form page draws its parts through the tpl blocks of its layout.
[FullViews]
Classes[]=cjw_feedback_form
Classes[]=ng_feedback_form
Classes[]=ng_video
Classes[]=ng_audio
# --- end of W5 forms and W5 video and audio --------------------------------------

[OpenGraph]
# The Open Graph and Twitter tags of the page head (pagelayout/head/opengraph.tpl).
# og:image is, in this order: the image of the page's metadata field (its own or
# the class default, xrowmetadata 1.4.7 and later), the first image field below
# that has an image, the image of the first related multimedia item, DefaultImage.
# Classes whose pages are og:type "article" (every other page is "website").
ArticleClasses[]
ArticleClasses[]=ng_article
ArticleClasses[]=ng_news
ArticleClasses[]=ng_blog_post
ArticleClasses[]=ng_recipe
ArticleClasses[]=tmv_event
# Image fields of the page's object, in the order they are tried.
ImageAttributes[]
ImageAttributes[]=image
ImageAttributes[]=teaser_image
ImageAttributes[]=poster
ImageAttributes[]=additional_image
# Relation list fields whose first item's image is tried next.
RelationAttributes[]
RelationAttributes[]=related_multimedia
# The image alias drawn (1200 x 675, the size the large preview card shows).
ImageAlias=cjw_i1200_16-9
# The image when the page has none (design image, 1200 x 630).
DefaultImage=opengraph/starter_default.png
DefaultImageWidth=1200
DefaultImageHeight=630
DefaultImageType=image/png

*/ ?>
