<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$cid = is_numeric($_GET['cid']) ? $_GET['cid'] : (is_numeric($_POST['cid']) ? $_POST['cid'] : 1);
$listcid = is_numeric($_GET['listcid']) ? $_GET['listcid'] : (is_numeric($_POST['listcid']) ? $_POST['listcid'] : 0);
$_SESSION['categorytype_id'] = is_numeric($_GET['categorytype_id']) ? 
	$_GET['categorytype_id'] : (is_numeric($_POST['categorytype_id']) ? $_POST['categorytype_id'] : 1);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('cid', $cid);
$smarty->assign('listcid', $listcid);
$smarty->assign('categorytype_id', $_SESSION['categorytype_id']);
$smarty->assign('submitted', ($submitted ? 1 : 0));

$ppp = array();
$pp = $listcid;
$key = 0;
$ppp[$key]['id'] = $pp;
while ($pp > 0) {
	$key++;
	$query = "select parent_id from categories where category_id = " . $pp . ";";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	while ($row = mysql_fetch_row($result)) {
		$pp = $row[0];
		$ppp[$key]['id'] = $pp;
	}
}
foreach ($ppp as $key=>$pppp) {
	$query = "select category from categories where category_id = " . $pppp['id'] . ";";
	$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	while ($row = mysql_fetch_row($result)) {
		$ppp[$key]['category'] = stripslashes($row[0]);
	}
}
$p = array_reverse($ppp);
$smarty->assign('p', $p);

switch ($op) {
	
	case 'del':
		$myCategory = new categories();
		$myCategory->category_id = $cid;
		$myCategory->delete();
		$myCategory->__destruct();
		break;
	
	case 'act':
		$myCategory = new categories();
		$myCategory->category_id = $cid;
		$myCategory->activate();
		$myCategory->__destruct();
		break;
		
	case 'edit':
		$myCategory = new categories();
		if ($submitted) {
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$myCategory->post($edit);
				$myCategory->category_id = $cid;
				$errmsg = $myCategory->authenticate();
				if ($errmsg == '') {
					$myCategory->update();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
		}
		else {
			$myCategory->category_id = $cid;
			$myCategory->select();
			$edit = $myCategory->edit();
		}
		$smarty->assign('edit', $edit);
		$myCategory->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$myCategory = new categories();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$edit['parent_id'] = $listcid;
				$edit['created'] = $_SESSION['datetimeNow'];
				$myCategory->post($edit);
				$errmsg = $myCategory->authenticate();
				if ($errmsg == '') {
					$myCategory->insert();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
			$smarty->assign('edit', $edit);
			$myCategory->__destruct();
		}		
		break;
		
}

$query = "select category from categories where category_id = " . $listcid;
$query .= " and categorytype_id = " . $_SESSION['categorytype_id'] . ";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$thisCategory['category'] = stripslashes($row[0]);
}
$smarty->assign('thisCategory', $thisCategory);
		
$query = "select category_id from categories where parent_id = " . $listcid;
$query .= " and categorytype_id = " . $_SESSION['categorytype_id'] . " order by ordering;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$categoryList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myCategory = new categories();
	$myCategory->category_id = $row[0];
	$myCategory->select();
	$categoryList[$key] = $myCategory->edit();
	$categoryList[$key]['category_id'] = $row[0];
	$myCategory->__destruct();
	$key++;
}

if (count($categoryList) > 0) {
	foreach ($categoryList as $key2=>$category) {
		$query = "select category_id from categories where parent_id = " . $category['category_id'];
		$query .= " and categorytype_id = " . $_SESSION['categorytype_id'] . " order by ordering;";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		$categoryList[$key2]['subcategories'] = mysql_num_rows($result);
	}
	$smarty->assign('categoryList', $categoryList);
}

$query = "select categorytype_id, categorytype from categorytypes where active = 1;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$categoryType[$row[0]] = $row[1];
}
$smarty->assign('categoryType', $categoryType);

$smarty->assign('manageCategories', 1);

$smarty->display('admin/categories.tpl');

?>