<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$pid = is_numeric($_GET['pid']) ? $_GET['pid'] : (is_numeric($_POST['pid']) ? $_POST['pid'] : 1);
$listpid = is_numeric($_GET['listpid']) ? $_GET['listpid'] : (is_numeric($_POST['listpid']) ? $_POST['listpid'] : 0);
$_SESSION['langid'] = is_numeric($_GET['langid']) ? $_GET['langid'] : (is_numeric($_POST['langid']) ? $_POST['langid'] : 1);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('pid', $pid);
$smarty->assign('listpid', $listpid);
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('submitted', ($submitted ? 1 : 0));

$ppp = array();
$pp = $listpid;
$key = 0;
$ppp[$key]['id'] = $pp;
while ($pp > 0) {
	$key++;
	$query = "select parent_id from pages where page_id = " . $pp . ";";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	while ($row = mysql_fetch_row($result)) {
		$pp = $row[0];
		$ppp[$key]['id'] = $pp;
	}
}
foreach ($ppp as $key=>$pppp) {
	$query = "select identifier from pages where page_id = " . $pppp['id'] . ";";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	while ($row = mysql_fetch_row($result)) {
		$ppp[$key]['identifier'] = stripslashes($row[0]);
	}
}
$p = array_reverse($ppp);
$smarty->assign('p', $p);

switch ($op) {
	
	case 'del':
		$mypage = new pages();
		$mypage->page_id = $pid;
		$mypage->delete();
		$mypage->__destruct();
		break;
	
	case 'act':
		$mypage = new pages();
		$mypage->page_id = $pid;
		$mypage->activate();
		$mypage->__destruct();
		break;
		
	case 'edit':
		$mypage = new pages();
		if ($submitted) {
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['newsdate'] = $_POST['newsdate'];
				$mypage->post($edit);
				$mypage->page_id = $pid;
				$errmsg = $mypage->authenticate();
				if ($errmsg == '') {
					$mypage->update();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
		}
		else {
			$mypage->page_id = $pid;
			$mypage->select();
			$edit = $mypage->edit();
		}
		$smarty->assign('edit', $edit);
		$mypage->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$mypage = new pages();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['newsdate'] = $_POST['newsdate'];
				$edit['parent_id'] = $listpid;
				$edit['created'] = $_SESSION['datetimeNow'];
				$mypage->post($edit);
				$errmsg = $mypage->authenticate();
				if ($errmsg == '') {
					$mypage->insert();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
			$smarty->assign('edit', $edit);
			$mypage->__destruct();
		}		
		break;
		
}

$query = "select identifier from pages where page_id = " . $listpid . ";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$thispage['identifier'] = stripslashes($row[0]);
}
if (mysql_num_rows($result) > 0) {
	$query = "select heading from languagepages where page_id = ";
	$query .= $listpid . " and language_id = " . $_SESSION['langid'] . ";";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	if (mysql_num_rows($result) == 0) {
		$thispage['heading'] = '';
	}
	else {
		$row = mysql_fetch_row($result);
		$thispage['heading'] = stripslashes($row[1]);
	}
}

$smarty->assign('thispage', $thispage);
		
$query = "select page_id, identifier, pageorder, active, newspage, newsitem, ";
$query .= "inmenu, inusermenu, homepage, listpage, announcement, core ";
$query .= "from pages where parent_id = " . $listpid . " order by pageorder;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$pageList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$pageList[$key]['page_id'] = $row[0];
	$pageList[$key]['identifier'] = stripslashes($row[1]);
	$pageList[$key]['pageorder'] = $row[2];
	$pageList[$key]['active'] = ($row[3] == 1) ? array("active", "deactivate") : array("inactive", "activate");
	$pageList[$key]['newspage'] = ($row[4] == 1) ? "N" : "";
	$pageList[$key]['newsitem'] = ($row[5] == 1) ? "I" : "";
	$pageList[$key]['inmenu'] = ($row[6] == 1) ? "M" : "";
	$pageList[$key]['inusermenu'] = ($row[7] == 1) ? "U" : "";
	$pageList[$key]['homepage'] = ($row[8] == 1) ? "H" : "";
	$pageList[$key]['listpage'] = ($row[9] == 1) ? "L" : "";
	$pageList[$key]['announcement'] = ($row[10] == 1) ? "A" : "";
	$pageList[$key]['core'] = $row[11];
	$pageList[$key]['composite'] = $pageList[$key]['newspage'] . $pageList[$key]['newsitem'];
	$pageList[$key]['composite'] .= $pageList[$key]['inmenu'] . $pageList[$key]['inusermenu'];
	$pageList[$key]['composite'] .= $pageList[$key]['homepage'] . $pageList[$key]['listpage'];
	$pageList[$key]['composite'] .= $pageList[$key]['announcement'];
	$query1 = "select heading from languagepages where page_id = ";
	$query1 .= $pageList[$key]['page_id'] . " and language_id = " . $_SESSION['langid'] . ";";
	$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
	if (mysql_num_rows($result1) == 0) {
		$pageList[$key]['heading'] = '';
	}
	else {
		$row1 = mysql_fetch_row($result1);
		$pageList[$key]['heading'] = stripslashes($row1[0]);
	}
	$key++;
}

if (count($pageList) > 0) {
	foreach ($pageList as $key2=>$page) {
		$query = "select page_id from pages where parent_id = " . $page['page_id'] . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		$pageList[$key2]['subpages'] = mysql_num_rows($result);
		
		$query = "select p.visible, u.abbrev from pageusertypes p, usertypes u ";
		$query .= "where p.usertype_id = u.usertype_id and p.page_id = " . $page['page_id'];
		$query .= " order by u.ordering;";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		$pageList[$key2]['whosees'] = '';
		while ($row = mysql_fetch_row($result)) {
			$pageList[$key2]['whosees'] .= ($row[0] == 1) ? $row[1] : "";
		}
		$mypage = new pages();
		$mypage->identifier = $page['identifier'];
		$pageList[$key2]['pageurl'] = $mypage->composeUrl();
		$mypage->__destruct();
	}
	$smarty->assign('pageList', $pageList);
}

$query = "select usertype_id, usertype, abbrev, description from usertypes ";
$query .= "where usertype <> \"superuser\" order by ordering;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$userTypeLegend = '<br />* LEGEND<br />';
while ($row = mysql_fetch_row($result)) {
	$userType[$row[0]] = $row[1];
	$userTypeLegend .= $row[2] . " = page visible to " . $row[3] . ", ";
}
$smarty->assign('userType', $userType);
$smarty->assign('userTypeLegend', $userTypeLegend);

$query = "select language_id, language from languages where active = 1 order by ordering;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$language[$row[0]] = $row[1];
}
$smarty->assign('language', $language);

$query = "select image_id, thumbnail from images;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$thumbnail[$row[0]] = $row[1];
}
$smarty->assign('thumbnail', $thumbnail);

$query = "select document_id, title from documents;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$doctitle[$row[0]] = $row[1];
}
$smarty->assign('doctitle', $doctitle);

$smarty->assign('managePages', 1);

$smarty->display('admin/pages.tpl');

?>