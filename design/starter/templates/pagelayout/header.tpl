{* The site header (v2: themes/cjw_app/page_header.html.twig): the base navigation, the header image (a slider
   when the page has several header images, else one background image found on the way up to the root, else
   the design's fallback image), the speech bubble of a single header image's shortcut, the offcanvas menu and
   the colour row with the logo. *}
{def $hd_classes = ezini( 'Header', 'HeadImageClasses', 'cjw_jumper.ini' )
     $hd_banners = array()
     $hd_shortcut = false()
     $hd_image = ''}
{if $pl_node}
    {set $hd_banners = fetch( 'content', 'list', hash( 'parent_node_id', $pl_node.node_id, 'class_filter_type', 'include',
                                                     'class_filter_array', $hd_classes, 'sort_by', $pl_node.sort_array, 'limit', 10 ) )}
    {if $hd_banners|count|eq( 1 )}
        {set $hd_shortcut = fetch( 'content', 'list', hash( 'parent_node_id', $hd_banners[0].node_id, 'class_filter_type', 'include',
                                                           'class_filter_array', array( 'ng_shortcut' ), 'limit', 1 ) )}
        {set $hd_shortcut = cond( $hd_shortcut|count, $hd_shortcut[0], false() )}
    {/if}
{/if}
{if $hd_banners|count|lt( 2 )}
    {* v2 cjw_get_head_image: the first header image of the page itself, else of its parents up to the root *}
    {if $pl_node}
        {foreach $pl_node.path_array|reverse as $hd_path_id}
            {def $hd_found = fetch( 'content', 'list', hash( 'parent_node_id', $hd_path_id, 'class_filter_type', 'include',
                                                            'class_filter_array', $hd_classes, 'limit', 1 ) )}
            {if and( $hd_found|count, $hd_found[0].data_map.image.has_content )}
                {set $hd_image = $hd_found[0].data_map.image.content.original.url|ezroot( 'no' )}
                {undef $hd_found}
                {break}
            {/if}
            {undef $hd_found}
            {* the root of the site is the last page asked *}
            {if or( $pl_root_node|not, $hd_path_id|eq( $pl_root_node.node_id ) )}{break}{/if}
        {/foreach}
    {/if}
    {if $hd_image|eq( '' )}
        {set $hd_image = cond( $pl_is_landing, ezini( 'Header', 'FallbackImageLanding', 'cjw_jumper.ini' ), ezini( 'Header', 'FallbackImage', 'cjw_jumper.ini' ) )|ezimage( 'no' )}
    {/if}
{/if}
        <header class="site-header">
    <div class="container">
{include uri='design:pagelayout/header/base_menu.tpl'}
            </div>
    <div class="container-fluid">
        <div class="background-container{if $pl_is_landing} large{/if}"
             {if $hd_banners|count|lt( 2 )}style="background-image: url({$hd_image})"{/if}>

{if $hd_shortcut}
{include uri='design:pagelayout/header/speechbubble.tpl' shortcut=$hd_shortcut}
{/if}

{if $hd_banners|count|gt( 1 )}
                            <div class="head-image-slider slick-slider no-arrows"
                     data-slick='{ldelim} "arrows" : true, "autoplay" : false, "autoplaySpeed" : 6000, "fade": true, "speed" : 1000 {rdelim}'>
{foreach $hd_banners as $hd_banner}
                                            <div class="slick-content-container">
    {def $hd_bubble = fetch( 'content', 'list', hash( 'parent_node_id', $hd_banner.node_id, 'class_filter_type', 'include',
                                                     'class_filter_array', array( 'ng_shortcut' ), 'limit', 1 ) )}
    {if $hd_bubble|count}{include uri='design:pagelayout/header/speechbubble.tpl' shortcut=$hd_bubble[0]}{/if}
    {undef $hd_bubble}
    {if $hd_banner.data_map.image.has_content}
                                                            <img class="img-responsive img-fluid"
                                     src={$hd_banner.data_map.image.content.original.url|ezroot} alt=""/>
    {/if}
    {if and( is_set( $hd_banner.data_map.header_text ), $hd_banner.data_map.header_text.has_content )}
                                                            <div class="header-text">
                                    <div class="ezxmltext-field">{$hd_banner.data_map.header_text.content.output.output_text}</div>

                                </div>
    {/if}
                        </div>
{/foreach}
                                    </div>
{/if}

{include uri='design:pagelayout/header/offcanvas_menu.tpl'}
        </div>
    </div>
    <div class="page-header-color-row">
        <div class="container">
            <div class="row">
                <span class="d-none d-xl-block">
{include uri='design:parts/site_logo.tpl' logo=ezini( 'Header', 'ColorRowLogo', 'cjw_jumper.ini' )}
</span>

                                    <div class="col-4 color color-1"></div>
                                    <div class="col-4 color color-2"></div>
                                    <div class="col-4 color color-3"></div>
                            </div>
        </div>
    </div>
</header>
{undef $hd_classes $hd_banners $hd_shortcut $hd_image}
