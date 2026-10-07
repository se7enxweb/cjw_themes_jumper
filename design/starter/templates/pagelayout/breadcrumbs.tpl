{* The breadcrumb (v2: themes/cjw_app/page_path.html.twig): "Start" (the root of the site), then the pages
   between the root and this one whose class is listed in cjw_jumper.ini [Breadcrumb] ClassIdentifiers, the last
   one shortened and not linked. Not on module pages, nor on the classes of [Breadcrumb] HiddenOnClasses (v2 shows
   none there). *}
{if and( $pl_node, ezini( 'Breadcrumb', 'HiddenOnClasses', 'cjw_jumper.ini' )|contains( $pl_node.class_identifier )|not )}
{def $bc_classes = ezini( 'Breadcrumb', 'ClassIdentifiers', 'cjw_jumper.ini' )
     $bc_items = array()}
{foreach $pl_node.path as $bc_node}{if $bc_node.depth|gt( $pl_root_depth )}{set $bc_items = $bc_items|append( $bc_node )}{/if}{/foreach}
{if $pl_node.depth|gt( $pl_root_depth )}{set $bc_items = $bc_items|append( $pl_node )}{/if}
        <div class="breadcrumb-wrapper">
        <div class="container">
                <ul id="breadcrumb" class="breadcrumb">
                                                                        <li class="breadcrumb-item inline">
                                <a href={'/'|ezurl}>
                                    {'Start'|i18n( 'design/starter/pagelayout' )|wash}
                                </a>
                            </li>
{foreach $bc_items as $bc_index => $bc_item}
{if $bc_classes|contains( $bc_item.class_identifier )}
{def $bc_last = $bc_index|eq( $bc_items|count|dec )}
                                <li class="breadcrumb-item inline{if $bc_last} active{else} d-none d-sm-block{/if}"
                                    {if $bc_last|not}title="{'Go to "%name"'|i18n( 'design/starter/pagelayout', '', hash( '%name', $bc_item.name ) )|wash}"{/if}>
{if $bc_last}
                                            {* v2 truncate(n) keeps n characters and adds "..."; shorten(n) counts the "..." in *}{$bc_item.name|shorten( ezini( 'Breadcrumb', 'LastItemLength', 'cjw_jumper.ini' )|sum( 3 ), '...' )|wash}
{else}
                                            <a href={$bc_item.url_alias|ezurl}>{$bc_item.name|wash}</a>
{/if}
                                </li>
{undef $bc_last}
{/if}
{/foreach}
                </ul>
                    </div>
    </div>
{undef $bc_classes $bc_items}
{/if}
