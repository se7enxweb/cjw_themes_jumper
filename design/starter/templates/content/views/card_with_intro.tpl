{* Item view "card_with_intro": the card (content/views/card.tpl) with the intro, as standard_with_intro does it
   for standard. The view type name stays in the markup. Parameters: node, view_type. *}
{include uri='design:content/views/card.tpl' node=$node view_type=first_set( $view_type, 'card_with_intro' ) with_intro=true()}
