{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

	{include file='admin/header.tpl'}
	
	<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> -> 
	<a href="{$url}?op=list">Manage emails</a></p>
	<br />
	
	{if $ok}
		<SCRIPT language="JavaScript">
		<!--
		window.location="{$url}?listeid={$listeid}&op=list";
		//-->
		</SCRIPT>
	{/if}
	
	{if $op == 'edit' or $op == 'add' or $errmsg}
	
		{if $op == 'edit'}
			<h1>Editing "{$edit.subject}"</h1>
		{elseif $op == 'add'}
			<h1>New Email</h1>
		{/if}
	
		{if $errmsg}
			<p>{$errmsg}</p>
		{/if}
		
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
		
			
		<form name="myForm" action="{$url}" method="post">
		
		<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
		<input type="hidden" name="op" id="op" value="{$op}" />
		<input type="hidden" name="eid" id="eid" value="{$eid}" />
		<input type="hidden" name="listeid" id="listeid" value="{$listeid}" />
		<input type="hidden" name="edit[address_id]" id="address_id" value="{$edit.address_id}" />
		<input type="hidden" name="submitted" id="submitted" value="1" />
		
		<tr>
			<td>
				<label for="subject">Subject *</label>
			</td>
			<td>
				<input type="text" name="edit[subject]" id="subject" value="{$edit.subject}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
	
		<tr>
			<td>
				<label for="emailbody">Email Body</label>
			</td>
			<td>
				<textarea name="edit[emailbody]" id="emailbody" cols="68" rows="20" tabindex="">{$edit.emailbody}</textarea>
			</td>
		</tr>
	
		<tr>
			<td>
				<label for="sent">Scheduled to be Sent</label>
			</td>
			<td>
				<script language="JavaScript" ID="jscal1xx"> 
					var cal1xx = new CalendarPopup("testdiv1");
					cal1xx.showNavigationDropdowns();
				</script>
				
				<input type="text" name="sent" id="sent" value=
				{if $edit.sent}
					"{$edit.sent}"
				{else}
					"{$popupdate}"
				{/if}
				size="25" tabindex="" /> 
				<a href="#" onClick="cal1xx.select(document.forms['myForm'].sent,'anchor1xx','yyyy/MM/dd'); return false;" title="cal.select(document.forms['myForm'].sent,'anchor1xx','yyyy/MM/dd'); return false;" name="anchor1xx" id="anchor1xx">popup calendar</a>	
			</td>
		</tr>
		
		<tr>
			<td>
			<label for="to_subscribers">Send to subscribers?</label>
			</td>
			<td>
				<input type="checkbox" name="edit[to_subscribers]" id="to_subscribers" value="1" 
				{if $edit.to_subscribers == 1}
					checked="checked" 
				{elseif !$edit.subject}
					checked="checked"
				{/if}
				/>
			</td>
		</tr>
	
		<tr>
			<td>Send to user types:</td>
			<td>
				{foreach from=$usertypes key=key item=utype}
					<label for="to_usertypes{$key}">{$utype}</label>
						<input type="checkbox" name="edit[to_usertypes][{$key}]" id="to_usertypes{$key}" value="1" 
						{if $edit.to_usertypes.$key == 1}
							checked="checked"
						{/if}
						/>
				{/foreach}
			</td>	
		</tr>
	
		<tr>
			<td>Send to email aliases:</td>
			<td>
				{foreach from=$aliases key=key item=alias}
					<label for="to_aliases{$key}">{$alias}</label>
						<input type="checkbox" name="edit[to_aliases][{$key}]" id="to_aliases{$key}" value="{$key}" 
						{if $edit.to_aliases.$key == $key}
							checked="checked"
						{/if}
						/>
				{/foreach}
			</td>	
		</tr>
		
		<tr>
			<td>
			<label for="active">Active</label>
			</td>
			<td>
				<input type="checkbox" name="edit[active]" id="active" value="1" 
				{if $edit.active == 1}
					checked="checked"
				{/if}
				/>
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
		
		<h1>Managing Emails</h1>
	
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="6">
		{if $emailList}
			<tr>
				<th>ID</th>
				<th>Subject</th>
				<th>Send email</th>
				<th>Activate</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			{foreach from=$emailList key=key item=email}
				<tr>
					<td align="center">{$email.email_id}</td>
					
					<td>{$email.subject}</td>
					
					<td>
						{if $email.active == 1}
							<form name="sendEmail" action="{$url}" method="post">
							<input type="hidden" name="op" id="op" value="send" />
							<input type="hidden" name="eid" id="eid" value="{$email.email_id}" />
							<input type="hidden" name="listeid" id="listeid" value="{$listeid}" />
							<button type="submit" name="submitSendEmail" id="submitSendEmail"
								onclick="return confirm('Are you sure you want to send this email?')">send mail</button>
							</form>
						{/if}
					</td>
					
					<td>
						<form name="activateEmail" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="act" />
						<input type="hidden" name="eid" id="eid" value="{$email.email_id}" />
						<input type="hidden" name="listeid" id="listeid" value="{$listeid}" />
						{if $email.active == 1}
							<button type="submit" name="submitActivateEmail" id="submitActivateEmail"
								onclick="return confirm('Are you sure you want to deactivate this email?')">
								deactivate</button>
						{elseif $email.active == 0}
							<button type="submit" name="submitActivateEmail" id="submitActivateEmail"
								onclick="return confirm('Are you sure you want to activate this email?')">
								activate</button>
						{/if}
						</form>
					</td>
					
					<td>
						<form name="editEmail" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="edit" />
						<input type="hidden" name="eid" id="eid" value="{$email.email_id}" />
						<input type="hidden" name="listeid" id="listeid" value="{$listeid}" />
						<button type="submit" name="submitEditEmail" id="submitEditEmail">edit</button>
						</form>
					</td>
					
					<td>
						<form name="delEmail" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="eid" id="eid" value="{$email.email_id}" />
						<input type="hidden" name="listeid" id="listeid" value="{$listeid}" />
						<button type="submit" name="submitDelEmail" id="submitDelEmail"
							onclick="return confirm('Are you sure you want to delete this email?')">delete</button>	
						</form>
					</td>
					
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="6"><i>There are no emails to view.</i></td>
			</tr>
		{/if}
		
		<tr>
			<td colspan="6" align="right">
			<br />
			<form name="addEmail" action="{$url}" method="post">		
			<input type="hidden" name="op" id="op" value="add" />		
			<input type="hidden" name="listeid" id="listeid" value="{$listeid}" />
			<button type="submit" name="submitAddEmail" id="submitAddEmail">new email</button>			
			</form>
			
			</td>
		</tr>
		</table>
	
	{/if}
			
	{include file='admin/footer.tpl'}
	
{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}