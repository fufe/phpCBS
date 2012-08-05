<?php

/*
 * 
 * 
 */

require 'includes/basics.php';
if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

header('Content-Type: text/html; charset=utf-8');
echo("Hello " . $_SESSION['displayname']);
