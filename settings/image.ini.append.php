<?php /* #?ini charset="utf-8"?

# Image aliases of the design "starter", global (every siteaccess; only the starter
# design asks for them, and the names are new, so other sites are not affected).
#
# They are the image variations of the Nexus v2 starter site (i30 ... i1920 and
# the 16:9 crops), under NEW names: cjw_i30 ... cjw_i1920. The installation may
# already define i160, i1920 and the like with other geometry, and an alias
# name is stored with every image it was generated for, so a name defined twice
# with different filters serves whichever version was generated first.
#
# Filters as v2 (Imagine with the Imagick driver, v2's image.yml): scale to the
# width, never up; the 16:9 aliases then fill and centre-crop ("outbound");
# metadata stripped; the JPEG quality of each v2 variation. They are drawn by
# the converter cjwImagine (class cjwJumperImagineImageHandler), which repeats
# Imagine's arithmetic and resampling, so sizes and pixels equal v2's: the
# ImageMagick shell gave 770 px where v2 has 769, 479 where v2 has 480, and a
# different resampling. The converter only works on aliases named cjw_*.

[AliasSettings]
AliasList[]=cjw_i30
AliasList[]=cjw_i160
AliasList[]=cjw_i320
AliasList[]=cjw_i480
AliasList[]=cjw_i770
AliasList[]=cjw_i770_16-9
AliasList[]=cjw_i900
AliasList[]=cjw_i900_16-9
AliasList[]=cjw_i1200
AliasList[]=cjw_i1200_16-9
AliasList[]=cjw_i1920

[ImageConverterSettings]
# appended: the handler takes part only in conversions of cjw_* aliases
ImageConverters[]=cjwImagine

[cjwImagine]
Name=cjwImagine
IsEnabled=true
Handler=cjwJumperImagineImageFactory

[ImageMagick]
# -strip, -quality and the outbound thumbnail of v2's Imagine filters (used by
# the cjw_* aliases up to cjw_themes_jumper 0.1.x; kept for installations that
# still define aliases with them)
Filters[]=cjw/strip=-strip
Filters[]=cjw/quality=-quality %1
Filters[]=cjw/cover=-resize %1x%2^ -gravity center -extent %1x%2

[cjw_i30]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=30
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=20

[cjw_i160]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=160
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i320]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=320
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i480]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=480
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i770]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=770
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i770_16-9]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=770
Filters[]=cjw_imagine/thumbnail_outbound=770;433
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i900]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=900
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i900_16-9]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=900
Filters[]=cjw_imagine/thumbnail_outbound=900;506
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=85

[cjw_i1200]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=1200
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=75

[cjw_i1200_16-9]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=1200
Filters[]=cjw_imagine/thumbnail_outbound=1200;675
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=75

[cjw_i1920]
Reference=
Filters[]
Filters[]=cjw_imagine/scalewidthdownonly=1920
Filters[]=cjw_imagine/strip
Filters[]=cjw_imagine/quality=75

*/ ?>
