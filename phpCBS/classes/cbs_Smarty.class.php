<?php

/*
 * 
 * 
 */

//require_once phpCBS_DIR . 'config.php';
//require_once phpCBS_DIR . 'inc/smarty/Smarty.class.php';
//require_once phpCBS_DIR . 'inc/libcbs.php';

class cbs_Smarty extends Smarty {

    function __construct()
    {
        parent::__construct();

        $this->setTemplateDir(phpCBS_DIR . 'layout/templates/');
        $this->setCompileDir(phpCBS_DIR . 'var/templates_c/');
        $this->setConfigDir(phpCBS_DIR . 'var/configs/');
        $this->setCacheDir(phpCBS_DIR . 'var/cache/');

        $this->caching = Smarty::CACHING_LIFETIME_CURRENT;
        $this->assign('app_name', 'phpCBS');
    }
}
