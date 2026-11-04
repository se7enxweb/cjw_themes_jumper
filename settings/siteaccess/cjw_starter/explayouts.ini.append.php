<?php /* #?ini charset="utf-8"?

# Layout block view types of the design "starter": the ones the Nexus v2
# starter layouts use (Netgen Layouts 1.4 + the CJW layouts bundle), added to
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

[BlockDefinition_list]
ViewTypes[]=grid_tiles
# the item views the starter design draws (content/views/<item view type>.tpl) and the Netgen site uses;
# ItemViewTypes[] needs explayouts with expLayoutsBlockHandlerFactory::itemViewTypes()
ItemViewTypes[event]=Veranstaltung
ItemViewTypes[flexline]=Flexline
ItemViewTypes[line_h]=Line - Halb / Halb - Bild rechts

[BlockDefinition_gallery]
ViewTypes[]=carousel
ViewTypes[]=grid_gallery
ViewTypes[]=slider
ViewTypes[]=thumb_gallery
# a block that names no item view (stored empty) draws the view type's own: carousel, gallery_grid, slide,
# gallery_thumb (design/starter/templates/explayouts/block/gallery/*.tpl); standard is an item view of its own
ItemViewTypes[standard]=Standard
ItemViewTypes[gallery_grid]=Gallery grid
ItemViewTypes[slide]=Slide
ItemViewTypes[gallery_thumb]=Gallery thumb
ItemViewTypes[line]=Line
ItemViewTypes[overlay]=Overlay
ItemViewTypes[standard_with_intro]=Standard (with intro)

[BlockSettings]
AvailableBlocks[]=ezcontent_field

[BlockDefinition_spacer]
# the CJW spacer: a line, or an image
ViewTypes[]=line
ViewTypes[]=image

[BlockDefinition_button]
ViewTypes[]=button_custom

# v2's ezcontent_field block: one field of the current content (the home page
# shows its teaser_intro this way)
[BlockDefinition_ezcontent_field]
Name=Content field
Handler=expLayoutsTitleBlockHandler
ViewTypes[]=ezcontent_field
Category=basic

*/ ?>
