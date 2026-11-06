{* The wrapper of every block (Jac-Example: nglayouts/themes/cjw_app/block/block.html.twig): class "ngl-block ngl-<definition>
   ngl-vt-<view type> <css class>" plus whitespace and item-view-<item view type> (v2 leaves a space at the end when the css class is empty, kept), the
   background class, the optional container. As in v2, a block whose content is
   empty is not drawn at all. tpl_block blocks are v2's twig_block blocks and carry v2's class names.
   The content comes from explayouts/block/<definition>.tpl.

   Blocks nest (a column block includes this template again for its children), and an include shares the
   variables of the template that includes it: the child's "block" parameter replaces this one's $block. So the
   block is put on a stack before its content is drawn and taken back from it afterwards, and everything the
   wrapper needs is computed only then. *}
{if is_set( $bk_stack )|not}{def $bk_stack = array()}{/if}
{set $bk_stack = $bk_stack|append( $block )}
{set-block variable=bk_html}{include uri=concat( 'design:explayouts/block/', $block.definition_identifier, '.tpl' ) block=$block zone=$zone}{/set-block}
{def $bk_block = $bk_stack[$bk_stack|count|dec]}
{set $bk_stack = $bk_stack|extract_left( $bk_stack|count|dec )}
{if $bk_html|trim|ne( '' )}
{def $bk_def = $bk_block.definition_identifier
     $bk_vt = first_set( $bk_block.view_type, '' )
     $bk_params = first_set( $bk_block.parameters, hash() )}
{* Block templates: in v2 some view types put their own class before the css class (title centered/section,
   list numbered, ezcontent_field's field-<identifier>); kept here, where v2's wrapper prints it. *}
{def $bk_css_pre = hash( 'title_centered', 'text-center ', 'centered', 'text-center ', 'section', 'section-title ',
                         'section_centered', 'section-title section-title-centered ', 'list_numbered', 'list-numbered ' )}
{set $bk_css_pre = cond( $bk_def|eq( 'ezcontent_field' ), concat( 'field-', first_set( $bk_params.field_identifier, '' ), ' ' ), first_set( $bk_css_pre[$bk_vt], '' ) )}
{def $bk_classes = concat( 'ngl-block ngl-', cond( $bk_def|eq( 'tpl_block' ), 'twig_block', $bk_def ),
                           ' ngl-vt-', cond( $bk_vt|eq( 'tpl_block' ), 'twig_block', $bk_vt ), ' ', $bk_css_pre, first_set( $bk_params.css_class, '' ) )}
{undef $bk_css_pre}
{* Vertical whitespace as in Jac-Example's wrapper (design cjw_app, nglayouts/themes/cjw_app/block/block.html.twig):
   with "Use vertical whitespace" whitespace-top-<On top> and whitespace-bottom-<On bottom>, an empty value included
   (v2 prints "whitespace-top-" then too); the classes are in app.css. vertical_whitespace:position/size belong to
   the wrapper of the design app, which Jac-Example does not use. *}
{if first_set( $bk_params['vertical_whitespace:enabled'], '' )|eq( '1' )}
    {set $bk_classes = concat( $bk_classes, ' whitespace-top-', first_set( $bk_params['vertical_whitespace:top'], '' ),
                               ' whitespace-bottom-', first_set( $bk_params['vertical_whitespace:bottom'], '' ) )}
{/if}
{if and( first_set( $bk_params['background_color:enabled'], false() ), first_set( $bk_params['background_color:color'], '' )|ne( '' ) )}
    {set $bk_classes = concat( $bk_classes, ' bg-color-', $bk_params['background_color:color'] )}
{/if}
{* item-view-<item view type>, as list/_item.tpl draws it: the view types with one item view only (grid tiles, the
   galleries, zig-zag, accordion) always print that one, whatever item view the block kept from an earlier view type
   (app.css styles item-view-tile, item-view-gallery_grid ...); zigzag and accordion count for their list view types
   only, elsewhere item-view-standard. *}
{def $bk_ivt = first_set( $bk_block.item_view_type, '' )
     $bk_fixed = hash( 'grid_tiles', 'tile', 'list_zigzag', 'zigzag', 'list_accordion', 'accordion',
                     'carousel', 'carousel', 'grid_gallery', 'gallery_grid', 'slider', 'slide', 'thumb_gallery', 'gallery_thumb',
                     'grid_gallery_fixed_height', 'gallery_grid_fixed_height', 'grid_gallery_fixed_width', 'gallery_grid_fixed_width' )}
{if is_set( $bk_fixed[$bk_vt] )}
    {set $bk_ivt = $bk_fixed[$bk_vt]}
{elseif and( array( 'zigzag', 'accordion' )|contains( $bk_ivt ), array( 'list_zigzag', 'list_accordion' )|contains( $bk_vt )|not )}
    {set $bk_ivt = 'standard'}
{/if}
    <div
        class="{$bk_classes|wash} item-view-{$bk_ivt|wash}"
        {if first_set( $bk_params.css_id, '' )|ne( '' )}id="{$bk_params.css_id|wash}"{/if}
    >
        {if first_set( $bk_params.set_container, false() )}<div class="container{if first_set( $bk_params['set_container:size'], '' )|ne( '' )} container-{$bk_params['set_container:size']|wash}{/if}">{/if}
{$bk_html}
        {if first_set( $bk_params.set_container, false() )}</div>{/if}
    </div>
{undef $bk_def $bk_vt $bk_params $bk_classes $bk_ivt $bk_fixed}
{/if}
{undef $bk_block $bk_html}
