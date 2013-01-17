<?php

/**
 * Project: phpCBS
 * Author: FuFe
 * File: cbs.class.php
 * Version: 1.0
 */

/**
 * phpCBS application library
 *
 */
class cbs {

    // database object
    var $db = null;
    // smarty template object
    var $tpl = null;
    // error messages
    var $error = null;
    // theme path for includes
    var $themepath = null;

    /**
     * class constructor
     */
    function __construct($config = array()) {

        // instantiate the database object
        $this->db = new db_sqlsrv($config);
        $this->themepath = 'layout/themes/default/';
        // instantiate the template object
        $this->tpl = new cbs_template();
        $this->tpl->assign('themepath', $this->themepath);
    }

//    /**
//     * display the booking entry form
//     *
//     * @param array $formvars the form variables
//     */
//    function displayBookingForm($formvars = array()) {
//
//        // assign the form vars
//        $this->tpl->assign('post', $formvars);
//        // assign error message
//        $this->tpl->assign('error', $this->error);
//        $this->tpl->display('booking_form.tpl');
//    }
//
//    /**
//     * display the bookings
//     *
//     * @param array $data the booking data
//     */
//    function displayBookings($data) {
//
//        $this->tpl->assign('data', $data);
//        $this->tpl->display('bookings.tpl');
//    }
//
//    function displayRoom($data = array()) {
//        $this->tpl->assign('data', $data);
//        $this->tpl->display('editroom.tpl');
//    }

    function showITScheduleEventsList($isadmin) {
        $list = $this->db->getITScheduleEventsList();
        $this->tpl->assign('list', $list);
        $this->tpl->assign('admin', $isadmin);
        $this->tpl->display('itschedule_listevents.tpl');
    }

    function editITScheduleEvent($id) {
        $data = $this->db->getITScheduleEventDetailsById($id);
        $data["formaction"] = "Update Event";
        $this->showITScheduleEventForm($data);
    }

    function addITScheduleEvent($data = array()) {
        $data["id"] = "new";
        $data["formaction"] = "Add Event";
        $this->showITScheduleEventForm($data);
    }

    function showITScheduleEventForm($data = array()) {
        $this->tpl->assign('data', $data);
        $this->tpl->display('itschedule_editevent.tpl');
    }

    function processITScheduleEventForm($submitted) {
        if ($submitted["id"] == "new") {
            $result = $this->db->addITScheduleEvent($submitted);
            $submitted["id"] = $result;
        } else {
            $result = $this->db->updateITScheduleEvent($submitted);
        }
        if ($result)
            echo "<br>Success adding event!"; else
            echo "<br>Error adding event!";
        $result = $this->db->addITScheduleEventDates($submitted["id"], $this->addITScheduleEventDates($submitted));
        if ($result)
            echo "<br>Success adding event dates!"; else
            echo "<br>Error adding event dates!";
    }

    function addITScheduleEventDates($submitted) {
        $startDate = $submitted["datestart"];
        $endDate = $submitted["dateend"];
        $data = array();

        for ($current = $startDate; $current != $endDate; $current = date('Y-m-d', strtotime("$current +1 day"))) {
            $day["date"] = $current;
            $day["dayofweek"] = date("l", strtotime($current));
            $day["isenabled"] = (date("N", strtotime($current)) <= 5) ? 1 : (($submitted["isweekends"]) ? 1 : 0);
            $day["maxlaptops"] = $submitted["maxlaptopperday"];
            $day["maxdesktops"] = $submitted["maxdesktopperday"];
            $data[] = $day;
        }
        return $data;
    }

    function showITScheduleEventDatesForm($submitted) {
        $list = $this->db->getITScheduleEventDateListByID($submitted["id"]);
        $this->tpl->assign('list', $list);
        $this->tpl->display('itschedule_editdatelist.tpl');
    }

