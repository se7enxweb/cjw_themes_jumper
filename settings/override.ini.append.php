<?php /* #?ini charset="utf-8"?

# Template overrides of the design "starter". Read only in the siteaccesses
# that activate this extension (starter, starter_ger). The port of the Nexus v2
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
