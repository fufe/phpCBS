<?php

/*
 * phpCBS main file serving all requests
 * 
 */

// Define our application directory
define('phpCBS_DIR', dirname(__FILE__) . '/');
// Define SMARTY_DIR
define('SMARTY_DIR', phpCBS_DIR . 'classes/Smarty/');

// Loading configuration
require phpCBS_DIR . 'config.php';

// Class autoloader function
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

// Starting the session
session_start();

// Checking if user already logged in
if (!isset($_SESSION['username'])) {
    $loginh = new login($LDAP_CONFIG, $DB_CONFIG);
     if ($loginh->authFrom_IIS_AUTHUSER($_SERVER['AUTH_USER'])) {
         $_SESSION = array_merge($_SESSION, $loginh->getDetails());
     } else die('Unknown user');    
}

// Instanciating main class.
$cbs = new cbs($DB_CONFIG);

// set the current action
$_action = isset($_REQUEST['action']) ? $_REQUEST['action'] : 'view';

switch ($_action) {
//    case 'book':
//// adding a guestbook entry
//        $cbs->ni('book');
//        break;
//    case 'listrooms':
//// adding a guestbook entry
//        $cbs->ni('listrooms');
//        break;
//    case 'addroom':
//// adding a guestbook entry
//        $cbs->ni('addroom');
//        break;
//    case 'editroom':
//// adding a guestbook entry
//        $cbs->displayRoom(array('id' => '12'));
//        break;
//    case 'room_submit':
//// adding a guestbook entry
//        $cbs->ni('room_submit');
//        break;
    
    case 'itschedule_listevents':
        $cbs->showITScheduleEventsList($_SESSION["isitscheduleadmin"]);
        break;
    case 'itschedule_addevent':
        if ($_SESSION["isitscheduleadmin"]){
            $cbs->addITScheduleEvent($_REQUEST);
        } else die("Unauthorised");        
        break;
    case 'itschedule_editevent':
        if ($_SESSION["isitscheduleadmin"]){
            $cbs->editITScheduleEvent($_REQUEST["id"]);
        } else die("Unauthorised");        
        break;
    case 'itschedule_editevent_submit':
        if ($_SESSION["isitscheduleadmin"]){
            $cbs->processITScheduleEventForm($_REQUEST);
        } else die("Unauthorised");        
        break;
    case 'itschedule_editeventdates':
        if ($_SESSION["isitscheduleadmin"]){
            $cbs->showITScheduleEventDatesForm($_REQUEST);
        } else die("Unauthorised");  
        break;       
    case 'itschedule_editeventdates_submit':
        if ($_SESSION["isitscheduleadmin"]){
            $cbs->processITScheduleEventDatesForm($_REQUEST);
        } else die("Unauthorised");  
        break;    
    case 'itschedule_showeventdates':
        $cbs->showITScheduleEventDatesApplicationForm($_REQUEST["id"]);
        break;    
    case 'itschedule_showuserdetailsform':
        $cbs->showITScheduleUserDetailsForm($_REQUEST);
        break;    
    case 'itschedule_application_submit':
        $cbs->processITScheduleApplicationForm($_REQUEST);
        break;

    case 'view':
    default:
// viewing the guestbook
        $cbs->showITScheduleEventsList($_SESSION["isitscheduleadmin"]);
        break;
}
