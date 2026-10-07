{* The embed tag as v2 draws it (eZXml2Html5_core.xsl): a plain <div>, with class "object-<align>" only when the
   editor aligned the object, and its id when it has one; the embedded object in its embed view inside. *}
<div{if and( is_set( $object_parameters.align ), $object_parameters.align )} class="object-{$object_parameters.align|wash}"{/if}{if and( is_set( $object_parameters.id ), $object_parameters.id )} id="{$object_parameters.id|wash}"{/if}>
{content_view_gui view=$view link_parameters=$link_parameters object_parameters=$object_parameters content_object=$object classification=$classification}
</div>
