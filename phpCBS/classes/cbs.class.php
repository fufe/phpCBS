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

    function showITScheduleEventsList($isadmin){
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
    
    function processITScheduleEventForm($submitted){
        if ($submitted["id"]=="new") {
            $result = $this->db->addITScheduleEvent($submitted);
            $submitted["id"] = $result;
        } else {
            $result = $this->db->updateITScheduleEvent($submitted);
        }
        if ($result) echo "<br>Success adding event!"; else echo "<br>Error adding event!";
        $result = $this->db->addITScheduleEventDates($submitted["id"], $this->addITScheduleEventDates($submitted));
        if ($result) echo "<br>Success adding event dates!"; else echo "<br>Error adding event dates!";
    }

    function addITScheduleEventDates($submitted){
        $startDate = $submitted["datestart"]; 
        $endDate = $submitted["dateend"];
        $data = array(); 

        for($current = $startDate; $current != $endDate; $current = date('Y-m-d', strtotime("$current +1 day"))) {
            $day["date"] = $current;
            $day["dayofweek"] = date("l", strtotime($current));
            $day["isenabled"] = (date("N", strtotime($current)) <= 5) ? 1 : (($submitted["isweekends"]) ? 1 : 0);
            $day["maxlaptops"] = $submitted["maxlaptopperday"];
            $day["maxdesktops"] = $submitted["maxdesktopperday"];
            $data[] = $day;
        }
        return $data;
    }
    
    function showITScheduleEventDatesForm($submitted){
        $list = $this->db->getITScheduleEventDateListByID($submitted["id"]);
        $this->tpl->assign('list', $list);
        $this->tpl->display('itschedule_editdatelist.tpl');
    }
    
    function processITScheduleEventDatesForm($formdata = array()){
        foreach ($formdata["maxlaptops"] as $key => $value) {
            $ids[] = $key;
        }
        foreach ($ids as $id) {
            $row["id"] = $id;
            if (array_key_exists($id, $formdata["isenabled"])) {
                $row["isenabled"] = "1";
            } else $row["isenabled"] = "0";
            $row["maxlaptops"] = $formdata["maxlaptops"]["$id"];
            $row["maxdesktops"] = $formdata["maxdesktops"]["$id"];
            $data[] = $row;
        }
        $result = $this->db->updateITScheduleEventDates($data);
        if ($result) echo "<br>Success updating event dates!"; else echo "<br>Error updating event dates!";
    }
    
    function ni($func) {
        echo('Function ' . $func . ' is not yet implemented');
    }

}
