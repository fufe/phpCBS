<?php

/*
 * 
 * 
 */

// define our application directory
define('phpCBS_DIR', dirname(__FILE__) . '/');

require phpCBS_DIR.'inc/basics.php';

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

$smarty->assign('name',$_SESSION['displayname']);

$smarty->display('index.tpl');