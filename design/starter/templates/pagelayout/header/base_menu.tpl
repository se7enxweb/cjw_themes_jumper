{* The base navigation (v2: themes/cjw_app/parts/base_menu.html.twig): the offcanvas toggle, the small logo and,
   on the right, the top links (the ng_shortcut children of the folder named in cjw_jumper.ini [Header]
   TopLinkContainerNodeRemoteID) followed by the language switcher. *}
{def $bm_container = fetch( 'content', 'node', hash( 'remote_id', ezini( 'Header', 'TopLinkContainerNodeRemoteID', 'cjw_jumper.ini' ) ) )
     $bm_links = array()}
{if $bm_container}
    {set $bm_links = fetch( 'content', 'list', hash( 'parent_node_id', $bm_container.node_id, 'class_filter_type', 'include',
                                                   'class_filter_array', array( 'ng_shortcut' ), 'sort_by', $bm_container.sort_array, 'limit', 10 ) )}
{/if}
<div class="base-navigation">

        <nav class="navbar">

                <ul class="navbar-nav d-flex flex-row">

                        <li class="nav-item desktop-link offcanvas-toggle-container">
                <a class="nav-link" href="#" data-toggle="offcanvas" title="{'Open the menu containing all topics'|i18n( 'design/starter/pagelayout' )|wash}">
                    <div class="nav-icon">
                        <img src={ezini( 'Header', 'MenuIcon', 'cjw_jumper.ini' )|ezimage} alt="">
                    </div>

                    <span class="nav-text">
                        
                    </span>
                </a>
            </li>

                            <li class="nav-item ">
                    <a class="nav-link" href={'/'|ezurl} >
                        <div class="logo">
                            <img
                                src={ezini( 'Header', 'NavigationLogo', 'cjw_jumper.ini' )|ezimage}
                                height="40"
                                alt="">

                                                    </div>

                    </a>
                </li>
            
                    </ul>

        
                    <span class="top-link d-none d-md-block">
{foreach $bm_links as $bm_index => $bm_link}
                                    {if $bm_index|gt( 0 )}|{/if}
                    <a {include uri='design:parts/shortcut_link_attributes.tpl' shortcut=$bm_link}>
                        <span class="ezstring-field">{$bm_link.data_map.title.content|wash}</span>
                    </a>
{/foreach}
{include uri='design:pagelayout/header/language_switcher.tpl' separator=$bm_links|count|gt( 0 ) variant='top-link'}
                            </span>
            </nav>
</div>
{undef $bm_container $bm_links}
