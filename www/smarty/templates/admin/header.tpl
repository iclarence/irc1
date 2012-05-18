<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
	<head>
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<meta name="author" content="ian@iclarence.com" />
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<link rel="stylesheet" title="Normal" type="text/css" media="screen" href="{$home}/css/admin/screen.css" />
		<title>{$sitename} Admin</title>
		<script language="JavaScript" src="{$home}/js/CalendarPopup.js"></script> 
		<script language="JavaScript">
		var cal = new CalendarPopup();
		</script>
	</head>
	
	<body>
		<div id="main">
			<div id="header">
				<h1>{$sitename}</h1>
			</div>
			{if $authenticated}
				<div id="menu">
					<ul>
						<li><a href="{$home}">Home</a></li>
						
						{if $adminHome}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/index.php">Admin Home</a></li>
						
						{if $managePages}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/pages.php">Pages</a></li>
						
						{if $manageUsers}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/users.php">Users</a></li>
						
						{if $manageCategories}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/categories.php">Categories</a></li>
						
						{if $manageEmails}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/emails.php">Emails</a></li>
						
						{if $manageImages}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/images.php">Images</a></li>
						
						{if $manageDocuments}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/documents.php">Documents</a></li>
						
						{if $managePolls}
							<li class="selected">
						{else}
							<li>
						{/if}
						<a href="{$home}/admin/polls.php">Polls</a></li>
					</ul>
				</div>
			{/if}
			
			<div id="content"></div>

			<div id="panel">