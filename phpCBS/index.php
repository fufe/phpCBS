<?php

/*
 * phpCBS main file serving all requests
 * 
 */

// Setting timezone to avoid php warnings.
date_default_timezone_set('Europe/Budapest');

// Starting the session
session_start();

// Checking if user already logged in
//if (!isset($_SESSION['username'])) {
//    header('Location: login.php');
//    exit();
//}

// Define our application directory
define('phpCBS_DIR', dirname(__FILE__) . '/');
//define('SMARTY_DIR', '/usr/local/lib/php/Smarty/');
define('SMARTY_DIR', phpCBS_DIR . 'classes/Smarty/');

function cbs_autoloader($class) {
    include 'classes/' . $class . '.class.php';
}

spl_autoload_register('cbs_autoloader');

require phpCBS_DIR . 'config.php';

$cbs = new cbs($DB_CONFIG);

// set the current action
$_action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'view';

switch ($_action) {
    case 'book':
        // adding a guestbook entry
        $cbs->ni('book');
        break;
    case 'listrooms':
        // adding a guestbook entry
        $cbs->ni('listrooms');
        break;
    case 'addroom':
        // adding a guestbook entry
        $cbs->ni('addroom');
        break;
    case 'editroom':
        // adding a guestbook entry
        $cbs->displayRoom(array('id' => '12'));
        break;
    case 'room_submit':
        // adding a guestbook entry
        $cbs->ni('room_submit');
        break;
    case 'view':
    default:
        // viewing the guestbook
        $cbs->displayBookings(array('FuFe'));
        break;
}