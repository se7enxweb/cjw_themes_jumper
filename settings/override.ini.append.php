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

*/ ?>
