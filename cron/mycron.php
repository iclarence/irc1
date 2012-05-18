#!/usr/local/bin/php.cli
<?php
require ('/home/mybestho/www/sma/www/docs/init.php');
$query = "select email_id from emails where active = 1 and date_format(sent, '%d %m %Y') = \"" . date("d m Y") . "\";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$myEmail = new emails();
	$myEmail->email_id = $row[0];
			
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
}
?>