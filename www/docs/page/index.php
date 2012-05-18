<?php

require ('../init.php');

$query = "select language_id from languages where active = 1 and lower(identifier) = \"";
$query .= strtolower($uriRequested[0]) . "\";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
if (mysql_num_rows($result) > 0) {
	$row = mysql_fetch_row($result);
	$_SESSION['langid'] = $row[0];
	$languageIdentifier = strtolower($uriRequested[0]);
	array_splice($uriRequested, 0, 1);
}
else {
	$_SESSION['langid'] = 1;
	$languageIdentifier = "en-uk";
}

if ($_SESSION['authenticated'] == 1) {
	if ($me->usertype != 'superuser') {
		$_SESSION['langid'] = $me->language_id;
		$languageIdentifier = $me->languageIdentifier;
	}
}
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('languageIdentifier', $languageIdentifier);

$qry = ($me->usertype == 'superuser') ? array(" ", " ") : array(
	", usertypes u, pageusertypes pu ", 
	"p.page_id = pu.page_id and pu.usertype_id = u.usertype_id and u.usertype = \"" . $usertype . "\" and pu.visible = 1 and "
);

$query = "select p.identifier, l.menuname ";
$query .= "from pages p, languagepages l" . $qry[0];
$query .= "where " . $qry[1];
$query .= "p.active = 1 and p.inmenu = 1 and p.parent_id = 0 ";
$query .= "and p.homepage = 1 and p.page_id = l.page_id and l.language_id = ";
$query .= $_SESSION['langid'] . ";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$homepageIdentifier = $row[0];
	$homepageMenuname = $row[1];
}

$breadcrumb = array();
$urlstr = array();
$urlstring0 = "http://" . $_SERVER['HTTP_HOST'] . "/page/" . $languageIdentifier . "/";
$homepageBreadcrumb = array('menuname' => $homepageMenuname, 'url' => $urlstring0 . $homepageIdentifier);
$breadcrumb[] = $homepageBreadcrumb;
$urlstring = $urlstring0;
$error404 = false;
$old_page_id = 0;
foreach ($uriRequested as $key => $uriReq) {
	if (is_numeric($uriReq)) {
		$pagenumber = $uriReq;
		$smarty->assign('pagenumber', $pagenumber);
	}
	elseif (strpos($uriReq, ACTIVATIONKEY_START) !== false) {
		$actKey = $uriReq;
	}
	elseif (strpos($uriReq, UNSUBSCRIPTION_START) !== false) {
		$unsub = $uriReq;
	}
	else {
		$query = "select p.page_id, l.menuname, p.homepage ";
		$query .= "from pages p, languagepages l" . $qry[0];
		$query .= "where " . $qry[1];
		$query .= "p.active = 1 and p.page_id = l.page_id and l.language_id = ";
		$query .= $_SESSION['langid'] . " and p.parent_id = " . $old_page_id  . " and lower(p.identifier) = \"";
		$query .= strtolower($uriReq) . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if (mysql_num_rows($result) > 0) {
			$row = mysql_fetch_row($result);
			$page_id = $row[0];
			$menuname = stripslashes($row[1]);
			$homepage = stripslashes($row[2]);
			$urlstring .= strtolower($uriReq) . "/";
			$urlstr[] = $urlstring;
			if (($old_page_id > 0) || ($homepage == 0)) {
				$breadcrumb[] = array('menuname' => $menuname, 'url' => $urlstring);
			}
		}
		else {
			$error404 = true;
			break;
		}
		$old_page_id = $page_id;
	}
}
$smarty->assign('breadcrumb', $breadcrumb);

