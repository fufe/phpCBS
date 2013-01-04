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

    /**
     * display the booking entry form
     *
     * @param array $formvars the form variables
     */
    function displayBookingForm($formvars = array()) {

        // assign the form vars
        $this->tpl->assign('post', $formvars);
        // assign error message
        $this->tpl->assign('error', $this->error);
        $this->tpl->display('booking_form.tpl');
    }

    /**
     * display the bookings
     *
     * @param array $data the booking data
     */
    function displayBookings($data) {

        $this->tpl->assign('data', $data);
        $this->tpl->display('bookings.tpl');
    }

    function displayRoom($data = array()) {
        $this->tpl->assign('data', $data);
        $this->tpl->display('editroom.tpl');
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
        } else {
            $result = $this->db->updateITScheduleEvent($submitted);
        }
        if ($result) echo "Success!"; else echo "Error!";
    }

    function ni($func) {
        echo('Function ' . $func . ' is not yet implemented');
    }

}
