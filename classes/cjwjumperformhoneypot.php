<?php
/**
 * The honeypot of the feedback forms of the design starter (spam protection, together with the form token of
 * ezformtoken).
 *
 * Every form drawn by design/starter/templates/content/form/form.tpl carries a text field named CjwFormWebsite
 * that no person sees or fills in. A submission to the information collector (POST ActionCollectInformation)
 * with that field filled in comes from a program: it is dropped before the collector runs, so nothing is stored
 * and no mail is sent. The request then ends as a content/action without an action (the kernel's "not
 * available" page), which tells the program nothing about why.
 *
 * Attached in the access-only site.ini of the extension:
 *   [Event] Listeners[]=request/input@cjwJumperFormHoneypot::input
 * so it runs only in the siteaccesses that use the design.
 *
 * @copyright Copyright (C) 2026 7x and the Exponential Foundation. All rights reserved.
 * @license GNU General Public License v2.0 (or any later version)
 * @package cjw_themes_jumper
 */
class cjwJumperFormHoneypot
{
    /** The name of the honeypot field in the forms */
    const FIELD = 'CjwFormWebsite';

    /**
     * request/input listener: drops a collector submission whose honeypot is filled in.
     *
     * @param mixed $uri the request's eZURI (unused)
     * @return bool true when a submission was dropped
     */
    public static function input( $uri = null )
    {
        if ( !isset( $_POST['ActionCollectInformation'] ) || !self::isFilled( $_POST ) )
        {
            return false;
        }
        foreach ( array_keys( $_POST ) as $name )
        {
            if ( $name === 'ActionCollectInformation' || strpos( (string)$name, 'ContentObjectAttribute' ) === 0 )
            {
                unset( $_POST[$name] );
            }
        }
        eZDebug::writeNotice( 'A feedback form submission with the honeypot field filled in was dropped', __METHOD__ );
        return true;
    }

    /**
     * @param array $post the POST variables
     * @return bool whether the honeypot field holds anything
     */
    public static function isFilled( array $post )
    {
        return isset( $post[self::FIELD] ) && is_string( $post[self::FIELD] ) && trim( $post[self::FIELD] ) !== '';
    }
}
