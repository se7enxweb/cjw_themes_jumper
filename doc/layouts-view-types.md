# Exponential Layouts blocks in the design `starter`

The design `starter` draws the list and gallery blocks of Exponential Layouts (the extension `explayouts`) in the
look of the CJW starter site. This page lists the view types and item views it draws and the settings that offer them
to editors. The settings are in `settings/siteaccess/cjw_starter/explayouts.ini.append.php` and reach only the
siteaccesses with `[SiteAccessSettings] ExtensionSettingsSiteAccess=cjw_starter`.

## Two axes: view type and item view type

- The **view type** of a block decides how the block lays out its items: a list, a grid, tiles, a zig-zag, an
  accordion, a carousel. Templates: `design/starter/templates/explayouts/block/<definition>/<view type>.tpl`
  (`list/grid.tpl`, `gallery/carousel.tpl` ...).
- The **item view type** decides how each item is drawn inside it: a card, a line with the image on the left, a
  tile. Templates: `design/starter/templates/content/views/<item view type>/<class>.tpl`, else
  `content/views/<item view type>.tpl`, found by `list/_item.tpl`.

Editors pick both in the layout editor and in the block edit form of the administration. The item view types of a
block definition are the ones its handler offers in code plus the `ItemViewTypes[]` of its settings; this needs
**explayouts 1.4.51 or later** (with `explayouts_ui_api` 1.3.37 and `explayouts_ui` 1.3.34 for the layout editor).
An older explayouts ignores `ItemViewTypes[]` and offers only the handler's list.

The layout editor runs in the administration but previews in a site: set `[PreviewSettings] SiteAccess` of the
administration to a starter siteaccess (for example `starter_ger`) so that the editor reads these settings.

## View types of the list block

| View type | Label | Template | Items drawn in |
| --- | --- | --- | --- |
| `list` | List | `list/list.tpl` | the block's item view (default `standard`) |
| `grid` | Grid | `list/grid.tpl` | the block's item view (default `standard`), 2, 3, 4 or 6 columns |
| `grid_tiles` | Grid (tiles) | `list/grid_tiles.tpl` | always `tile` |
| `list_numbered` | Numbered list | `list/list_numbered.tpl` | the block's item view |
| `list_zigzag` | Zig-zag | `list/list_zigzag.tpl` | always `zigzag` |
| `list_accordion` | Accordion | `list/list_accordion.tpl` | always `accordion` |

**Zig-zag**: image and text (title, intro, a "Read more" button) side by side; every second item is mirrored, and
below 768px the image stands above the text (`starter.css`, `.vl9`).

**Accordion**: each item is a panel whose title opens and closes the intro and a "Read more" link (Bootstrap 4
collapse); the panels of one block share a parent, so one is open at a time (`starter.css`, `.vl10`).

The toolbox also has **Zig-Zag (List)** and **Accordion (List)** as blocks of their own (the definitions
`list_zigzag` and `list_accordion`). The starter draws them exactly as a list block with that view type
(`explayouts/block/list_zigzag.tpl`, `list_accordion.tpl`), and their wrapper carries the class `ngl-list`.

```ini
# settings/siteaccess/cjw_starter/explayouts.ini.append.php
[BlockDefinition_list]
ViewTypes[]=grid_tiles
ViewTypes[]=list_zigzag
ViewTypes[]=list_accordion
ViewTypeNames[grid_tiles]=Grid (tiles)
ViewTypeNames[list_zigzag]=Zig-zag
ViewTypeNames[list_accordion]=Accordion
```

## View types of the gallery block

| View type | Template | Items drawn in |
| --- | --- | --- |
| `carousel` | `gallery/carousel.tpl` (slick, endless, centred) | always `carousel` (images) |
| `grid_gallery` | `gallery/grid_gallery.tpl` | always `gallery_grid` |
| `slider` | `gallery/slider.tpl` (slick) | always `slide` |
| `thumb_gallery` | `gallery/thumb_gallery.tpl` (swiper with thumbnails) | always `gallery_thumb` |
| any other (`gallery`, `sushi_bar`) | drawn as the slider | the block's item view (default `slide`) |

The images of a carousel, grid gallery or slider open in fancyBox, one group per block (`carousel-<block id>`,
`gallery_grid-<block id>`, `slide-<block id>`): two galleries on one page do not mix their images, and the slides
slick clones for the endless carousel are not counted twice. After fancyBox closes, the carousel turns to the image
shown last (`javascript/cjw_jumper_page.js`).

The gallery variants of the toolbox (**Slider**, **Grid gallery**, **Thumb gallery**) are drawn by the same gallery
templates (`explayouts/block/slider.tpl`, `grid_gallery.tpl`, `thumb_gallery.tpl`) and carry the class
`ngl-gallery`. **Sushi bar** keeps the template of explayouts.

## Item views

Every item view below is declared in `ItemViewTypes[]` of `[BlockDefinition_list]`; the gallery blocks
(`gallery`, `slider`, `grid_gallery`, `thumb_gallery`) offer the gallery item views and the general ones marked
"gallery too".

