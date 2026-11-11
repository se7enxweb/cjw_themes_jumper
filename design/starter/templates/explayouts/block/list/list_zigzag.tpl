{* The view type "list_zigzag" of the list block (from explayouts; v2 has none): every item in a .list-item of a
   .list-row, always drawn in the item view "zigzag" (content/views/zigzag.tpl), as the media design does: image
   and text side by side, every second item mirrored (starter.css). *}
        <div class="list-row">
{foreach $block.values.items as $lz_item}
                            <div class="list-item">
{include uri='design:explayouts/block/list/_item.tpl' item=$lz_item ivt='zigzag' block=$block}
                                    </div>
{/foreach}
                    </div>
