<?php

/*
 * phpCBS main file serving all requests
 * 
 */

// Starting the session
session_start();

// Checking if user already logged in
//if (!isset($_SESSION['username'])) {
//    header('Location: login.php');
//    exit();
//}
//
// Define our application directory
define('phpCBS_DIR', dirname(__FILE__) . '/');
// Define SMARTY_DIR
define('SMARTY_DIR', phpCBS_DIR . 'classes/Smarty/');

function cbs_autoloader($class) {
    if ($class == "Smarty") {
        include 'classes/Smarty/Smarty.class.php';
    } elseif ($class == "adLDAP") {
        include 'classes/adLDAP/adLDAP.php';
    } elseif (strpos($class, "Smarty") === false) {
        include 'classes/' . $class . '.class.php';
    }
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
        $cbs->displayBookings('');
        break;
}