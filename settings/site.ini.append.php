<?php /* #?ini charset="utf-8"?

# Read only in the siteaccesses that activate this extension with
# ActiveAccessExtensions[]=cjw_themes_jumper (starter, starter_ger).

[RegionalSettings]
# the design strings of "starter" (translations/<locale>/translation.ts)
TranslationExtensions[]=cjw_themes_jumper

# W5 search: content/search.tpl of the design runs the search itself, limited to
# the siteaccess's content tree ([NodeSettings] RootNode), and reads v2's
# addresses (searchText, page) as well as the kernel's.
[SearchSettings]
SearchViewHandling=template

# --- W5 forms ---------------------------------------------------------------------
# The honeypot of the feedback forms: a submission to the information collector
# whose hidden field CjwFormWebsite is filled in is dropped before the collector
# runs (classes/cjwjumperformhoneypot.php).
[Event]
Listeners[]=request/input@cjwJumperFormHoneypot::input
# --- end of W5 forms --------------------------------------------------------------

*/ ?>
