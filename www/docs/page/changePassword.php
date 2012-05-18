<?php
if ($_POST['submitted']) {
	$myUser = new users();
	if ($sessid == $_POST['sessid']) {
		$myUser->user_id = $me->user_id;
		$myUser->password = $_POST['password'];
		$errmsg = $myUser->passwordAuthenticate();
		if ($errmsg == '') {
			$myUser->address_id = $myAddress->address_id;
			$myUser->updatePassword();
			$smarty->assign('ok', 1);
		}
	}
	else {
		$errmsg = "Form submission not valid.\n";
	}
	$smarty->assign('errmsg', $errmsg);
	$smarty->assign('password', $myUser->password);
	$myUser->__destruct();
}
else {
	$smarty->assign('edit', $me->password);
}
?>