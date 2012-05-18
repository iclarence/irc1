<?php
if ($_POST['submitted']) {
	if ($sessid == $_POST['sessid']) {
		$myAddress = new addresses();
		$myUser = new users();
		$edit = $_POST['edit'];
		$myAddress->post($edit);
		$myUser->post($edit);
		$errmsg = $myAddress->authenticate() . $myUser->companyAuthenticate();
		if ($errmsg == '') {
			$myAddress->insert();
			$myUser->address_id = $myAddress->address_id;
			$myUser->update();
			$smarty->assign('ok', 1);
		}
		$myUser->__destruct();
		$myAddress->__destruct();
	}
	else {
		$errmsg = "Form submission not valid.\n";
	}
	$smarty->assign('errmsg', $errmsg);
	$smarty->assign('edit', $edit);
}

$query = "select country_id, country from countries;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$countries[$row[0]] = $row[1];
}
$smarty->assign('countries', $countries);
?>