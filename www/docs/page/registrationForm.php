<?php
if ($_POST['submitted']) {
	$myAddress = new addresses();
	$myUser = new users();
	if ($sessid == $_POST['sessid']) {
		$edit = $_POST['edit'];
		$myAddress->post($edit);
		$myUser->post($edit);
		$errmsg = $myAddress->authenticate() . $myUser->authenticate() . $myUser->passwordAuthenticate();
		if ($errmsg == '') {
			$myAddress->insert();
			$myUser->address_id = $myAddress->address_id;
			if ($myUser->insert() > 0) {
				$myUser->update();
			}
			$myUser->updatePassword();
			$myUser->generateActivationKey();
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

$query = "select usertype_id, usertype from usertypes where usertype != 'superuser';";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$usertypes[$row[0]] = $row[1];
}
$smarty->assign('usertypes', $usertypes);		
?>