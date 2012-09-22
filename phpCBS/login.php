<?php
//TODO: User switching

// define our application directory
define('phpCBS_DIR', dirname(__FILE__) . '/');

require phpCBS_DIR . 'inc/adLDAP/adLDAP.php';
require phpCBS_DIR . 'config.php';

session_start();

if ($_SERVER['AUTH_USER']) {
    $userdetails = explode('\\', $_SERVER['AUTH_USER']);
    if ($userdetails[0] == $LDAP_CONFIG['domain']) {
        try {
            $adldap = new adLDAP($LDAP_CONFIG);
        }
        catch (adLDAPException $e) {
            die($e);
        }
        $userinfo = $adldap->user()->infoCollection($userdetails[1], array("*"));
        if ($userinfo) {
            $_SESSION['username'] = $userdetails[1];
            $_SESSION['displayname'] = $userinfo->displayname;
            header('Location: index.php');
        }
    }
}