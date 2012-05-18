<?php

require ('../init.php');

$query = "select identifier from languages where language_id = " . $_SESSION['langid'] . ";";
$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
while ($row = mysql_fetch_row($result)) {
	$smarty->assign('languageIdentifier', $row[0]);
}

$smarty->assign('logoutMsg', $me->logout());
$me->__destruct();
$smarty->assign('authenticated', 0);

$smarty->assign('adminLogout', 1);

$smarty->display('admin/logout.tpl');
		
?>