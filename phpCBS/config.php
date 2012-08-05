<?php

/**
 * Database access configuration.
 */
$DB_CONFIG=array(
    'db_engine' => 'sqlsrv',
    'db_server' => '192.168.56.2',
    'db_username' => 'sa',
    'db_password' => 'Password55',
    'db_database' => 'phpCBS',
);

/**
 * LDAP access configuration
 * Example:
 *     'domain_controllers' => array ('192.168.56.2'),      //array of the DCs in your network
 *     'account_suffix' => '@capsule.corp',                 //should be in '@fqdn' format
 *     'base_dn' => 'OU=CapsuleUsers, dc=capsule, dc=corp', //in LDAP dn form, where your users resist
 *     'admin_username' => 'phpCBS.admin',                 //a valid user in the domain
 *     'admin_password' => 'Password55',                      //password of the user
 *     'domain' => 'CAPSULE'                                //the domain's name, in full UPPERCASE form
 */
$LDAP_CONFIG=array(
    'domain_controllers' => array ('192.168.56.2'),
    'account_suffix' => '@capsule.corp',
    'base_dn' => 'OU=CapsuleUsers, dc=capsule, dc=corp',
    'admin_username' => 'phpCBS.admin',
    'admin_password' => 'Password55',
    'domain' => 'CAPSULE'
);
