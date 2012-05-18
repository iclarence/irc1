<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$id = is_numeric($_GET['id']) ? $_GET['id'] : (is_numeric($_POST['id']) ? $_POST['id'] : 1);
$listid = is_numeric($_GET['listid']) ? $_GET['listid'] : (is_numeric($_POST['listid']) ? $_POST['listid'] : 0);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('id', $id);
$smarty->assign('listid', $listid);
$smarty->assign('submitted', ($submitted ? 1 : 0));

switch ($op) {
	
	case 'del':
		$myPoll = new polls();
		$myPoll->poll_id = $id;
		$myPoll->delete();
		$myPoll->__destruct();
		break;
	
	case 'act':
		$myPoll = new polls();
		$myPoll->poll_id = $id;
		$myPoll->activate();
		$myPoll->__destruct();
		break;
		
	case 'edit':
		$myPoll = new polls();
		if ($submitted) {
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['startdate'] = $_POST['startdate'];
				$edit['stopdate'] = $_POST['stopdate'];
				$myPoll->post($edit);
				$myPoll->poll_id = $id;
				$errmsg = $myPoll->authenticate();
				if ($errmsg == '') {
					$myPoll->update();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
		}
		else {
			$myPoll->poll_id = $id;
			$myPoll->select();
			$edit = $myPoll->edit();
		}
		$smarty->assign('edit', $edit);
		$myPoll->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$myPoll = new polls();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['startdate'] = $_POST['startdate'];
				$edit['stopdate'] = $_POST['stopdate'];
				$myPoll->post($edit);
				$errmsg = $myPoll->authenticate();
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
		break;
		
}

$myPoll = new polls();
$myPoll->poll_id = $listid;
$myPoll->select();
$thisPoll = $myPoll->edit();
$thisPoll['poll_id'] = $listid;
$thisPoll['pollOK'] = $myPoll->getPollOK();
$myPoll->__destruct();
$smarty->assign('thisPoll', $thisPoll);
		
$query = "select poll_id from polls;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$pollList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myPoll = new polls();
	$myPoll->poll_id = $row[0];
	$myPoll->select();
	$pollList[$key] = $myPoll->edit();
	$pollList[$key]['poll_id'] = $row[0];
	$pollList[$key]['pollClosed'] = $myPoll->getPollClosed();
	$pollList[$key]['daysLeft'] = $myPoll->getDaysLeft();
	$pollList[$key]['notYetStarted'] = $myPoll->getNotYetStarted();
	$myPoll->__destruct();
	$key++;
}
$smarty->assign('pollList', $pollList);

$ansArray = array();
for ($i = 0; $i < MAXPOLLOPTIONS; $i++) {
	$ansArray[$i] = $i + 1;
}
$smarty->assign('ansArray', $ansArray);

$smarty->assign('managePolls', 1);

$smarty->display('admin/polls.tpl');

?>