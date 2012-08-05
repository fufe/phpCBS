<?php
//TODO: User switching

require 'includes/basics.php';
require 'includes/adLDAP/adLDAP.php';
//
//if ($_REQUEST['action']=="logoff") {
//    unset($_SESSION['username']);
//} else if ($_REQUEST['action']=="change_user") {
//    unset($_SESSION['username']);
//} else {
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
//}

