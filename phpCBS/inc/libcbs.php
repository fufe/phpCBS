<?php

/**
 * Project: phpCBS
 * Author: FuFe
 * File: libcbs.php
 * Version: 1.0
 */

/**
 * phpCBS application library
 *
 */
class CBS {

    // database object
    var $pdo = null;
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

        // instantiate the pdo object
        try {
            $dsn = "{$config['db_engine']}:server={$config['db_server']};database={$config['db_database']}";
            $this->pdo = new PDO($dsn, $config['db_username'], $config['db_password']);
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage();
            die();
        }
        $this->themepath = 'layout/themes/default/';
        // instantiate the template object
        $this->tpl = new CBS_Smarty;
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
    function displayBookings($data = array()) {

        $this->tpl->assign('data', $data);
        $this->tpl->display('bookings.tpl');
    }

    function displayRoom($data = array()) {
        $this->tpl->assign('data', $data);
        $this->tpl->display('editroom.tpl');
    }

    function ni($func) {
        echo('Function ' . $func . ' not yet implemented');
    }

}
