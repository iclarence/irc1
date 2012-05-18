{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

{include file='admin/header.tpl'}

<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> -> 
	<a href="{$url}?op=list">Manage online polls</a></p>
<br />

{if $ok}
	<script language="JavaScript">
	<!--
	window.location="{$url}?listid={$listid}&op=list";
	//-->
	</script>
{/if}

{if $op == 'edit' or $op == 'add' or $errmsg}

	{if $op == 'edit'}
		<h1>Editing Poll</h1>
	{elseif $op == 'add'}
		<h1>New Poll</h1>
	{/if}

	{if $errmsg}
		<p>{$errmsg}</p>
	{/if}
	
	<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
	
		
	<form name="myForm" action="{$url}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="op" id="op" value="{$op}" />
	<input type="hidden" name="id" id="id" value="{$id}" />
	<input type="hidden" name="listid" id="listid" value="{$listid}" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
		
	<tr>
		<td>
			<label for="poll">Question *</label>
		</td>
		<td>
			<input type="text" name="edit[poll]" id="poll" value="{$edit.poll}" size="90" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="startdate">Start Date</label>
		</td>
		<td>
			<script language="JavaScript" ID="jscal1xx"> 
				var cal1xx = new CalendarPopup("testdiv1");
				cal1xx.showNavigationDropdowns();
			</script>
			
			<input type="text" name="startdate" id="startdate" value=
			{if $edit.startdate}
				"{$edit.startdate}"
			{else}
				"{$popupdate}"
			{/if}
			size="25" tabindex="" /> 
			<a href="#" onClick="cal1xx.select(document.forms['myForm'].startdate,'anchor1xx','yyyy/MM/dd'); return false;" title="cal.select(document.forms['myForm'].startdate,'anchor1xx','yyyy/MM/dd'); return false;" name="anchor1xx" id="anchor1xx">popup calendar</a>	
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="stopdate">Stop Date</label>
		</td>
		<td>
			<script language="JavaScript" ID="jscal1xx"> 
				var cal1xx = new CalendarPopup("testdiv1");
				cal1xx.showNavigationDropdowns();
			</script>
			
			<input type="text" name="stopdate" id="stopdate" value=
			{if $edit.stopdate}
				"{$edit.stopdate}"
			{else}
				"{$popupdate}"
			{/if}
			size="25" tabindex="" /> 
			<a href="#" onClick="cal1xx.select(document.forms['myForm'].stopdate,'anchor1xx','yyyy/MM/dd'); return false;" title="cal.select(document.forms['myForm'].stopdate,'anchor1xx','yyyy/MM/dd'); return false;" name="anchor1xx" id="anchor1xx">popup calendar</a>	
		</td>
	</tr>
		
	{foreach from=$ansArray key=key item=ans}
		<tr>
			<td>
				<label for="ordering">Option {$ans}</label>
			</td>
			<td>
				<input type="text" name="edit[answers][{$key}]" id="ordering" value="{$edit.answers.$key}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
	{/foreach}
	
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
		<td></td>
		<td>
			<button type="submit" name="submit" tabindex="">submit</button>
		</td>
	</tr>
		
	</form>
	
	</table>
	
	<div id="testdiv1" style="position:absolute;visibility:hidden;background-color:white;layer-background-color:white;">
	</div> 

{else}
	
	<h1>Managing Online Polls</h1>

	<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="6">
	{if $pollList}
		<tr>
			<th>ID</th>
			<th>Poll Name</th>
			<th>Days Left</th>
			<th>Activate</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		{foreach from=$pollList key=key item=poll}
			<tr>
				<td align="center">{$poll.poll_id}</td>
				
				<td align="center"><b>{$poll.poll}</b></td>
				
				<td align="center">
					{if $poll.notYetStarted}
						<i>not yet started</i>
					{elseif $poll.pollClosed}
						<i>closed</i>
					{else}
						{$poll.daysLeft}
					{/if}
				</td>
				
				<td>
					<form name="activatePoll" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="act" />
					<input type="hidden" name="id" id="id" value="{$poll.poll_id}" />
					<input type="hidden" name="listid" id="listid" value="{$listid}" />
					{if $poll.active == 1}
						<button type="submit" name="submitDectivatePoll" id="submitDeactivatePoll"
							onclick="return confirm('Are you sure you want to deactivate this poll?')">
							deactivate</button>
					{elseif $poll.active == 0}
						<button type="submit" name="submitActivatePoll" id="submitActivatePoll"
							onclick="return confirm('Are you sure you want to activate this poll?')">
							activate</button>
					{/if}
					</form>
				</td>
				
				<td>
					<form name="editPoll" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="edit" />
					<input type="hidden" name="id" id="id" value="{$poll.poll_id}" />
					<input type="hidden" name="listid" id="listid" value="{$listid}" />
					<button type="submit" name="submitEditPoll" id="submitEditPoll">edit</button>
					</form>
				</td>
				
				<td>
					{if $poll.active == 0}
						<form name="delPoll" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="id" id="id" value="{$poll.poll_id}" />
						<input type="hidden" name="listid" id="listid" value="{$listid}" />
						<button type="submit" name="submitDelPoll" id="submitDelPoll"
							onclick="return confirm('Are you sure you want to delete this poll?')">
							delete</button>
						</form>
					{elseif $poll.active == 1}
						<i>active</i>
					{/if}
				</td>
				
			</tr>
		{/foreach}
	{else}
		<tr>
			<td colspan="6"><i>There are no polls to view.</i></td>
		</tr>
	{/if}
	
	<tr>
		<td colspan="6" align="right">
		<br />
		<form name="addPoll" action="{$url}" method="post">		
		<input type="hidden" name="op" id="op" value="add" />		
		<input type="hidden" name="listid" id="listid" value="{$listid}" />
		<button type="submit" name="submitAddPoll" id="submitAddPoll">add poll</button>		
		</form>
		
		</td>
	</tr>
	
	<tr>
		<td colspan="6">
		Only inactive polls may be deleted.
		</td>
	</tr>
	
	</table>

{/if}
		
{include file='admin/footer.tpl'}

{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}