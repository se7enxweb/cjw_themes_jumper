{* The wrapper of every block (v2: nglayouts/themes/app/block/block.html.twig): class "ngl-block ngl-<definition>
   ngl-vt-<view type> <css class>" (v2 leaves a space at the end when the css class is empty, kept), the
   vertical whitespace and background classes, the optional container. As in v2, a block whose content is
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
{def $bk_classes = concat( 'ngl-block ngl-', cond( $bk_def|eq( 'tpl_block' ), 'twig_block', $bk_def ),
                           ' ngl-vt-', cond( $bk_vt|eq( 'tpl_block' ), 'twig_block', $bk_vt ), ' ', first_set( $bk_params.css_class, '' ) )}
{if and( first_set( $bk_params['vertical_whitespace:enabled'], false() ), first_set( $bk_params['vertical_whitespace:position'], '' )|ne( '' ), first_set( $bk_params['vertical_whitespace:size'], '' )|ne( '' ) )}
    {set $bk_classes = concat( $bk_classes, ' whitespace-', $bk_params['vertical_whitespace:position'], ' whitespace-', $bk_params['vertical_whitespace:size'] )}
{/if}
{if and( first_set( $bk_params['background_color:enabled'], false() ), first_set( $bk_params['background_color:color'], '' )|ne( '' ) )}
    {set $bk_classes = concat( $bk_classes, ' bg-color-', $bk_params['background_color:color'] )}
{/if}
    <div
        class="{$bk_classes|wash}"
        {if first_set( $bk_params.css_id, '' )|ne( '' )}id="{$bk_params.css_id|wash}"{/if}
    >
        {if first_set( $bk_params.set_container, false() )}<div class="container{if first_set( $bk_params['set_container:size'], '' )|ne( '' )} container-{$bk_params['set_container:size']|wash}{/if}">{/if}
{$bk_html}
        {if first_set( $bk_params.set_container, false() )}</div>{/if}
    </div>
{undef $bk_def $bk_vt $bk_params $bk_classes}
{/if}
{undef $bk_block $bk_html}
