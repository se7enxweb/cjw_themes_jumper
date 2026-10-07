{* The intro of an item (v2 macro content_fields.intro): teaser_intro, else full_intro, in <div class="short">.
   Nothing when both are empty. Parameter: in_node. *}
{def $ini_dm = $in_node.data_map}
{if and( is_set( $ini_dm.teaser_intro ), $ini_dm.teaser_intro.has_content )}
        <div class="short">
            {include uri='design:content/item_parts/xml.tpl' ix_attr=$ini_dm.teaser_intro}
        </div>
{elseif and( is_set( $ini_dm.full_intro ), $ini_dm.full_intro.has_content )}
        <div class="short">
            {include uri='design:content/item_parts/xml.tpl' ix_attr=$ini_dm.full_intro}
        </div>
{/if}
{undef $ini_dm}
