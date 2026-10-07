{* Head: scripts. v2: themes/cjw_app/page_head_script.html.twig.

   In <head>, blocking, in v2's order, packed by ezjscore into one file at pack level 1 (concatenated, not
   minified): first ezjscore's jQuery 4 with jQuery Migrate (ezjsc::jquery, owner decision Q19), then v2's
   webpack runtime, photoswipe-init.js and app.js (its built-in jQuery 3.7.1 replaced by the page's jQuery),
   and the two Netgen Layouts scripts. Not deferred: the inline script below runs at once and needs jQuery.
   v2's third-party script (optimale-praesentation "boot") is JAC's own account and is not carried (plan D-10). *}
{ezscript_load( array( 'ezjsc::jquery',
                       'runtime.js',
                       'photoswipe-init.js',
                       'app.js',
                       'nglayouts.js',
                       'nglayouts-standard.js' ), 'text/javascript', '', 'utf-8', 1 )}
{include uri='design:pagelayout/head/script_inline.tpl'}
