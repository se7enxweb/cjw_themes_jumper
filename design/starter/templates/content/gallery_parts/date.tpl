{* The publish date as v2 prints it in slides and galleries (Twig date 'j. n. Y.'). Input: $gp_dm (data map). *}
{if and( is_set( $gp_dm.publish_date ), $gp_dm.publish_date.has_content )}{$gp_dm.publish_date.content.timestamp|datetime( 'custom', '%j. %n. %Y.' )}{/if}