    function processITScheduleEventDatesForm($formdata = array()) {
        foreach ($formdata["maxlaptops"] as $key => $value) {
            $ids[] = $key;
        }
        foreach ($ids as $id) {
            $row["id"] = $id;
            if (array_key_exists($id, $formdata["isenabled"])) {
                $row["isenabled"] = "1";
            } else
                $row["isenabled"] = "0";
            $row["maxlaptops"] = $formdata["maxlaptops"]["$id"];
            $row["maxdesktops"] = $formdata["maxdesktops"]["$id"];
            $data[] = $row;
        }
        $result = $this->db->updateITScheduleEventDates($data);
        if ($result)
            echo "<br>Success updating event dates!"; else
            echo "<br>Error updating event dates!";
    }

    function showITScheduleEventDatesApplicationForm($eventid, $username) {
        $userapplications = $this->db->getITScheduleApplicationsByUsername($username);
        foreach ($userapplications as $application) {
            $event = $this->db->getITScheduleEventDateByID($application["eventdateid"]);
            $data["eventdate"] = $event["eventdate"];
            $data["eventdayofweek"] = date('l', strtotime($event["eventdate"]));
            $data["computername"] = $application["hostname_man"];
            $data["devicetype"] = $application["devicetype"];
            $data["applicationid"] = $application["id"];
            $applist[] = $data;
        }
        $datelist = $this->db->getITScheduleEventDateListByID($eventid);
        foreach ($datelist as $day) {
            $data["eventdateid"] = $day["id"];
            $data["eventdate"] = $day["eventdate"];
            $data["eventdayofweek"] = date("l", strtotime($day["eventdate"]));
            $data["isenabled"] = (bool) $day["isenabled"];
            $laptops = $this->db->getITScheduleEventDateBookingsByID($day["id"], "laptop");
            $desktops = $this->db->getITScheduleEventDateBookingsByID($day["id"], "desktop");
            $data["islaptopbookable"] = ( $day["maxlaptops"] - (count($laptops)) > 0 ) ? TRUE : FALSE;
            $data["isdesktopbookable"] = ( $day["maxdesktops"] - (count($desktops)) > 0 ) ? TRUE : FALSE;
            $list[] = $data;
        }
        $this->tpl->assign('applist', $applist);
        $this->tpl->assign('list', $list);
        $this->tpl->display('itschedule_showeventdates.tpl');
    }

    function showITScheduleUserDetailsForm($submitted = array()) {
        $data["devicetype"] = $submitted["devicetype"];
        $data["eventdateid"] = $submitted["eventdateid"];
        $this->tpl->assign('data', $data);
        $this->tpl->display('itschedule_userdetails.tpl');
    }

    function processITScheduleApplicationForm($formdata = array()) {
        $data = $formdata;
        $data["username"] = $_SESSION["username"];
        $data["hostname"] = gethostbyaddr($_SERVER["REMOTE_ADDR"]);
        $result = $this->db->addITScheduleApplication($data);
        if ($result)
            $this->showMessageRedirect("<h1>Application Successfull!", "?action=itschedule_showeventdates&id=1"); else
            echo "<h1>ERROR in booking!</h1>";
    }

    function processITScheduleApplicationDelete($formdata = array(), $username, $isitscheduleadmin) {
        $result = TRUE;
        foreach ($formdata["idstodelete"] as $id) {
            $app = $this->db->getITScheduleApplicationsById($id);
            if ($isitscheduleadmin || ($app["username"] == $username)) {
                if (!$this->db->deleteITScheduleApplicationById($id)) $result = FALSE;
            } else die("Unauthorised!");
        }
        if ($result) $this->showMessageRedirect("<h1>Application DELETED Successfully!", "?action=itschedule_showeventdates&id=1"); else echo "<h1>ERROR in application deletion!</h1>";
    }
    
    function showMessageRedirect($message, $url){
        $this->tpl->assign('message', $message);
        $this->tpl->assign('url', $url);
        $this->tpl->assign('redirect', TRUE);
        $this->tpl->display('itschedule_message.tpl');        
    }
            
    function ni($func) {
        echo('Function ' . $func . ' is not yet implemented');
    }

}
