<?php

//TODO: User switching

class login {

    // LDAP object
    var $ldap_config = array();
    var $ldaph = null;
    var $username = null;
    var $displayname = null;
    var $domain = null;
    var $userdetails = array();
    var $dbconfig = array();
    var $dbh = null;

    public function __construct($config = array(), $dbconfig = array()) {
        $this->ldap_config = $config;
        try {
            $this->ldaph = new adLDAP($this->ldap_config);
        } catch (adLDAPException $e) {
            die($e);
        }

        $this->dbconfig = $dbconfig;
        try {
            $this->dbh = new db_sqlsrv($this->dbconfig);
        } catch (Exception $e) {
            die($e);
        }
    }

    function authFrom_IIS_AUTHUSER($auth_user) {
        if ($auth_user != '') {
            $details = explode('\\', $auth_user);
            if (strtoupper($details[0]) == strtoupper($this->ldap_config['domain'])) {
                $userinfo = $this->ldaph->user()->infoCollection($details[1], array("*"));
                if ($userinfo) {
                    $this->userdetails['username'] = $details[1];
                    $this->userdetails['domain'] = $details[0];
                    $this->userdetails['displayname'] = $userinfo->displayname;
                    $this->userdetails['isitscheduleadmin'] = $this->checkIfUserIsAdmin($details[1]);
                }
            } else {
                $this->userdetails = null;
                return FALSE;
            }
            return TRUE;
        } else
            $this->userdetails = null;
        return FALSE;
    }

    function getDetails() {
        return $this->userdetails;
    }

    function checkIfUserIsAdmin($username) {
        if ($userdetails = $this->dbh->getITScheduleUserDetails($username)) {
            return (bool) $userdetails["isitscheduleadmin"];
        } else
            return FALSE;
    }

}
