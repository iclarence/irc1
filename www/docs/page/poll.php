<?php
// Online poll: recording a vote.
if ($_POST['voted'] == 1) {
	$myPoll = new polls();
	if ($sessid == $_POST['sessid']) {
		$myPoll->poll_id = $_POST['poll_id'];
		$myPoll->vote($_POST['vote']);
	}
	$myPoll->__destruct();
}

// Online poll: selecting the current poll.
$query = "select poll_id from polls where active = 1 and unix_timestamp(startdate) < ";
$query .= time() ." and unix_timestamp(stopdate) > " . time() . " limit 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$thisPoll = array();
if ($row = mysql_fetch_row($result)) {
	$myPoll = new polls();
	$myPoll->poll_id = $row[0];
	$myPoll->getResults();
	$thisPoll = $myPoll->edit();
	$thisPoll['poll_id'] = $row[0];
	$thisPoll['pollResults'] = $myPoll->getResults();
	$thisPoll['daysLeft'] = $myPoll->getDaysLeft();
	$thisPoll['alreadyVoted'] = $_SESSION['poll' . $row[0]];
	$myPoll->__destruct();
}
$smarty->assign('thisPoll', $thisPoll);

$ansArray = array();
for ($i = 0; $i < MAXPOLLOPTIONS; $i++) {
	$ansArray[$i] = $i + 1;
}
$smarty->assign('ansArray', $ansArray);

?>