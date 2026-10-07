<?php /* #?ini charset="utf-8"?

# Template overrides of the design "starter". Read only in the starter siteaccesses
# (ExtensionSettingsSiteAccess=cjw_starter: starter, starter_ger). The port of the Nexus v2
# starter look adds its overrides here, wave by wave.

# Wave 0: the starter root page shows a placeholder until the port replaces it.
# Matched by the remote id of the root object, which the starter setup creates
# (cjw-starter-o-root), so no node id is shipped.
[full_cjw_starter_root]
Source=node/view/full.tpl
MatchFile=full/cjw_starter_root.tpl
Subdir=templates
Match[remote_id]=cjw-starter-o-root
Priority=0

# --- Full views (wave 4) -------------------------------------------------------
# The full view of each content class the v2 starter site shows. Each override
# file only includes content/full/<class>.tpl, which the tpl blocks of the
# layouts draw their parts from (title, intro, content_body ...).

[full_starter_ng_article]
Source=node/view/full.tpl
MatchFile=full/ng_article.tpl
Subdir=templates
Match[class_identifier]=ng_article

[full_starter_ng_news]
Source=node/view/full.tpl
MatchFile=full/ng_news.tpl
Subdir=templates
Match[class_identifier]=ng_news

[full_starter_ng_category]
Source=node/view/full.tpl
MatchFile=full/ng_category.tpl
Subdir=templates
Match[class_identifier]=ng_category

[full_starter_ng_landing_page]
Source=node/view/full.tpl
MatchFile=full/ng_landing_page.tpl
Subdir=templates
Match[class_identifier]=ng_landing_page

[full_starter_ng_container]
Source=node/view/full.tpl
MatchFile=full/ng_container.tpl
Subdir=templates
Match[class_identifier]=ng_container

[full_starter_ng_frontpage]
Source=node/view/full.tpl
MatchFile=full/ng_frontpage.tpl
Subdir=templates
Match[class_identifier]=ng_frontpage

[full_starter_ng_blog_post]
Source=node/view/full.tpl
MatchFile=full/ng_blog_post.tpl
Subdir=templates
Match[class_identifier]=ng_blog_post

[full_starter_ng_recipe]
Source=node/view/full.tpl
MatchFile=full/ng_recipe.tpl
Subdir=templates
Match[class_identifier]=ng_recipe

[full_starter_ng_gallery]
Source=node/view/full.tpl
MatchFile=full/ng_gallery.tpl
Subdir=templates
Match[class_identifier]=ng_gallery

[full_starter_ng_htmlbox]
Source=node/view/full.tpl
MatchFile=full/ng_htmlbox.tpl
Subdir=templates
Match[class_identifier]=ng_htmlbox

[full_starter_tmv_container]
Source=node/view/full.tpl
MatchFile=full/tmv_container.tpl
Subdir=templates
Match[class_identifier]=tmv_container

[full_starter_file]
Source=node/view/full.tpl
MatchFile=full/file.tpl
Subdir=templates
Match[class_identifier]=file

# v2 has no page for these classes: a redirect to the home page.

[full_starter_image]
Source=node/view/full.tpl
MatchFile=full/redirect_to_root.tpl
Subdir=templates
Match[class_identifier]=image

[full_starter_ng_banner]
Source=node/view/full.tpl
MatchFile=full/redirect_to_root.tpl
Subdir=templates
Match[class_identifier]=ng_banner

[full_starter_ng_shortcut]
Source=node/view/full.tpl
MatchFile=full/redirect_to_root.tpl
Subdir=templates
Match[class_identifier]=ng_shortcut

[full_starter_tmv_container_categories]
Source=node/view/full.tpl
MatchFile=full/redirect_to_root.tpl
Subdir=templates
Match[class_identifier]=tmv_container_categories

# Embeds in rich text (ezxmltext): content/embed/<class>.tpl.
[embed_starter_ng_gallery]
Source=content/view/embed.tpl
MatchFile=embed/ng_gallery.tpl
Subdir=templates
Match[class_identifier]=ng_gallery

[embed_starter_node_ng_gallery]
Source=node/view/embed.tpl
MatchFile=embed/node_ng_gallery.tpl
Subdir=templates
Match[class_identifier]=ng_gallery

[embed_starter_image]
Source=content/view/embed.tpl
MatchFile=embed/image.tpl
Subdir=templates
Match[class_identifier]=image

[embed_starter_node_image]
Source=node/view/embed.tpl
MatchFile=embed/node_image.tpl
Subdir=templates
Match[class_identifier]=image

# --- end of full views ---------------------------------------------------------

# --- W5 forms and W5 video and audio ---------------------------------------------
# The feedback forms (v2 cjw_feedback_form, ng_feedback_form; sent to the
# information collector, collect.ini) and the video and audio pages (ng_video
# with the click-to-load YouTube player, ng_audio). Each override file only
# includes content/full/<class>.tpl, as the full views of wave 4 do.

[full_starter_cjw_feedback_form]
Source=node/view/full.tpl
MatchFile=full/cjw_feedback_form.tpl
Subdir=templates
Match[class_identifier]=cjw_feedback_form

[full_starter_ng_feedback_form]
Source=node/view/full.tpl
MatchFile=full/ng_feedback_form.tpl
Subdir=templates
Match[class_identifier]=ng_feedback_form

[full_starter_ng_video]
Source=node/view/full.tpl
MatchFile=full/ng_video.tpl
Subdir=templates
Match[class_identifier]=ng_video

[full_starter_ng_audio]
Source=node/view/full.tpl
MatchFile=full/ng_audio.tpl
Subdir=templates
Match[class_identifier]=ng_audio

# --- end of W5 forms and W5 video and audio --------------------------------------

*/ ?>
