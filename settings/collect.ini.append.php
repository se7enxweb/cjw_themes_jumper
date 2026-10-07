<?php /* #?ini charset="utf-8"?

# Information collection of the design "starter": the feedback forms of the
# Nexus v2 starter site (cjw_feedback_form, the contact form, and
# ng_feedback_form). Read only in the siteaccesses that activate this
# extension. v2 collected them with NetgenInformationCollectionBundle (actions
# "database" and "email"); here the information collector of the kernel does
# the same: every submission is stored, and a mail goes to the form's
# recipient field.
#
# Templates by type (the type is the class identifier):
#   content/collectedinfo/<class>.tpl      the thank-you page (the form's
#                                          success text, v2's "success" block)
#   content/collectedinfomail/<class>.tpl  the mail (v2's info_collection/email)
# The mail's receiver is the object's recipient field; without one the
# collector uses [InformationCollectionSettings] EmailReceiver of site.ini,
# then [MailSettings] AdminEmail. How the mail is sent is the installation's
# [MailSettings] Transport.

[InfoSettings]
TypeList[cjw_feedback_form]=cjw_feedback_form
TypeList[ng_feedback_form]=ng_feedback_form

[EmailSettings]
SendEmailList[cjw_feedback_form]=enabled
SendEmailList[ng_feedback_form]=enabled

[DisplaySettings]
# result: after a successful submission the collector shows the thank-you
# page (content/collectedinfo/<type>.tpl)
DisplayList[cjw_feedback_form]=result
DisplayList[ng_feedback_form]=result

[CollectionSettings]
# anyone may send a form, as often as they like (v2 behaved the same)
CollectAnonymousDataList[cjw_feedback_form]=enabled
CollectAnonymousDataList[ng_feedback_form]=enabled
CollectionUserDataList[cjw_feedback_form]=multiple
CollectionUserDataList[ng_feedback_form]=multiple

*/ ?>
