<?php

/*
 * 
 * 
 */

// define our application directory
define('phpCBS_DIR', dirname(__FILE__));

require phpCBS_DIR.'/inc/basics.php';

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

header('Content-Type: text/html; charset=utf-8');
echo("Hello " . $_SESSION['displayname']);
