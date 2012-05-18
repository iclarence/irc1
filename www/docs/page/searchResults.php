<?php
if ((($_POST['searchTerm']) && ($sessid == $_POST['sessid'])) || ($_SESSION['searchTerm'])) {
	if ($_POST['searchTerm']) {
		$searchTerm = $_POST['searchTerm'];
		$searchConditions = $_POST['searchConditions'];
		$_SESSION['searchTerm'] = $searchTerm;
		$_SESSION['searchConditions'] = $searchConditions;
	}
	elseif ($_SESSION['searchTerm']) {
		$searchTerm = $_SESSION['searchTerm'];
		$searchConditions = $_SESSION['searchConditions'];
	}
	$smarty->assign('searchTerm', $searchTerm);
	$smarty->assign('searchConditions', $searchConditions);
	$query = "select page_id from pages order by parent_id, page_id;";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	$key = 0;
	$searchResults = array();
	while ($row = mysql_fetch_row($result)) {
		$mypage  = new pages();
		$mypage->page_id = $row[0];
		$mypage->select();
		$output = $mypage->searchPage($searchTerm, $searchConditions);
		if ($output) {
			$searchResults[$key]['heading'] = $mypage->heading;
			$searchResults[$key]['url'] = $mypage->composeUrl();
			$searchResults[$key]['output'] = $output;
			$key++;
		}
		$mypage->__destruct();
	}
	if ($searchResults) {
		$myPagination = new pagination();
		$myPagination->arraySize = count($searchResults);
		if ($pagenumber) {
			$myPagination->pageNumber = $pagenumber;
		}
		else {
			$myPagination->pageNumber = 1;
		}
		$myPagination->numberPerPage = 5;
		$myPagination->getPagination();
		$smarty->assign('searchPagination', $myPagination->edit());
		$smarty->assign('searchResults', $myPagination->modifyArray($searchResults));
		$myPagination->__destruct();
	}
	$smarty->assign('numberOfResults', count($searchResults));
	
}
else {
	$smarty->assign('noSearch', 1);
}
?>