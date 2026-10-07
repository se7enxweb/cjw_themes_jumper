{* Scripts at the end of the page: the cookie banner (owner decision Q20), deferred like on alpha's media design.
   v2's tracking snippet (piwik, off by default there) is not carried (plan D-10). *}
{foreach ezscriptfiles( array( 'exp-cookie-consent.js' ), 1, true() ) as $sb_file}
<script defer type="text/javascript" src="{$sb_file}"></script>
{/foreach}
