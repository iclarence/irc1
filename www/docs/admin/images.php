<?php

require ('../init.php');

$op = isset($_GET['op']) ? $_GET['op'] : (isset($_POST['op']) ? $_POST['op'] : 'list');
$iid = is_numeric($_GET['iid']) ? $_GET['iid'] : (is_numeric($_POST['iid']) ? $_POST['iid'] : 1);
$listiid = is_numeric($_GET['listiid']) ? $_GET['listiid'] : (is_numeric($_POST['listiid']) ? $_POST['listiid'] : 0);
$submitted = is_numeric($_GET['submitted']) ? 
	($_GET['submitted'] == 1) : (is_numeric($_POST['submitted']) ? ($_POST['submitted'] == 1) : false);

$smarty->assign('op', $op);
$smarty->assign('iid', $iid);
$smarty->assign('listiid', $listiid);
$smarty->assign('langid', $_SESSION['langid']);
$smarty->assign('submitted', ($submitted ? 1 : 0));

switch ($op) {
	
	case 'del':
		$myImage = new images();
		$myImage->image_id = $iid;
		$myImage->select();
		$myImage->deleteFile();
		$myImage->deleteThumbnail();
		$myImage->delete();
		$myImage->__destruct();
		break;
		
	case 'add':
		if ($submitted) {
			$myImage = new images();
			if ($sessid == $_POST['sessid']) {
				$edit = $_POST['edit'];
				$myImage->post($edit);
				$errmsg = $myImage->authenticate();
				if ($errmsg == '') {
					$myImage->uploadFile();
					$myImage->uploadThumbnail();
					$myImage->getImageSizes();
					$myImage->insert();
					$smarty->assign('ok', 1);
				}
			}
			else {
				$errmsg = "Form submission not valid.\n";
			}
			$smarty->assign('errmsg', $errmsg);
			$smarty->assign('edit', $edit);
			$myImage->__destruct();
		}		
		break;
		
}

$thisImage = array();
$myImage = new images();
$myImage->image_id = $listiid;
$myImage->select();
$thisImage = $myImage->edit();
$myImage->__destruct();
$smarty->assign('thisImage', $thisImage);
		
$query = "select image_id from images;";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
$imageList = array();
$key = 0;
while ($row = mysql_fetch_row($result)) {
	$myImage = new images();
	$myImage->image_id = $row[0];
	$myImage->select();
	$imageList[$key] = $myImage->edit();
	$imageList[$key]['image_id'] = $row[0];
	$imageList[$key]['filepath'] = $myImage->getFilePath();
	$imageList[$key]['thumbnailpath'] = $myImage->getThumbnailPath();
	$myImage->__destruct();
	$key++;
}
$smarty->assign('imageList', $imageList);

$smarty->assign('manageImages', 1);

$smarty->display('admin/images.tpl');

?>