<?php

session_start();
$sessid = session_id();

$realpath = realpath('.');
if (strpos($realpath, "www/docs") == true) {
	$pathArray = explode('www/docs', $realpath);
}
elseif (strpos($realpath, "cron") == true) {
	$pathArray = explode('cron', $realpath);
}
$_SESSION['basepath'] = $pathArray[0];

require_once('constants.php');

require($_SESSION['basepath'] . 'lib/Smarty/Smarty.class.php');
$smarty = new Smarty();

$smarty->template_dir = $_SESSION['basepath'] . 'www/smarty/templates';
$smarty->compile_dir = $_SESSION['basepath'] . 'www/smarty/templates_c';
$smarty->cache_dir = $_SESSION['basepath'] . 'www/smarty/cache';
$smarty->config_dir = $_SESSION['basepath'] . 'www/smarty/configs';

$smarty->assign('sessid', $sessid);
$smarty->assign('sitename', SITENAME);
$smarty->assign('sitedescription', SITEDESCRIPTION);

require_once($_SESSION['basepath'] . 'lib/functions/library.php');

function __autoload($class_name) {
    require_once($_SESSION['basepath'] . 'lib/classes/' . $class_name . '.php');
}
$dbparams = explode(',', DBSTRING);
$_SESSION['link'] = mysql_connect($dbparams[0], $dbparams[1], $dbparams[2]) 
	or die ("Could not connect to database server");
$result = mysql_select_db($dbparams[3], $_SESSION['link']) 
	or die ("Could not find database");
	
$me = new users();
$me->startup();

if ($_POST['loginSubmitted']) {
	$smarty->assign('loginMsg', $me->login());
}

if ($_POST['subscribeSubmitted']) {
	$smarty->assign('name', $_POST['name']);
	$smarty->assign('email', $_POST['email']);
	$smarty->assign('subscribeMsg', $me->subscribe());
}

if ($_POST['forgottenSubmitted'] == 1) {
	$smarty->assign('forgottenMsg', $me->forgottenPassword());
	$smarty->assign('email', $_POST['email']);
	$smarty->assign('confirm', $_POST['confirm']);
}

if ($_SESSION['authenticated'] == 1) {
	$mine = new addresses();
	$mine->address_id = $me->address_id;
	$mine->select();
	$myself = array_merge(array('user_id' => $me->user_id), $me->edit(), $mine->edit());
	$smarty->assign('me', $myself);
	$usertype = $me->usertype;
}

if (!$_SESSION['authenticated']) {
	$me->__destruct();
	$usertype = 'anonymous';
}

$smarty->assign('authenticated', $_SESSION['authenticated']);

if ($_COOKIE['myLogin']) {
	$myLoginDetails = explode(',', $_COOKIE['myLogin']);
}

$_SESSION['datetimeNow'] = date("Y/m/d H:i:s");

$uriRequested = $_SERVER['REQUEST_URI'];
$scriptName = $_SERVER['SCRIPT_NAME'];
$uriRequested = substr($uriRequested, strrpos($scriptName, '/') + 1);
while(substr($uriRequested, -1) == '/') {
	$uriRequested = substr($uriRequested, 0, -1);
}
$uriRequested = explode('/', $uriRequested);
foreach($uriRequested as $key => $uriReq) {
	if($uriReq == '') {
		array_splice($uriRequested, $key, 1);
	}
}

if ($myLoginDetails[1]) {
	$smarty->assign('myLoginDetails', $myLoginDetails);
}
$smarty->assign('keepMeLoggedIn', $_SESSION['keepMeLoggedIn']);
$smarty->assign('rememberMe', $_SESSION['rememberMe']);
$smarty->assign('url', "http://" . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF']);
$smarty->assign('home', "http://" . $_SERVER['HTTP_HOST']);
$smarty->assign('host', $_SERVER['HTTP_HOST']);
$smarty->assign('thisyear', date("Y"));
$smarty->assign('todaysdate', date("l, jS F Y"));
$smarty->assign('timenow', date("g:ia"));
$smarty->assign('popupdate', date("Y/m/d"));
$smarty->assign('imagewidth', IMAGEWIDTH);
$smarty->assign('imageheight', IMAGEHEIGHT);
$smarty->assign('thumbnailwidth', THUMBNAILWIDTH);
$smarty->assign('thumbnailheight', THUMBNAILHEIGHT);

?>