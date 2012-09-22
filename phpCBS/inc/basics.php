<?php

/*
 * 
 * 
 */

session_start();

require_once phpCBS_DIR . 'config.php';

require_once phpCBS_DIR . 'inc/smarty/Smarty.class.php';

$smarty = new Smarty();

$smarty->setTemplateDir(phpCBS_DIR . 'layout/templates/');
$smarty->setCompileDir(phpCBS_DIR . 'var/templates_c/');
$smarty->setConfigDir(phpCBS_DIR . 'var/configs/');
$smarty->setCacheDir(phpCBS_DIR . 'var/cache/');

date_default_timezone_set('Europe/Budapest');
