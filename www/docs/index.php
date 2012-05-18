<?php

require ('init.php');

if ($_SESSION['authenticated'] == 1) {
	$_SESSION['langid'] = $me->language_id;
	$languageIdentifier = $me->languageIdentifier;
}
else {
	$_SESSION['langid'] = (is_numeric($_SESSION['langid'])) ? $_SESSION['langid'] : 1;

	$query = "select identifier from languages where language_id = " . $_SESSION['langid'] . ";";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	while ($row = mysql_fetch_row($result)) {
		$languageIdentifier = $row[0];
	}
	
}
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('languageIdentifier', $languageIdentifier);

$qry = ($me->usertype == 'superuser') ? array(" ", " ") : array(
	", usertypes u, pageusertypes pu ", 
	"p.page_id = pu.page_id and pu.usertype_id = u.usertype_id and u.usertype = \"" . $usertype . "\" and pu.visible = 1 and "
);

$query = "select p.identifier, l.menuname ";
$query .= "from pages p, languagepages l" . $qry[0];;
$query .= "where " . $qry[1];;
$query .= "p.active = 1 and p.inmenu = 1 and p.parent_id = 0 ";
$query .= "and p.homepage = 1 and p.page_id = l.page_id and l.language_id = ";
$query .= $_SESSION['langid'] . ";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$homepageIdentifier = $row[0];
	$homepageMenuname = $row[1];
}

$breadcrumb = array();
$urlstring0 = "http://" . $_SERVER['HTTP_HOST'] . "/page/" . $languageIdentifier . "/";
$breadcrumb[] = array('menuname' => $homepageMenuname, 'url' => $urlstring0 . $homepageIdentifier);

$smarty->assign('breadcrumb', $breadcrumb);

$query = "select p.page_id, p.identifier, l.menuname, p.homepage ";
$query .= "from pages p, languagepages l" . $qry[0];;
$query .= "where " . $qry[1];;
$query .= "p.active = 1 and p.page_id = l.page_id and l.language_id = ";
$query .= $_SESSION['langid'] . " and p.parent_id = 0 and p.inmenu = 1 order by p.pageorder;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$menupages = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$menupages[$key]['page_id'] = $row[0];
	$menupages[$key]['identifier'] = stripslashes($row[1]);
	$menupages[$key]['menuname'] = stripslashes($row[2]);
	$menupages[$key]['homepage'] = stripslashes($row[3]);
	$menupages[$key]['url'] = $urlstring0 . $menupages[$key]['identifier'] . "/";
	$key++;
}
$smarty->assign('menupages', $menupages);
	
$query = "select p.page_id, p.identifier, l.menuname ";
$query .= "from pages p, languagepages l" . $qry[0];;
$query .= "where " . $qry[1];;
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

$query = ($me->usertype == 'superuser') ? 
			"select page_id from pages where parent_id = 0 and active = 1 and inmenu = 1 and homepage = 1;" : 
			"select p.page_id from pages p, usertypes u, pageusertypes pu where p.page_id = pu.page_id and pu.usertype_id = u.usertype_id and u.usertype = \"" . $usertype . "\" and pu.visible = 1 and p.parent_id = 0 and p.active = 1 and p.inmenu = 1 and p.homepage = 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$page_id = $row[0];
}

$smarty->assign('page_id', $page_id);
	
$mypage = new pages();
$mypage->page_id = $page_id;
$mypage->select();
$mypage->getImageList();
$mypage->getDocumentList();
$edit = $mypage->edit();
$smarty->assign('thispage', $edit);
$smarty->assign('pageurl', $mypage->composeUrl());
$smarty->assign('languageArray', $mypage->getLanguageArray());

$mypage->__destruct();	
	
require ('page/announcements.php');	
require ('page/breakingNews.php');
require ('page/poll.php');

$smarty->display('page/index.tpl');
