{* The error page of the design starter (v2: themes/app/errors/{403,404,500,default}.html.twig): a "site-error" box
   with a heading and one message, drawn in the main zone of the page like v2's full_view block.
   Included by error/kernel/*.tpl with:
     title    the heading (plain text, washed here)
     message  the message (plain text, washed here)
     extra    optional HTML drawn after the box (the kernel's embedded sign-in form for "access denied") *}
<div class="site-error">
	    <h1>{$title|wash}</h1>

	    <div>{$message|wash}</div>
	</div>
{if and( is_set( $extra ), $extra|ne( '' ) )}
{$extra}
{/if}
