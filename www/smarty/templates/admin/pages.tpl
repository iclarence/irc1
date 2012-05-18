{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

{include file='admin/header.tpl'}		

<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> -> <a href="{$url}">Manage pages</a>
{foreach from=$p key=key item=pitem}
	-> <a href="{$url}?listpid={$pitem.id}&amp;op=list&amp;langid={$langid}">
	{if $pitem.id == 0}
		Top Level Pages</a>
	{else}
		Subpages of {$pitem.identifier}</a>
	{/if}
{/foreach}
</p>
<br />

<table width="1000" border="0" cellspacing="5" cellpadding="0">

<tr>
<td>

<form name="dummyForm" action="{$url}" method="post">
<select name="dummy" onchange="location.href=this.options[this.selectedIndex].value">
{foreach from=$language key=key item=lang}
	<option 
	{if $langid == $key}
		selected = "selected"
	{/if}
	value="{$url}?listpid={$listpid}&amp;pid={$pid}&amp;op={$op}&amp;langid={$key}">{$lang}</option>
{/foreach}
</select>
</form>

</td>
</tr>

</table>
<br />

{if $ok}
	<script language="JavaScript">
	<!--
	window.location="{$url}?listpid={$listpid}&op=list&langid={$langid}";
	//-->
	</script>
{/if}

{if $op == 'edit' or $op == 'add' or $errmsg}

	{if $op == 'edit'}
		<h1>Editing Content of "{$edit.identifier}"</h1>
	{elseif $op == 'add'}
		{if $thispage}
			<h1>New Page: Subpage of {$thispage.identifier}</h1>
		{else}
			<h1>New Top Level Page</h1>
		{/if}
	{/if}

	{if $errmsg}
		<p>{$errmsg}</p>
	{/if}
	
	<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
	
		
	<form name="myForm" action="{$url}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="op" id="op" value="{$op}" />
	<input type="hidden" name="pid" id="pid" value="{$pid}" />
	<input type="hidden" name="listpid" id="listpid" value="{$listpid}" />
	<input type="hidden" name="langid" id="langid" value="{$langid}" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
		
	<tr>
	<td>
	<label for="identifier">Identifier *</label>
	</td>
	<td>
	<input type="text" name="edit[identifier]" id="identifier" value="{$edit.identifier}" size="90" maxlength="100" tabindex="" />
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="title">Title</label>
	<td>
	<input type="text" name="edit[title]" id="title" value="{$edit.title}" size="90" maxlength="100" tabindex="" />
	</tr>
	
	<tr>
	<td>
	<label for="menuname">Menu Name</label>
	</td>
	<td>
	<input type="text" name="edit[menuname]" id="menuname" value="{$edit.menuname}" size="90" maxlength="100" tabindex="" />
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="heading">Heading</label>
	</td>
	<td>
	<input type="text" name="edit[heading]" id="heading" value="{$edit.heading}" size="90" maxlength="100" tabindex="" />
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="keywords">Metadata Keywords</label>
	</td>
	<td>
	<textarea name="edit[keywords]" id="keywords" cols="68" rows="3" tabindex="">{$edit.keywords}</textarea>
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="description">Metadata Description</label>
	</td>
	<td>
	<textarea name="edit[description]" id="description" cols="68" rows="3" tabindex="">{$edit.description}</textarea>
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="introduction">Introduction</label>
	</td>
	<td>
	<textarea name="edit[introduction]" id="introduction" cols="68" rows="6" tabindex="">{$edit.introduction}</textarea>
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="content2">Content</label>
	</td>
	<td>
	<textarea name="edit[content]" id="content2" cols="68" rows="15" tabindex="">{$edit.content}</textarea>
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="pageorder">Page Order</label>
	</td>
	<td>
	<input type="text" name="edit[pageorder]" id="pageorder" value="{$edit.pageorder}" size="25" maxlength="100" tabindex="" />
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="active">Active</label>
	</td>
	<td>
	{if $edit.active == 1}
		<input type="checkbox" name="edit[active]" id="active" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[active]" id="active" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="newspage">Is a News Page</label>
	</td>
	<td>
	{if $edit.newspage == 1}
		<input type="checkbox" name="edit[newspage]" id="newspage" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[newspage]" id="newspage" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="newsitem">Is a News Item</label>
	</td>
	<td>
	{if $edit.newsitem == 1}
		<input type="checkbox" name="edit[newsitem]" id="newsitem" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[newsitem]" id="newsitem" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="newsdate">News Date</label>
	</td>
	<td>
	<script language="JavaScript" ID="jscal1xx"> 
		var cal1xx = new CalendarPopup("testdiv1");
		cal1xx.showNavigationDropdowns();
	</script>
	
	<input type="text" name="newsdate" id="newsdate" value=
	{if $edit.newsdate}
		"{$edit.newsdate}"
	{else}
		"{$popupdate}"
	{/if}
	size="25" tabindex="" /> 
	<a href="#" onClick="cal1xx.select(document.forms['myForm'].newsdate,'anchor1xx','yyyy/MM/dd'); return false;" title="cal.select(document.forms['myForm'].newsdate,'anchor1xx','yyyy/MM/dd'); return false;" name="anchor1xx" id="anchor1xx">popup calendar</a>	
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="announcement">Is an Announcement</label>
	</td>
	<td>
	{if $edit.announcement == 1}
		<input type="checkbox" name="edit[announcement]" id="announcement" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[announcement]" id="announcement" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="inmenu">Included in Menu</label>
	</td>
	<td>
	{if $edit.inmenu == 1}
		<input type="checkbox" name="edit[inmenu]" id="inmenu" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[inmenu]" id="inmenu" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="inusermenu">Included in User Menu</label>
	</td>
	<td>
	{if $edit.inusermenu == 1}
		<input type="checkbox" name="edit[inusermenu]" id="inmenu" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[inusermenu]" id="inmenu" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="homepage">Is a Homepage</label>
	</td>
	<td>
	{if $edit.homepage == 1}
		<input type="checkbox" name="edit[homepage]" id="homepage" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[homepage]" id="homepage" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="listpage">Is a List Page</label>
	</td>
	<td>
	{if $edit.listpage == 1}
		<input type="checkbox" name="edit[listpage]" id="listpage" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[listpage]" id="listpage" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td>Page visible to:</td>
	<td>
	{foreach from=$userType key=key item=utype}
		<label for="visibleto{$key}">{$utype}</label>
			<input type="checkbox" name="edit[visibleto][{$key}]" id="visibleto{$key}" value="1" 
			{if $edit.visibleto.$key == 1}
				checked="checked"
			{elseif !$edit.identifier}
				checked="checked"
			{/if}
			/>
	{/foreach}
	</td>	
	</tr>
	
		<tr>
			<td>Page shows images:</td>
			<td>
				{foreach from=$thumbnail key=key item=thumb}
					<label for="imagelist{$key}"><img src="{$home}/images/uploads/thumbnails/{$thumb}" width="50" border="0" alt="{$thumb}" /></label>
						<input type="checkbox" name="edit[imagelist][{$key}]" id="imagelist{$key}" value="{$key}" 
						{if $edit.imagelist.$key == $key}
							checked="checked"
						{/if}
						/>
				{/foreach}
			</td>	
		</tr>
	
		<tr>
			<td>Page shows documents:</td>
			<td>
				<ul>
				{foreach from=$doctitle key=key item=doc}
					<li>
						<input type="checkbox" name="edit[documentlist][{$key}]" id="documentlist{$key}" value="{$key}" 
						{if $edit.documentlist.$key == $key}
							checked="checked"
						{/if}
						/>
						<label for="documentlist{$key}">{$doc}</label>
					</li>
				{/foreach}
				</ul>
			</td>	
		</tr>
	
	<tr>
	<td></td>
	<td>
	<button type="submit" name="submit">submit</button>
	</td>
	</tr>
		
	</form>
	
	</table>
	
	<div id="testdiv1" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;">
	</div> 

{else}

	{if $thispage}
		<h1>Managing Subpages of {$thispage.identifier}</h1>
		<h2>{$thispage.heading}</h2>
	{else}
		<h1>Managing Top Level Pages</h1>
	{/if}

	<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="10">
	{if $pageList}
		<tr>
			<th>ID</th>
			<th>Page Identifier</th>
			<th>Order</th>
			<th>Heading</th>
			<th>(see below *)</th>
			<th>(see below *)</th>
			<th>Activate</th>
			<th>Edit</th>
			<th>Delete</th>
			<th>Subpages</th>
		</tr>
		{foreach from=$pageList key=key item=page}
			<tr>
				<td align="center">{$page.page_id}</td>
				
				<td>{$page.identifier}</td>
				
				<td align="center">{$page.pageorder}</td>
				
				<td>
				<a href="{$page.pageurl}" title="view page">
				{if $page.heading}
					{$page.heading|truncate:70}
				{else}
					<i>(no page heading yet)</i>
				{/if}
				</a>
				</td>
				
				<td align="center"><i>{$page.whosees}</i></td>
				
				<td align="center"><i>{$page.composite}</i></td>
				
				<td>
					<form name="activatePage" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="act" />
					<input type="hidden" name="pid" id="pid" value="{$page.page_id}" />
					<input type="hidden" name="listpid" id="listpid" value="{$listpid}" />
					<input type="hidden" name="langid" id="langid" value="{$langid}" />
					<button type="submit" name="submitActivatePage" id="submitActivatePage"
						onclick="return confirm('Are you sure you want to {$page.active[1]} {$page.identifier}?')">
						{$page.active[1]}</button>
					</form>
				</td>
				
				<td>
					<form name="editPage" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="edit" />
					<input type="hidden" name="pid" id="pid" value="{$page.page_id}" />
					<input type="hidden" name="listpid" id="listpid" value="{$listpid}" />
					<input type="hidden" name="langid" id="langid" value="{$langid}" />
					<button type="submit" name="submitEditPage" id="submitEditPage">edit</button>
					</form>
				</td>
				
				<td>
					{if $page.subpages == 0 && $page.core == 0}
						<form name="delPage" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="pid" id="pid" value="{$page.page_id}" />
						<input type="hidden" name="listpid" id="listpid" value="{$listpid}" />
						<input type="hidden" name="langid" id="langid" value="{$langid}" />
						<button type="submit" name="submitDelPage" id="submitDelPage" 
							onclick="return confirm('Are you sure you want to delete {$page.identifier}?')">delete</button>
						</form>
					{elseif $page.core == 1}
						<i>core page</i>
					{elseif $page.subpages == 1}
						<i>{$page.subpages} subpage</i>
					{else}
						<i>{$page.subpages} subpages</i>
					{/if}
				</td>
				
				<td>
					<form name="viewSubPages" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="list" />
					<input type="hidden" name="pid" id="pid" value="{$page.page_id}" />
					<input type="hidden" name="listpid" id="listpid" value="{$page.page_id}" />
					<input type="hidden" name="langid" id="langid" value="{$langid}" />
					<button type="submit" name="submitViewSubPages" id="submitViewSubPages">subpages</button>		
					</form>
				</td>
				
			</tr>
		{/foreach}
	{else}
		<tr>
			<td colspan="10"><i>There are no pages to view.</i></td>
		</tr>
	{/if}
	
	<tr>
		<td colspan="10" align="right">
		<br />
		<form name="addPage" action="{$url}" method="post">		
		<input type="hidden" name="op" id="op" value="add" />		
		<input type="hidden" name="listpid" id="listpid" value="{$listpid}" />
		<input type="hidden" name="langid" id="langid" value="{$langid}" />
		<button type="submit" name="submitAddPage" id="submitAddPage">add page</button>
		</form>
		
		</td>
	</tr>
	
	<tr>
		<td colspan="10">
		{$userTypeLegend}<br />M = page appears in menu, U = page appears in user menu,<br />H = page is a homepage, L = page is a list page, N = page is a news page, I = page is a news item, A = page is an announcement.<br /><br />Core pages, i.e. pages essential to this CMS, may not be deleted. Only pages with no subpages can be deleted. Subpages must be deleted first.
		</td>
	</tr>
	
	</table>

{/if}
<br />
<table width="1000" border="0" cellspacing="5" cellpadding="0">

<tr>
<td>

<form name="dummyForm" action="{$url}" method="post">
<select name="dummy" onchange="location.href=this.options[this.selectedIndex].value">
{foreach from=$language key=key item=lang}
	<option 
	{if $langid == $key}
		selected = "selected"
	{/if}
	value="{$url}?listpid={$listpid}&amp;pid={$pid}&amp;op={$op}&amp;langid={$key}">{$lang}</option>
{/foreach}
</select>
</form>

</td>
</tr>

</table>
		
{include file='admin/footer.tpl'}

{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}