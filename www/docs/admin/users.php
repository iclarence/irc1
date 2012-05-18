<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$uid = is_numeric($_GET['uid']) ? $_GET['uid'] : (is_numeric($_POST['uid']) ? $_POST['uid'] : 1);
$listuid = is_numeric($_GET['listuid']) ? $_GET['listuid'] : (is_numeric($_POST['listuid']) ? $_POST['listuid'] : 0);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('uid', $uid);
$smarty->assign('listuid', $listuid);
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('submitted', ($submitted ? 1 : 0));

switch ($op) {
	
	case 'pwd':
		$myUser = new users();
		$myUser->user_id = $uid;
		$myUser->newpassword();
		$myUser->__destruct();
		break;
	
	case 'del':
		$myUser = new users();
		$myUser->user_id = $uid;
		$myUser->delete();
		$myUser->__destruct();
		break;
	
	case 'act':
		$myUser = new users();
		$myUser->user_id = $uid;
		$myUser->activate();
		$myUser->__destruct();
		break;
		
	case 'edit':
		$myAddress = new addresses();
		$myUser = new users();
		if ($submitted) {
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$myAddress->post($edit);
				$myUser->post($edit);
				$errmsg = $myAddress->authenticate() . $myUser->authenticate();
				$myUser->user_id = $uid;
				if ($errmsg == '') {
					$myAddress->insert();
					$myUser->address_id = $myAddress->address_id;					
					$myUser->update();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
		}
		else {
			$myUser->user_id = $uid;
			$myUser->select();
			$myAddress->address_id = $myUser->address_id;
			$myAddress->select();
			$edit = array_merge($myUser->edit(), $myAddress->edit());
		}
		$smarty->assign('edit', $edit);
		$myUser->__destruct();
		$myAddress->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$myAddress = new addresses();
			$myUser = new users();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$myAddress->post($edit);
				$myUser->post($edit);
				$errmsg = $myAddress->authenticate() . $myUser->authenticate();
				if ($errmsg == '') {
					$myAddress->insert();
					$myUser->address_id = $myAddress->address_id;
					$myUser->insert();
					// $myUser->newpassword();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
			$smarty->assign('edit', $edit);
			$myUser->__destruct();
			$myAddress->__destruct();
		}		
		break;
		
}

$thisUser = array();
$myAddress = new addresses();
$myUser = new users();
$myUser->user_id = $listuid;
$myUser->select();
$myAddress->address_id = $myUser->address_id;
$myAddress->select();
$thisUser = array_merge($myUser->edit(), $myAddress->edit());
$myUser->__destruct();
$myAddress->__destruct();
$smarty->assign('thisUser', $thisUser);
		
$query = ($me->usertype == 'superuser') ? "select user_id from users order by lastname, firstname, username;" : 
	"select u.user_id from users u, usertypes t where u.usertype_id = t.usertype_id and t.usertype != 'superuser' order by u.lastname, u.firstname, u.username;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$userList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myUser = new users();
	$myUser->user_id = $row[0];
	$myUser->select();
	$userList[$key] = $myUser->edit();
	$userList[$key]['user_id'] = $row[0];
	$myUser->__destruct();
	$key++;
}

foreach ($userList as $key => $user) {
	$query = "select user_id, max(unix_timestamp(changed)) from passwordchanges where user_id = ";
	$query .= $user['user_id'] . " group by user_id;";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	while ($row = mysql_fetch_row($result)) {
		$userList[$key]['lastPwdChange'] = date("d/m/Y G:i:s", $row[1]);
	}
}
/*
$myPagination = new pagination();
$myPagination->arraySize = count($userList);
if ($_GET['pageno']) {
	$myPagination->pageNumber = $_GET['pageno'];
}
else {
	$myPagination->pageNumber = 1;
}
$myPagination->numberPerPage = 20;
$myPagination->getPagination();
$smarty->assign('userPagination', $myPagination->edit());
$smarty->assign('userList', $myPagination->modifyArray($userList));
$myPagination->__destruct();
*/
$smarty->assign('userList', $userList);

$query = "select country_id, country from countries;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$countries[$row[0]] = $row[1];
}
$smarty->assign('countries', $countries);

$query = "select language_id, language from languages where active = 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$languages[$row[0]] = $row[1];
}
$smarty->assign('languages', $languages);

$query = "select timezone_id, timezone from timezones;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$timezones[$row[0]] = $row[1];
}
$smarty->assign('timezones', $timezones);

$query = "select alias_id, alias from aliases where active = 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$aliases[$row[0]] = $row[1];
}
$smarty->assign('aliases', $aliases);

$query = "select usertype_id, usertype from usertypes";
$query .= ($me->usertype != 'superuser') ? " where usertype != 'superuser' and usertype != 'anonymous';" : ";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$usertypes[$row[0]] = $row[1];
}
$smarty->assign('usertypes', $usertypes);

$smarty->assign('manageUsers', 1);

$smarty->display('admin/users.tpl');

?>