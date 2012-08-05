<?php

/*
 * 
 * 
 */

require("config.php");
require("includes/adLDAP/adLDAP.php");

header('Content-Type: text/html; charset=utf-8');

try {
    $adldap = new adLDAP($LDAP_CONFIG);
}
catch (adLDAPException $e) {
    echo $e;
    exit();   
}

//var_dump($adldap->user()->info("ferenc.biczi", array("*")));


$results = $adldap->user()->find(true, "cn", "*m*");

var_dump($results);
?>
