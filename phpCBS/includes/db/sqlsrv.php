<?php

/*
 * 
 * 
 */

function dbInit(){
    if (isset($GLOBALS['db'])) return $GLOBALS['db'];
    global $CONFIG;
    $db=new PDO('sqlsrv:host='.$CONFIG['db_server'].';dbname='.$CONFIG['db_database'],$CONFIG['db_username'],$CONFIG['db_password']);
    $db->query('SET NAMES utf8');
    $db->num_queries=0;
    $GLOBALS['db']=$db;
    return $db;
}
?>
