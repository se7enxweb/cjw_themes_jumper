{* The offcanvas menu (v2: themes/cjw_app/parts/offcanvas_menu.html.twig): the children of the root node of the
   siteaccess by priority, the top list below [Menu] BreakPriority and the bottom list from it on
   (cjw_jumper.ini). Built from the content tree alone, so it fills in as content arrives. The language switcher
   closes the bottom list (on the phone the top links are hidden). *}
{def $oc_lists = hash( 'top', array(), 'bottom', array() )}
{if $pl_root_node}
    {set $oc_lists = hash(
        'top', fetch( 'content', 'list', hash( 'parent_node_id', $pl_root_node.node_id, 'sort_by', array( 'priority', true() ),
                                               'limit', ezini( 'Menu', 'Limit', 'cjw_jumper.ini' ),
                                               'attribute_filter', array( 'and', array( 'priority', '>=', ezini( 'Menu', 'TopMinPriority', 'cjw_jumper.ini' ) ),
                                                                                 array( 'priority', '<', ezini( 'Menu', 'BreakPriority', 'cjw_jumper.ini' ) ) ) ) ),
        'bottom', fetch( 'content', 'list', hash( 'parent_node_id', $pl_root_node.node_id, 'sort_by', array( 'priority', true() ),
                                                  'limit', ezini( 'Menu', 'Limit', 'cjw_jumper.ini' ),
                                                  'attribute_filter', array( 'and', array( 'priority', '>=', ezini( 'Menu', 'BreakPriority', 'cjw_jumper.ini' ) ),
                                                                                    array( 'priority', '<=', ezini( 'Menu', 'MaxPriority', 'cjw_jumper.ini' ) ) ) ) ) )}
{/if}
<div class="navbar-collapse offcanvas-collapse" id="offcanvas-menu">

    <div class="navbar-header">
        <a class="navbar-brand" href={'/'|ezurl} title="{'Go to home page'|i18n( 'design/starter/pagelayout' )|wash}">
                        <img src={ezini( 'Header', 'OffcanvasLogo', 'cjw_jumper.ini' )|ezimage} alt="">
        </a>

        <div class="navbar-toggler">
            <a href="#" data-toggle="offcanvas" title="{'Close the navigation'|i18n( 'design/starter/pagelayout' )|wash}">
                {'close'|i18n( 'design/starter/pagelayout' )|wash}&nbsp;

                                <img src={'icons/close.png'|ezimage} alt="x" />
            </a>
        </div>
    </div>

{foreach $oc_lists as $oc_name => $oc_items}
                <ul class="navbar-nav mr-auto cjw-nav-offcanvas-{$oc_name}">
{foreach $oc_items as $oc_item}
    <li class="nav-item">
                <a class="nav-link"
           {if $oc_item.class_identifier|eq( 'ng_shortcut' )}{include uri='design:parts/shortcut_link_attributes.tpl' shortcut=$oc_item}{else}href={$oc_item.url_alias|ezurl}{/if}>
            {include uri='design:parts/menu_label.tpl' label_node=$oc_item}
        </a>
    </li>

{/foreach}
{if $oc_name|eq( 'bottom' )}{include uri='design:pagelayout/header/language_switcher.tpl' variant='offcanvas' separator=false()}{/if}
                    </ul>
{/foreach}
    
    
    </div>
{undef $oc_lists}
