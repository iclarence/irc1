<?php

$query = "select poll_id from polls where active = 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$pollList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myPoll = new polls();
	$myPoll->poll_id = $row[0];
	$myPoll->getResults();
	$pollList[$key] = $myPoll->edit();
	$pollList[$key]['poll_id'] = $row[0];
	$pollList[$key]['pollResults'] = $myPoll->getResults();
	$pollList[$key]['daysLeft'] = $myPoll->getDaysLeft();
	$pollList[$key]['pollClosed'] = $myPoll->getPollClosed();
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

?>