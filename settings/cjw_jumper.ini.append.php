<?php /* #?ini charset="utf-8"?

# Settings of the design "starter" (the page chrome of the Nexus v2 starter
# site). Read only in the siteaccesses that activate this extension. Content is
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
# Classes that get the large header and no breadcrumb (v2: <div id="page" class="landing">).
LandingClasses[]
LandingClasses[]=ng_frontpage
LandingClasses[]=ng_landing_page
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

*/ ?>
