<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$did = is_numeric($_GET['did']) ? $_GET['did'] : (is_numeric($_POST['did']) ? $_POST['did'] : 1);
$listdid = is_numeric($_GET['listdid']) ? $_GET['listdid'] : (is_numeric($_POST['listdid']) ? $_POST['listdid'] : 0);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('did', $did);
$smarty->assign('listdid', $listdid);
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('submitted', ($submitted ? 1 : 0));

switch ($op) {
	
	case 'del':
		$myDocument = new documents();
		$myDocument->document_id = $did;
		$myDocument->select();
		$myDocument->deleteFile();
		$myDocument->delete();
		$myDocument->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$myDocument = new documents();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$myDocument->post($edit);
				$errmsg = $myDocument->authenticate();
				if ($errmsg == '') {
					$myDocument->uploadFile();
					$myDocument->insert();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
			$smarty->assign('edit', $edit);
			$myDocument->__destruct();
		}		
		break;
		
}

$thisDocument = array();
$myDocument = new documents();
$myDocument->document_id = $listdid;
$myDocument->select();
$thisDocument = $myDocument->edit();
$myDocument->__destruct();
$smarty->assign('thisDocument', $thisDocument);
		
$query = "select document_id from documents;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$documentList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myDocument = new documents();
	$myDocument->document_id = $row[0];
	$myDocument->select();
	$documentList[$key] = $myDocument->edit();
	$documentList[$key]['document_id'] = $row[0];
	$documentList[$key]['filepath'] = $myDocument->getFilePath();
	$myDocument->__destruct();
	$key++;
}
$smarty->assign('documentList', $documentList);

$smarty->assign('manageDocuments', 1);

$smarty->display('admin/documents.tpl');

?>