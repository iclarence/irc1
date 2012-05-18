<?php
if ($_POST['submitted']) {
	$myPoll = new polls();
	if ($sessid == $_POST['sessid']) {
		$edit = $_POST['edit'];
		$myPoll->post($edit);
		$errmsg = $myPoll->userAuthenticate();
		if ($errmsg == '') {
			$myPoll->insert();
			$smarty->assign('ok', 1);
		}
	}
	else {
		$errmsg = "Form submission not valid.\n";
	}
	$smarty->assign('errmsg', $errmsg);
	$smarty->assign('edit', $edit);
	$myPoll->__destruct();
}

$ansArray = array();
for ($i = 0; $i < MAXPOLLOPTIONS; $i++) {
	$ansArray[$i] = $i + 1;
}
$smarty->assign('ansArray', $ansArray);

?>
