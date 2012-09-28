<?php

/*
 * 
 * 
 */

session_start();

if (!isset($_SESSION['username'])) {
    header('Location: login.php');
    exit();
}

// define our application directory
define('phpCBS_DIR', dirname(__FILE__) . '/');

require phpCBS_DIR . 'inc/basics.php';

$cbs = new CBS($DB_CONFIG);

// set the current action
$_action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'view';

switch($_action) {
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