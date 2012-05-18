<?php

$query = "select page_id from pages where announcement = 1 and active = 1 order by unix_timestamp(newsdate);";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$mypage = new pages();
	$mypage->page_id = $row[0];
	$mypage->select();
	$announcements[$key] = $mypage->edit();
	if ($announcements[$key]['newsitem'] == 1) {
		$announcements[$key]['newsdate'] = date("jS F Y", convert_date($announcements[$key]['newsdate']));
	}
	$mypage->getImageList();
	$announcements[$key]['imagedetails'] = $mypage->imagedetails;
	$announcements[$key]['url'] = $mypage->composeUrl();	
	$mypage->__destruct();
	$key++;
}
$smarty->assign('announcements', $announcements);

?>