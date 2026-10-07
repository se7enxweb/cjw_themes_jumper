<?php /* #?ini charset="utf-8"?

# Image aliases of the design "starter", read only in the siteaccesses that
# activate this extension (ActiveAccessExtensions[]=cjw_themes_jumper).
#
# They are the image variations of the Nexus v2 starter site (i30 ... i1920 and
# the 16:9 crops), under NEW names: cjw_i30 ... cjw_i1920. The installation may
# already define i160, i1920 and the like with other geometry, and an alias
# name is stored with every image it was generated for, so a name defined twice
# with different filters serves whichever version was generated first.
#
# Filters as v2 (Imagine): scale to the width, never up; the 16:9 aliases then
# fill and centre-crop to the exact size ("outbound"); metadata stripped; the
# JPEG quality of each v2 variation.

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

[ImageMagick]
# -strip, -quality and the outbound thumbnail of v2's Imagine filters
Filters[]=cjw/strip=-strip
Filters[]=cjw/quality=-quality %1
Filters[]=cjw/cover=-resize %1x%2^ -gravity center -extent %1x%2

[cjw_i30]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=30
Filters[]=cjw/strip
Filters[]=cjw/quality=20

[cjw_i160]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=160
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i320]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=320
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i480]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=480
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i770]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=770
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i770_16-9]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=770
Filters[]=cjw/cover=770;433
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i900]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=900
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i900_16-9]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=900
Filters[]=cjw/cover=900;506
Filters[]=cjw/strip
Filters[]=cjw/quality=85

[cjw_i1200]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=1200
Filters[]=cjw/strip
Filters[]=cjw/quality=75

[cjw_i1200_16-9]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=1200
Filters[]=cjw/cover=1200;675
Filters[]=cjw/strip
Filters[]=cjw/quality=75

[cjw_i1920]
Reference=
Filters[]
Filters[]=geometry/scalewidthdownonly=1920
Filters[]=cjw/strip
Filters[]=cjw/quality=75

*/ ?>
