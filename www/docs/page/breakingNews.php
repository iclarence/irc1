<?php

$query = "select page_id from pages where newsitem = 1 and active = 1 order by unix_timestamp(newsdate) desc limit 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$mypage = new pages();
	$mypage->page_id = $row[0];
	$mypage->select();
	$breakingNews[$key] = $mypage->edit();
	if ($breakingNews[$key]['newsitem'] == 1) {
		$breakingNews[$key]['newsdate'] = date("jS F Y", convert_date($breakingNews[$key]['newsdate']));
	}
	$mypage->getImageList();
	$breakingNews[$key]['imagedetails'] = $mypage->imagedetails;
	$breakingNews[$key]['url'] = $mypage->composeUrl();	
	$mypage->__destruct();
	$key++;
}
$smarty->assign('breakingNews', $breakingNews);

?>