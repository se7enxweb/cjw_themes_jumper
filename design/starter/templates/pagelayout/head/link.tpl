{* Head: rel links and favicons. v2: themes/app/page_head.html.twig (link part). *}
<link rel="home" href={'/'|ezurl} title="{'%site_name front page'|i18n( 'design/starter/pagelayout', '', hash( '%site_name', $pl_site_name ) )|wash}" />
<link rel="index" href={'/'|ezurl} />
<link rel="search" href={'/content/search'|ezurl} title="{'Search %site_name'|i18n( 'design/starter/pagelayout', '', hash( '%site_name', $pl_site_name ) )|wash}" />

{foreach array( '152', '144', '120', '114', '76', '72' ) as $lk_size}
<link rel="icon apple-touch-icon-precomposed" sizes="{$lk_size}x{$lk_size}" href={concat( 'favicon/favicon-', $lk_size, '.png' )|ezimage} />
{/foreach}
<link rel="icon apple-touch-icon-precomposed" href={'favicon/favicon-57.png'|ezimage} />

<link rel="icon" href={'favicon/favicon.png'|ezimage} type="image/x-icon" />
