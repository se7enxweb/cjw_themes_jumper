{* The page after a successful submission of a cjw_feedback_form (collect.ini [InfoSettings] TypeList): the full view
   with v2's "success" block (the success text of the object, else the default thank-you) in place of the form. *}
{set-block scope=global variable=title}{$node.name|wash}{/set-block}
{include uri='design:content/full/cjw_feedback_form.tpl' node=$node part='content' success=true()}