| Item view | Label | What it draws |
| --- | --- | --- |
| `standard` | Standard | image, title (gallery too) |
| `standard_with_intro` | Standard (with intro) | image, title, intro (gallery too) |
| `card` | Card | image on top in 16:9, the title below on a light ground; the cards of a grid row are equally high (gallery too) |
| `card_with_intro` | Card (with intro) | the card with the intro (gallery too) |
| `overlay` | Overlay | the title over the image (gallery too) |
| `listitem`, `listitem_with_intro` | List item | a compact list entry, with or without the intro |
| `mini` | Mini | a small image and the title |
| `event` | Event | the date, the image and the title of an event |
| `tile` | Tile | the teaser image as background, title and intro (drawn by Grid (tiles)) |
| `button` | Button | the item as a button link |
| `teaser_bg_matrix`, `teaser_bg_white` | Teaser (chess) | headline, title, intro, "more" button, the image as the field's background |
| `line` | Line (image right) | image beside the text (gallery too) |
| `line_il`, `line_x` | Line (image left / alternating) | |
| `line_h`, `line_h_il`, `line_h_x` | Line (half and half ...) | image and text half and half |
| `line_full_il` | Line (full width, image left) | |
| `line_30_70_il`, `_ir`, `_x` | Line 30/70 | image 30%, text 70% |
| `line_50_50_il`, `_ir`, `_x` | Line 50/50 | |
| `40_60_img_left_plus_list` | Line 40/60 (image left, with list) | for a folder: image left, title, intro and, with the block's "children submenu", the folder's shortcuts and articles; other classes draw the line with the image left |
| `flexline` | Flexline | the line view without a fixed image position |
| `zigzag` | Zig-zag | drawn by the zig-zag list only |
| `accordion` | Accordion | drawn by the accordion list only |
| `carousel`, `gallery_grid`, `slide`, `gallery_thumb` | Carousel, Gallery grid, Slide, Gallery thumb | the gallery item views (gallery blocks) |

```ini
[BlockDefinition_list]
ItemViewTypes[card]=Card
ItemViewTypes[card_with_intro]=Card (with intro)
ItemViewTypes[event]=Event
ItemViewTypes[line_h]=Line (half and half, image right)
ItemViewTypes[zigzag]=Zig-zag
ItemViewTypes[accordion]=Accordion

[BlockDefinition_gallery]
ItemViewTypes[carousel]=Carousel
ItemViewTypes[gallery_grid]=Gallery grid
ItemViewTypes[card]=Card
```

A design built on the starter adds an item view with a template and one settings line, no code:
`content/views/polaroid.tpl` and `ItemViewTypes[polaroid]=Polaroid`.

### Which item view a block draws

- A view type that can draw one item view only (`grid_tiles`, `list_zigzag`, `list_accordion` and the four gallery
  view types) draws that one whatever the block stores: the editor keeps a block's item view when the block is
  switched to such a view type, and the tile rows or the slick slides could not draw a line or a card.
- `zigzag` and `accordion` belong to their list view types; on any other view type a block that stores one of them
  draws `standard`.
- A block that stores no item view draws the default of its view type: `standard` for the list and the grid,
  `slide` for a gallery drawn as the slider.
- The block's wrapper carries `item-view-<item view type>` with the item view that is drawn (app.css styles
  `item-view-tile`, `item-view-gallery_grid` ...).

## The block wrapper

`explayouts/block/block.tpl` gives every block the classes `ngl-block ngl-<definition> ngl-vt-<view type>`, the
CSS class of the block, `item-view-<item view type>`, the background colour and, with "Use vertical whitespace",
`whitespace-top-<On top>` and `whitespace-bottom-<On bottom>` (styled in `app.css`).

## The offcanvas menu: further nodes

The offcanvas menu lists the children of the siteaccess's root node by priority (`cjw_jumper.ini [Menu]`). A
siteaccess can close its top list with further nodes from anywhere in the tree, for example a showcase below one of
the root's children, in the order given; a node that is missing or that the visitor may not read is left out:

```ini
# settings/siteaccess/starter_ger/cjw_jumper.ini.append.php
[Menu]
AdditionalNodeIDs[]
AdditionalNodeIDs[]=1234
AdditionalNodeIDs[]=1240
```

Set it in the siteaccess's own settings only: the extension's `settings/cjw_jumper.ini.append.php` is read after
`settings/siteaccess/<siteaccess>`, so a value there would replace the siteaccess's list.

## Scripts

`design/starter/javascript/app.js` is v2's build, written by a script from `doc/source/app.js` with three changes
named in its header: it runs on the page's jQuery 4 (ezjscore) instead of its own jQuery 3.7.1, Bootstrap 4 accepts
jQuery 4, and the second slick call leaves the carousel alone. The page loads jQuery Migrate 4.0.2 right after jQuery
(`pagelayout/head/script.tpl`), as the slick and fancyBox plugins in app.js need functions jQuery 4 removed.
