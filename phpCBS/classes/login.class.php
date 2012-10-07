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

    public function __construct($config = array()) {
        $this->ldap_config = $config;
        try {
            $this->ldaph = new adLDAP($this->ldap_config);
        } catch (adLDAPException $e) {
            die($e);
        }
    }

    function authFrom_IIS_AUTHUSER($auth_user) {
        if ($auth_user != '') {
            $details = explode('\\', $auth_user);
            if ($details[0] == $this->ldap_config['domain']) {
                $userinfo = $this->ldaph->user()->infoCollection($details[1], array("*"));
                if ($userinfo) {
                    $this->userdetails['username'] = $details[1];
                    $this->userdetails['domain'] = $details[0];
                    $this->userdetails['displayname'] = $userinfo->displayname;
                }
            }
            return TRUE;
        } else
            $this->userdetails = null;
        return FALSE;
    }

    function getDetails() {
        return $this->userdetails;
    }

}
