{* A date in the English format v2's Twig date filter prints on every site language (v2 shows "October 7th, 2026"
   on the German pages too), so the month name does not follow the siteaccess locale.
   Input: de_time (unix time), de_format 'F jS, Y' (default) or 'j M Y'. *}
{def $de_months = array( 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' )
     $de_day = $de_time|datetime( 'custom', '%j' )
     $de_idx = sub( $de_time|datetime( 'custom', '%n' ), 1 )
     $de_year = $de_time|datetime( 'custom', '%Y' )}
{def $de_month = $de_months[$de_idx]}
{if first_set( $de_format, 'F jS, Y' )|eq( 'j M Y' )}{$de_day} {$de_month|extract( 0, 3 )} {$de_year}{else}{$de_month} {$de_day}{if and( $de_day|mod( 100 )|ge( 11 ), $de_day|mod( 100 )|le( 13 ) )}th{elseif $de_day|mod( 10 )|eq( 1 )}st{elseif $de_day|mod( 10 )|eq( 2 )}nd{elseif $de_day|mod( 10 )|eq( 3 )}rd{else}th{/if}, {$de_year}{/if}{undef $de_months $de_day $de_idx $de_month $de_year}
