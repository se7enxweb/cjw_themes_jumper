<?php /* #?ini charset="utf-8"?

# Layout block view types of the design "starter": the ones the Nexus v2
# starter layouts use (v2 layouts 1.4 + the CJW layouts bundle), added to
# the block definitions explayouts already has. Read only in the starter siteaccesses
# (ExtensionSettingsSiteAccess=cjw_starter). Each view type renders through
# design/starter/templates/explayouts/block/<definition>/<view type>.tpl
# (the templates arrive wave by wave; until then the block falls back to the
# definition's own template).

[BlockDefinition_two_columns]
ViewTypes[]=two_columns_50_50

[BlockDefinition_three_columns]
ViewTypes[]=three_columns_33_33_33

[BlockDefinition_title]
# v2 view types: title, centered, section, section_centered and the CJW boat titles
ViewTypes[]=title
ViewTypes[]=title_centered
ViewTypes[]=section
ViewTypes[]=section_centered
ViewTypes[]=boat_blue
ViewTypes[]=boat_brown

# Item view types (ItemViewTypes[<item view type>]=<label>, explayouts 1.4.51 or later; an older explayouts
# ignores them): every item view the starter design draws, content/views/<item view type>.tpl or
# content/views/<item view type>/<class>.tpl. They are added to the ones the block handler offers in code
# (standard, standard_with_intro, overlay, card, card_with_intro, line, mini, listitem, listitem_with_intro for
# the list blocks; none for the galleries), and an entry here replaces the handler's label. The view types
# that draw one item view only (grid_tiles: tile, list_zigzag: zigzag, list_accordion: accordion, the gallery
# view types: carousel, gallery_grid, slide, gallery_thumb) draw that one whatever the block stores
# (design/starter/templates/explayouts/block/list/_item.tpl); a block that stores none draws the view type's
# own item view, standard for the list and the grid.

[BlockDefinition_list]
ViewTypes[]=grid_tiles
ViewTypes[]=list_zigzag
ViewTypes[]=list_accordion
ViewTypeNames[grid_tiles]=Grid (tiles)
ViewTypeNames[list_zigzag]=Zig-zag
ViewTypeNames[list_accordion]=Accordion
ItemViewTypes[standard]=Standard
ItemViewTypes[standard_with_intro]=Standard (with intro)
ItemViewTypes[card]=Card
ItemViewTypes[card_with_intro]=Card (with intro)
ItemViewTypes[overlay]=Overlay
ItemViewTypes[listitem]=List item
ItemViewTypes[listitem_with_intro]=List item (with intro)
ItemViewTypes[mini]=Mini
ItemViewTypes[event]=Event
ItemViewTypes[tile]=Tile
ItemViewTypes[button]=Button
ItemViewTypes[teaser_bg_matrix]=Teaser (chess)
ItemViewTypes[teaser_bg_white]=Teaser (chess, white)
ItemViewTypes[line]=Line (image right)
ItemViewTypes[line_il]=Line (image left)
ItemViewTypes[line_x]=Line (image alternating)
ItemViewTypes[line_h]=Line (half and half, image right)
ItemViewTypes[line_h_il]=Line (half and half, image left)
ItemViewTypes[line_h_x]=Line (half and half, image alternating)
ItemViewTypes[line_full_il]=Line (full width, image left)
ItemViewTypes[line_30_70_il]=Line 30/70 (image left)
ItemViewTypes[line_30_70_ir]=Line 30/70 (image right)
ItemViewTypes[line_30_70_x]=Line 30/70 (image alternating)
ItemViewTypes[line_50_50_il]=Line 50/50 (image left)
ItemViewTypes[line_50_50_ir]=Line 50/50 (image right)
ItemViewTypes[line_50_50_x]=Line 50/50 (image alternating)
ItemViewTypes[40_60_img_left_plus_list]=Line 40/60 (image left, with list)
ItemViewTypes[flexline]=Flexline
ItemViewTypes[zigzag]=Zig-zag
ItemViewTypes[accordion]=Accordion
# The item view types each view type draws, as on the Netgen site (ViewTypeItemViewTypes[], with an explayouts that
# reads it; an older one offers every item view type for every view type): the layout editor offers a view type
# only these, and shows no select where one is left (grid_featured, grid_tiles, the zig-zag, the accordion).
ViewTypeItemViewTypes[list]=standard,standard_with_intro,overlay,mini,listitem,listitem_with_intro,line,line_il,line_x,line_h,line_h_il,line_h_x,line_50_50_il,line_50_50_ir,line_50_50_x,line_30_70_il,line_30_70_ir,line_30_70_x,line_full_il,40_60_img_left_plus_list,flexline,card,card_with_intro
ViewTypeItemViewTypes[list_numbered]=standard,standard_with_intro,overlay,mini,listitem,listitem_with_intro,line,line_il,line_x,line_h,line_h_il,line_h_x,line_50_50_il,line_50_50_ir,line_50_50_x,line_30_70_il,line_30_70_ir,line_30_70_x,line_full_il,40_60_img_left_plus_list,flexline,card,card_with_intro
ViewTypeItemViewTypes[grid]=standard,standard_with_intro,teaser_bg_matrix,teaser_bg_white,overlay,event,button,card,card_with_intro
ViewTypeItemViewTypes[grid_featured]=overlay
ViewTypeItemViewTypes[grid_tiles]=tile
ViewTypeItemViewTypes[list_zigzag]=zigzag
ViewTypeItemViewTypes[list_accordion]=accordion

# The zig-zag and the accordion as blocks of their own (toolbox): drawn by the starter's list templates
# (design/starter/templates/explayouts/block/list_zigzag.tpl, list_accordion.tpl), each in its one item view.
[BlockDefinition_list_zigzag]
ItemViewTypes[zigzag]=Zig-zag
ViewTypeItemViewTypes[list_zigzag]=zigzag

[BlockDefinition_list_accordion]
ItemViewTypes[accordion]=Accordion
ViewTypeItemViewTypes[list_accordion]=accordion

[BlockDefinition_gallery]
ViewTypes[]=carousel
ViewTypes[]=grid_gallery
ViewTypes[]=slider
ViewTypes[]=thumb_gallery
ViewTypeNames[carousel]=Carousel
# carousel draws images only (content/views/carousel/image.tpl), the other three every class
ItemViewTypes[carousel]=Carousel
ItemViewTypes[gallery_grid]=Gallery grid
ItemViewTypes[slide]=Slide
ItemViewTypes[gallery_thumb]=Gallery thumb
ItemViewTypes[standard]=Standard
ItemViewTypes[standard_with_intro]=Standard (with intro)
ItemViewTypes[card]=Card
ItemViewTypes[card_with_intro]=Card (with intro)
ItemViewTypes[line]=Line (image right)
ItemViewTypes[line_il]=Line (image left)
ItemViewTypes[overlay]=Overlay
# One item view per view type, as on the Netgen site: the layout editor shows no item view type select for them.
ViewTypeItemViewTypes[carousel]=carousel
ViewTypeItemViewTypes[slider]=slide
ViewTypeItemViewTypes[thumb_gallery]=gallery_thumb
ViewTypeItemViewTypes[grid_gallery]=gallery_grid
# The starter's gallery templates draw their items with the item views, not with the image attribute and the
# thumbnail size of the gallery block (explayouts' standard gallery templates read them): not offered.
HiddenParameters[]=image_attribute
HiddenParameters[]=thumbnail_size
# explayouts adds the view type gallery to every gallery definition; the starter's gallery.tpl does not draw it (it
# would fall back to the slider), and the Netgen site had no gallery view type: not offered.
HiddenViewTypes[]=gallery
# The sushi bar: a swiper row of the items in their item view, as on the Netgen site (gallery/sushi_bar.tpl)
ViewTypeItemViewTypes[sushi_bar]=standard_with_intro,overlay,line,line_il
ViewTypeHiddenParameters[sushi_bar]=enable_lightbox
# The thumb gallery draws its own thumbnails, and neither it nor the slider opens a lightbox (as the Netgen site,
# whose valid_parameters left both out for them); the slider shows Thumbnails per row/slide side by side (slider.tpl)
ViewTypeHiddenParameters[slider]=enable_lightbox
ViewTypeHiddenParameters[thumb_gallery]=number_of_thumbnails,enable_lightbox

# The gallery variants as blocks of their own (toolbox): drawn by the starter's gallery templates
# (design/starter/templates/explayouts/block/slider.tpl, grid_gallery.tpl, thumb_gallery.tpl), with the same
# item views as the gallery block.
[BlockDefinition_slider]
# its own view type first, as explayouts lists it (a new block gets the first one)
ViewTypes[]=slider
ViewTypes[]=carousel
ViewTypeNames[carousel]=Carousel
ItemViewTypes[carousel]=Carousel
ItemViewTypes[gallery_grid]=Gallery grid
ItemViewTypes[slide]=Slide
ItemViewTypes[gallery_thumb]=Gallery thumb
ItemViewTypes[standard]=Standard
ItemViewTypes[standard_with_intro]=Standard (with intro)
ItemViewTypes[card]=Card
ItemViewTypes[card_with_intro]=Card (with intro)
ItemViewTypes[line]=Line (image right)
ItemViewTypes[line_il]=Line (image left)
ItemViewTypes[overlay]=Overlay
# One item view per view type, as on the Netgen site: the layout editor shows no item view type select for them.
ViewTypeItemViewTypes[carousel]=carousel
ViewTypeItemViewTypes[slider]=slide
ViewTypeItemViewTypes[thumb_gallery]=gallery_thumb
ViewTypeItemViewTypes[grid_gallery]=gallery_grid
# The starter's gallery templates draw their items with the item views, not with the image attribute and the
# thumbnail size of the gallery block (explayouts' standard gallery templates read them): not offered.
HiddenParameters[]=image_attribute
HiddenParameters[]=thumbnail_size
# explayouts adds the view type gallery to every gallery definition; the starter's gallery.tpl does not draw it (it
# would fall back to the slider), and the Netgen site had no gallery view type: not offered.
HiddenViewTypes[]=gallery
# The sushi bar: a swiper row of the items in their item view, as on the Netgen site (gallery/sushi_bar.tpl)
ViewTypeItemViewTypes[sushi_bar]=standard_with_intro,overlay,line,line_il
ViewTypeHiddenParameters[sushi_bar]=enable_lightbox
# The thumb gallery draws its own thumbnails, and neither it nor the slider opens a lightbox (as the Netgen site,
# whose valid_parameters left both out for them); the slider shows Thumbnails per row/slide side by side (slider.tpl)
ViewTypeHiddenParameters[slider]=enable_lightbox
ViewTypeHiddenParameters[thumb_gallery]=number_of_thumbnails,enable_lightbox

[BlockDefinition_grid_gallery]
# its own view type first, as explayouts lists it (a new block gets the first one)
ViewTypes[]=grid_gallery
ViewTypes[]=carousel
ViewTypeNames[carousel]=Carousel
ItemViewTypes[carousel]=Carousel
ItemViewTypes[gallery_grid]=Gallery grid
ItemViewTypes[slide]=Slide
ItemViewTypes[gallery_thumb]=Gallery thumb
ItemViewTypes[standard]=Standard
ItemViewTypes[standard_with_intro]=Standard (with intro)
ItemViewTypes[card]=Card
ItemViewTypes[card_with_intro]=Card (with intro)
ItemViewTypes[line]=Line (image right)
ItemViewTypes[line_il]=Line (image left)
ItemViewTypes[overlay]=Overlay
# One item view per view type, as on the Netgen site: the layout editor shows no item view type select for them.
ViewTypeItemViewTypes[carousel]=carousel
ViewTypeItemViewTypes[slider]=slide
ViewTypeItemViewTypes[thumb_gallery]=gallery_thumb
ViewTypeItemViewTypes[grid_gallery]=gallery_grid
# The starter's gallery templates draw their items with the item views, not with the image attribute and the
# thumbnail size of the gallery block (explayouts' standard gallery templates read them): not offered.
HiddenParameters[]=image_attribute
HiddenParameters[]=thumbnail_size
# explayouts adds the view type gallery to every gallery definition; the starter's gallery.tpl does not draw it (it
# would fall back to the slider), and the Netgen site had no gallery view type: not offered.
HiddenViewTypes[]=gallery
# The sushi bar: a swiper row of the items in their item view, as on the Netgen site (gallery/sushi_bar.tpl)
ViewTypeItemViewTypes[sushi_bar]=standard_with_intro,overlay,line,line_il
ViewTypeHiddenParameters[sushi_bar]=enable_lightbox
# The thumb gallery draws its own thumbnails, and neither it nor the slider opens a lightbox (as the Netgen site,
# whose valid_parameters left both out for them); the slider shows Thumbnails per row/slide side by side (slider.tpl)
ViewTypeHiddenParameters[slider]=enable_lightbox
ViewTypeHiddenParameters[thumb_gallery]=number_of_thumbnails,enable_lightbox

[BlockDefinition_thumb_gallery]
# its own view type first, as explayouts lists it (a new block gets the first one)
ViewTypes[]=thumb_gallery
ViewTypes[]=carousel
ViewTypeNames[carousel]=Carousel
ItemViewTypes[carousel]=Carousel
ItemViewTypes[gallery_grid]=Gallery grid
ItemViewTypes[slide]=Slide
ItemViewTypes[gallery_thumb]=Gallery thumb
ItemViewTypes[standard]=Standard
ItemViewTypes[standard_with_intro]=Standard (with intro)
ItemViewTypes[card]=Card
ItemViewTypes[card_with_intro]=Card (with intro)
ItemViewTypes[line]=Line (image right)
ItemViewTypes[line_il]=Line (image left)
ItemViewTypes[overlay]=Overlay
# One item view per view type, as on the Netgen site: the layout editor shows no item view type select for them.
ViewTypeItemViewTypes[carousel]=carousel
ViewTypeItemViewTypes[slider]=slide
ViewTypeItemViewTypes[thumb_gallery]=gallery_thumb
ViewTypeItemViewTypes[grid_gallery]=gallery_grid
# The starter's gallery templates draw their items with the item views, not with the image attribute and the
# thumbnail size of the gallery block (explayouts' standard gallery templates read them): not offered.
HiddenParameters[]=image_attribute
HiddenParameters[]=thumbnail_size
# explayouts adds the view type gallery to every gallery definition; the starter's gallery.tpl does not draw it (it
# would fall back to the slider), and the Netgen site had no gallery view type: not offered.
HiddenViewTypes[]=gallery
# The sushi bar: a swiper row of the items in their item view, as on the Netgen site (gallery/sushi_bar.tpl)
ViewTypeItemViewTypes[sushi_bar]=standard_with_intro,overlay,line,line_il
ViewTypeHiddenParameters[sushi_bar]=enable_lightbox
# The thumb gallery draws its own thumbnails, and neither it nor the slider opens a lightbox (as the Netgen site,
# whose valid_parameters left both out for them); the slider shows Thumbnails per row/slide side by side (slider.tpl)
ViewTypeHiddenParameters[slider]=enable_lightbox
ViewTypeHiddenParameters[thumb_gallery]=number_of_thumbnails,enable_lightbox

[BlockSettings]
AvailableBlocks[]=ezcontent_field

[BlockDefinition_spacer]
# the CJW spacer: a line, or an image
ViewTypes[]=line
ViewTypes[]=image

[BlockDefinition_button]
ViewTypes[]=button_custom
# As on the Netgen site: Netgen's own button (button/button.tpl) and the three coloured CJW buttons (drawn by
# button/button_custom.tpl, whose class is the view type; app.css colours them)
ViewTypes[]=button
ViewTypes[]=button_lightblue
ViewTypes[]=button_blue
ViewTypes[]=button_green
ViewTypeNames[button]=Button / Link
ViewTypeNames[button_lightblue]=Button Hellblau
ViewTypeNames[button_blue]=Button Blau
ViewTypeNames[button_green]=Button Grün
# explayouts' default: the starter draws it as button_custom, the Netgen site had none
HiddenViewTypes[]=default

# v2's ezcontent_field block: one field of the current content (the home page
# shows its teaser_intro this way)
[BlockDefinition_ezcontent_field]
Name=Content field
Handler=expLayoutsTitleBlockHandler
ViewTypes[]=ezcontent_field
Category=basic

*/ ?>