if ($error404) {
	$smarty->assign('error404', 1);
}
else {	
	$query = "select p.page_id, p.identifier, l.menuname, p.homepage ";
	$query .= "from pages p, languagepages l" . $qry[0];
	$query .= "where " . $qry[1];
	$query .= "p.active = 1 and p.page_id = l.page_id and l.language_id = ";
	$query .= $_SESSION['langid'] . " and p.parent_id = 0 and p.inmenu = 1 order by p.pageorder;";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	$menupages = array();
	$key = 0;
	while ($row = mysql_fetch_row($result)) {
		$menupages[$key]['page_id'] = $row[0];
		$menupages[$key]['identifier'] = stripslashes($row[1]);
		$menupages[$key]['menuname'] = stripslashes($row[2]);
		$menupages[$key]['url'] = $urlstring0 . $menupages[$key]['identifier'] . "/";
		$key++;
	}
	$smarty->assign('menupages', $menupages);
	
	$query = "select p.page_id, p.identifier, l.menuname ";
	$query .= "from pages p, languagepages l" . $qry[0];
	$query .= "where " . $qry[1];
	$query .= "p.active = 1 and p.page_id = l.page_id and l.language_id = ";
	$query .= $_SESSION['langid'] . " and p.parent_id = 0 and p.inusermenu = 1 order by p.pageorder;";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	$usermenupages = array();
	$key = 0;
	while ($row = mysql_fetch_row($result)) {
		$usermenupages[$key]['page_id'] = $row[0];
		$usermenupages[$key]['identifier'] = stripslashes($row[1]);
		$usermenupages[$key]['menuname'] = stripslashes($row[2]);
		$usermenupages[$key]['url'] = $urlstring0 . $usermenupages[$key]['identifier'] . "/";
		$key++;
	}
	$smarty->assign('usermenupages', $usermenupages);
	
	$query = "select p.page_id, p.identifier, l.menuname, l.heading, l.introduction, p.newsitem, unix_timestamp(p.newsdate) ";
	$query .= "from pages p, languagepages l" . $qry[0];
	$query .= "where " . $qry[1];
	$query .= "p.active = 1 and ";
	$query .= "(p.inmenu = 1 or p.newsitem = 1 or p.announcement = 1) and p.page_id = l.page_id and l.language_id = ";
	$query .= $_SESSION['langid'] . " and p.parent_id = " . $page_id  . " order by p.pageorder;";
	$smarty->assign('querysubpages', $query);
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	$subpages = array();
	$key = 0;
	while ($row = mysql_fetch_row($result)) {
		$subpages[$key]['page_id'] = $row[0];
		$subpages[$key]['identifier'] = stripslashes($row[1]);
		$subpages[$key]['menuname'] = stripslashes($row[2]);
		$subpages[$key]['heading'] = stripslashes($row[3]);
		$subpages[$key]['introduction'] = stripslashes($row[4]);
		$subpages[$key]['newsdate'] = ($row[5] == 1) ? date("jS F Y", $row[6]) : '';
		$subpages[$key]['url'] = $urlstr[count($urlstr) - 1] . $subpages[$key]['identifier'] . "/";
		
		$mypage = new pages();
		$mypage->page_id = $row[0];
		$mypage->select();
		$mypage->getImageList();
		$subpages[$key]['imagedetails'] = $mypage->imagedetails;	
		$mypage->__destruct();
		
		$key++;
	}
	
	$myPagination = new pagination();
	$myPagination->arraySize = count($subpages);
	if ($pagenumber) {
		$myPagination->pageNumber = $pagenumber;
	}
	else {
		$myPagination->pageNumber = 1;
	}
	$myPagination->numberPerPage = 5;
	$myPagination->getPagination();
	$smarty->assign('subpagePagination', $myPagination->edit());
	$smarty->assign('subpages', $myPagination->modifyArray($subpages));
	$myPagination->__destruct();	
	
	$smarty->assign('urlstr', $urlstr);
	
	$query = "select p.page_id, p.identifier, l.menuname, l.heading, l.introduction ";
	$query .= "from pages p, pages p2, languagepages l" . $qry[0];
	$query .= "where " . $qry[1];
	$query .= "p.active = 1 and (p.inmenu = 1 or p.newsitem = 1) and p2.page_id = " . $page_id;
	$query .= " and p.parent_id = p2.parent_id and p.parent_id > 0 and p.page_id = l.page_id ";
	$query .= "and l.language_id = " . $_SESSION['langid'] . " order by p.pageorder;";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	$copages = array();
	$key = 0;
	while ($row = mysql_fetch_row($result)) {
		$copages[$key]['page_id'] = $row[0];
		$copages[$key]['identifier'] = stripslashes($row[1]);
		$copages[$key]['menuname'] = stripslashes($row[2]);
		$copages[$key]['heading'] = stripslashes($row[3]);
		$copages[$key]['introduction'] = stripslashes($row[4]);
		$copages[$key]['url'] = $urlstr[count($urlstr) - 2] . $copages[$key]['identifier'] . "/";
		$key++;
	}
	$smarty->assign('copages', $copages);
	
	$smarty->assign('page_id', $page_id);
	
	$mypage = new pages();
	$mypage->page_id = $page_id;
	$mypage->select();
	$mypage->getImageList();
	$mypage->getDocumentList();
	$edit = $mypage->edit();
	if ($edit['newsitem'] == 1) {
		$edit['newsdate'] = date("jS F Y", convert_date($edit['newsdate']));
	}
	$smarty->assign('thispage', $edit);
	$smarty->assign('pageurl', $mypage->composeUrl());
	$smarty->assign('languageArray', $mypage->getLanguageArray());	
	
	$mypage->__destruct();
	
	require ('announcements.php');
	
	require ('breakingNews.php');
	
	require ('poll.php');
	
	if ($edit['identifier'] == 'searchresults') {
		require ('searchResults.php');
	}
	elseif ($edit['identifier'] == 'advsearch') {
			$smarty->assign('searchTerm', $_SESSION['searchTerm']);
			$smarty->assign('searchConditions', $_SESSION['searchConditions']);
	}
	else {
		if (isset($_SESSION['searchTerm'])) {unset($_SESSION['searchTerm']);}
		if (isset($_SESSION['searchConditions'])) {unset($_SESSION['searchConditions']);}
	}
	
	if ($edit['identifier'] == 'logout') {
		$smarty->assign('logoutMsg', $me->logout());
		$me->__destruct();
		$smarty->assign('authenticated', 0);		
	}
	
	if ($edit['identifier'] == 'contact') {
		require ('contactForm.php');	
	}
	
	if ($edit['identifier'] == 'register') {
		require ('registrationForm.php');	
	}
	
	if ($edit['identifier'] == 'updatedetails') {
		require ('updateMyDetails.php');		
	}
	
	if ($edit['identifier'] == 'newvenue') {
		require ('addNewVenue.php');	
	}
	
	if ($edit['identifier'] == 'newpoll') {
		require ('newPoll.php');	
	}
	
	if ($edit['identifier'] == 'listpolls') {
		require ('pollResults.php');	
	}
	
	if ($edit['identifier'] == 'changepassword') {
		require ('changePassword.php');	
	}
	
	if ($edit['identifier'] == 'activate') {
		$myUser = new users();
		if ($actKey) {
			$smarty->assign('activationMsg', $myUser->activationKeyActivation($actKey));
		}
		else {
			$smarty->assign('activationMsg', $myUser->activationFormActivation());
			$smarty->assign('activationKey', $_POST['activationKey']);
			$smarty->assign('email', $_POST['email']);
			
		}
		$smarty->assign('authenticated', $_SESSION['authenticated']);
		$smarty->assign('me', $myUser->edit());
		$myUser->__destruct();
	}
	
	if ($edit['identifier'] == 'unsubscribe') {
		$myUser = new users();
		if ($unsub) {
			$smarty->assign('unsubscriptionMsg', $myUser->unsubscription($unsub));
		}
		$smarty->assign('authenticated', $_SESSION['authenticated']);
		$smarty->assign('me', $myUser->edit());
		$myUser->__destruct();
	}
}

$smarty->display('page/index.tpl');

?>