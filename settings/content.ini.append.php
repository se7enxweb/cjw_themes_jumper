<?php /* #?ini charset="utf-8"?

# Global: read in every siteaccess, admin and the online editor included (owner decision Q23),
# so the starter content can be edited and saved anywhere without losing its custom tags.

# W5 XML tags: the custom tags of the v2 starter content (v2:
# src/AppBundle/Resources/xsl/ezxml_tags.xsl), drawn by
# design/starter/templates/content/datatype/view/ezxmltags/<name>.tpl.
# The two folding sections hold paragraphs, so they are block tags.


[CustomTagSettings]
AvailableCustomTags[]=trennlinie
AvailableCustomTags[]=Umfliessen_beenden
AvailableCustomTags[]=Ausklappbarer_Abschnitt_mobil
AvailableCustomTags[]=Ausklappbarer_Textabschnitt
AvailableCustomTags[]=Zeilenumbruch_erzwingen
IsInline[Zeilenumbruch_erzwingen]=true

# The table class of the v2 content (the date tables of the event pages). The kernel's output handler
# drops an element whose class is not allowed, so without it those tables vanish.
[table]
AvailableClasses[]=table-striped

[Ausklappbarer_Abschnitt_mobil]
CustomAttributes[]
CustomAttributes[]=Name

[Ausklappbarer_Textabschnitt]
CustomAttributes[]
CustomAttributes[]=Name

*/ ?>
