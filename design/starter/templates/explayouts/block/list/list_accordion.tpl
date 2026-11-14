{* The view type "list_accordion" of the list block (from explayouts; v2 has none): every item in a .list-item of a
   .list-row with the id the items' collapse panels name as their parent, so one panel is open at a time
   (Bootstrap 4 collapse from app.js). Always drawn in the item view "accordion" (content/views/accordion.tpl), as
   the media design does. *}
        <div class="list-row" id="accordion-{$block.id|wash}">
{foreach $block.values.items as $la_item}
                            <div class="list-item">
{include uri='design:explayouts/block/list/_item.tpl' item=$la_item ivt='accordion' block=$block}
                                    </div>
{/foreach}
                    </div>
