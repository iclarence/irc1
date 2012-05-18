<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$eid = is_numeric($_GET['eid']) ? $_GET['eid'] : (is_numeric($_POST['eid']) ? $_POST['eid'] : 1);
$listeid = is_numeric($_GET['listeid']) ? $_GET['listeid'] : (is_numeric($_POST['listeid']) ? $_POST['listeid'] : 0);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('eid', $eid);
$smarty->assign('listeid', $listeid);
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('submitted', ($submitted ? 1 : 0));

switch ($op) {
	
	case 'send':
		$myEmail = new emails();
		$myEmail->email_id = $eid;		
		if (count($myEmail->composeEmailList()) > 0) {
			foreach ($myEmail->emailList as $key => $uid) {
						
				$myUser = new users();
				$myUser->user_id = $uid;
				$myUser->select();
				
				$headers = "From: " . ADMINEMAIL;
				$headers .= "\r\nReply-To: " . ADMINEMAIL;
				
				if ($myUser->receivehtml == 0) {
					$headers .= "\r\nContent-Type: text/plain; charset=\"iso-8859-1\"";
					$headers .= "\r\nX-Mailer: PHP/" . phpversion();
					$message = "Dear " . $myUser->firstname . " " . $myUser->lastname . ",\n\n";
					$message .= $myEmail->emailbody . "\n\nKind regards,\n" . SITENAME . "\n";
				}
				elseif ($myUser->receivehtml == 1) {				
					$edit = array_merge($myUser->edit(), $myEmail->edit());
					$smarty->assign('edit', $edit);
					$headers .= "\r\nContent-Type: text/html; charset=\"iso-8859-1\"";
					$headers .= "\r\nX-Mailer: PHP/" . phpversion();
					$message = $smarty->fetch('email/email.tpl');
				}
				
				if (mail($myUser->email, $myEmail->subject, $message, $headers)) {
					$query = "insert into emaillog (email_id, user_id, sent) values (";
					$query .= "\"" . $myEmail->email_id . "\", ";
					$query .= "\"" . $uid . "\", ";
					$query .= "\"" . $_SESSION['datetimeNow'] . "\");";
					$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
				}
				
				$myUser->__destruct();
				
			}
		}
		$myEmail->activate();
		$myEmail->__destruct();
		break;
	
	case 'del':
		$myEmail = new emails();
		$myEmail->email_id = $eid;
		$myEmail->delete();
		$myEmail->__destruct();
		break;
	
	case 'act':
		$myEmail = new emails();
		$myEmail->email_id = $eid;
		$myEmail->activate();
		$myEmail->__destruct();
		break;
		
	case 'edit':
		$myEmail = new emails();
		if ($submitted) {
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['sent'] = $_POST['sent'];
				$myEmail->post($edit);
				$errmsg = $myEmail->authenticate();
				$myEmail->email_id = $eid;
				if ($errmsg == '') {				
					$myEmail->update();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
		}
		else {
			$myEmail->email_id = $eid;
			$myEmail->select();
			$edit = array_merge($myEmail->edit());
		}
		$smarty->assign('edit', $edit);
		$myEmail->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$myEmail = new emails();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['sent'] = $_POST['sent'];
				$myEmail->post($edit);
				$errmsg = $myEmail->authenticate();
				if ($errmsg == '') {
					$myEmail->insert();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
			$smarty->assign('edit', $edit);
			$myEmail->__destruct();
		}		
		break;
		
}

$thisEmail = array();
$myEmail = new emails();
$myEmail->email_id = $listeid;
$myEmail->select();
$thisEmail = array_merge($myEmail->edit());
$myEmail->__destruct();
$smarty->assign('thisEmail', $thisEmail);
		
$query = "select email_id from emails order by unix_timestamp(created) desc;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$emailList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myEmail = new emails();
	$myEmail->email_id = $row[0];
	$myEmail->select();
	$emailList[$key] = $myEmail->edit();
	$emailList[$key]['email_id'] = $row[0];
	$myEmail->__destruct();
	$key++;
}
$smarty->assign('emailList', $emailList);

$query = "select alias_id, alias from aliases where active = 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$aliases[$row[0]] = $row[1];
}
$smarty->assign('aliases', $aliases);

$query = "select usertype_id, usertype from usertypes";
$query .= " where usertype != 'superuser' and usertype != 'anonymous';";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$usertypes[$row[0]] = $row[1];
}
$smarty->assign('usertypes', $usertypes);

$smarty->assign('manageEmails', 1);

$smarty->display('admin/emails.tpl');

?>