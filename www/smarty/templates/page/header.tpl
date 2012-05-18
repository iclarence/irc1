<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
{if $error404}
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="author" content="ian@iclarence.com / Original design: Andreas Viklund - http://andreasviklund.com/">
	<title>404 Not Found</title>
{else}
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="robots" content="index, follow" />
	<meta name="keywords" content="{$thispage.keywords}" />
	<meta name="description" content="{$thispage.description}" />
	<meta name="author" content="ian@iclarence.com / Original design: Andreas Viklund - http://andreasviklund.com/" />
	<title>{$thispage.title}</title>	
{/if}
<style type="text/css">@import url({$home}/css/andreas04.css);</style>

<script language="JavaScript" src="{$home}/js/imageFader.js"></script>
<script language="JavaScript" src="{$home}/js/tickerFader.js"></script>

</head>
<body onLoad="begin()">
	{literal}
	<script language="JavaScript">
	function Mailit(form) {
document.location.href=("mailto:" + form.address.value + "?subject=A web page to see&body=I found this web page at " + document.location.href + ", which I thought you might like to see.")
return false
} 
	</script>
	{/literal}
	

<div id="container">
<div id="sitetitle">
<h1><a href="{$home}">{$sitename}</a></h1>
<h2>{$sitedescription}</h2>
</div>

<div id="menu">
	{include file='page/topNavigation.tpl'}
</div>

<div id="content">
<div id="left">
	{include file='page/ticker.tpl'}
	{include file='page/breadcrumb.tpl'}