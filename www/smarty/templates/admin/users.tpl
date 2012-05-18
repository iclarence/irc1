{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

	{include file='admin/header.tpl'}
	
	<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> 
	-> <a href="{$url}?op=list">Manage users</a></p>
	<br />
	
	{if $ok}
		<SCRIPT language="JavaScript">
		<!--
		window.location="{$url}?listuid={$listuid}&op=list";
		//-->
		</SCRIPT>
	{/if}
	
	{if $op == 'edit' or $op == 'add' or $errmsg}
	
		{if $op == 'edit'}
			<h1>Editing Details for {$edit.firstname} {$edit.lastname} ({$edit.username})</h1>
		{elseif $op == 'add'}
			<h1>New User</h1>
		{/if}
	
		{if $errmsg}
			<p>{$errmsg}</p>
		{/if}
		
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
		
			
		<form name="myForm" action="{$url}" method="post">
		
		<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
		<input type="hidden" name="op" id="op" value="{$op}" />
		<input type="hidden" name="uid" id="uid" value="{$uid}" />
		<input type="hidden" name="listuid" id="listuid" value="{$listuid}" />
		<input type="hidden" name="edit[address_id]" id="address_id" value="{$edit.address_id}" />
		<input type="hidden" name="submitted" id="submitted" value="1" />
		
		<tr>
			<td>
				<label for="title">Title</label>
			<td>
				<select name="edit[title]" id="title">
				
					<option 
						{if $edit.title == 'Mr'}
							selected="selected"
						{/if}
					value="Mr">Mr</option>
				
					<option 
						{if $edit.title == 'Mrs'}
							selected="selected"
						{/if}
					value="Mrs">Mrs</option>
				
					<option 
						{if $edit.title == 'Miss'}
							selected="selected"
						{/if}
					value="Miss">Miss</option>
				
					<option 
						{if $edit.title == 'Ms'}
							selected="selected"
						{/if}
					value="Ms">Ms</option>
				
					<option 
						{if $edit.title == 'Dr'}
							selected="selected"
						{/if}
					value="Dr">Dr</option>
					
				</select>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="firstname">First Name *</label>
			</td>
			<td>
				<input type="text" name="edit[firstname]" id="firstname" value="{$edit.firstname}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="lastname">Last Name *</label>
			</td>
			<td>
				<input type="text" name="edit[lastname]" id="lastname" value="{$edit.lastname}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="username">Username *</label>
			</td>
			<td>
				<input type="text" name="edit[username]" id="username" value="{$edit.username}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="companyname">Company Name</label>
			</td>
			<td>
				<input type="text" name="edit[companyname]" id="companyname" value="{$edit.companyname}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="email">Email Address *</label>
			</td>
			<td>
				<input type="text" name="edit[email]" id="email" value="{$edit.email}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="phone">Telephone Number *</label>
			</td>
			<td>
				<input type="text" name="edit[phone]" id="phone" value="{$edit.phone}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="mobile">Mobile Number</label>
			</td>
			<td>
				<input type="text" name="edit[mobile]" id="mobile" value="{$edit.mobile}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="fax">Fax Number</label>
			</td>
			<td>
				<input type="text" name="edit[fax]" id="fax" value="{$edit.fax}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="website">Website URL</label>
			</td>
			<td>
				<input type="text" name="edit[website]" id="website" value=
				{if $edit.website}
					"{$edit.website}"
				{else}
					"http://"
				{/if}
			 	size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="street">Address Line 1 *</label>
			</td>
			<td>
				<input type="text" name="edit[street]" id="street" value="{$edit.street}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="district">Address Line 2</label>
			</td>
			<td>
				<input type="text" name="edit[district]" id="district" value="{$edit.district}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="city">Town / City *</label>
			</td>
			<td>
				<input type="text" name="edit[city]" id="city" value="{$edit.city}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="state">County / State</label>
			</td>
			<td>
				<input type="text" name="edit[state]" id="state" value="{$edit.state}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="zip">Post Code / Zip *</label>
			</td>
			<td>
				<input type="text" name="edit[zip]" id="zip" value="{$edit.zip}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="country">Country</label>
			<td>
				<select name="edit[country_id]" id="country">
					
					{foreach from=$countries key=key item=country}
						<option 
							{if $edit.country_id == $key}
								selected="selected"
							{elseif !$edit.country_id && $key == 77}
								selected="selected"
							{/if}
						value="{$key}">{$country}</option>
					{/foreach}
					
				</select>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="usertype">User Type</label>
			<td>
				<select name="edit[usertype_id]" id="usertype">
					
					{foreach from=$usertypes key=key item=usertype}
						<option 
							{if $edit.usertype_id == $key}
								selected="selected"
							{elseif !$edit.usertype_id && $key == 3}
								selected="selected"
							{/if}
						value="{$key}">{$usertype}</option>
					{/foreach}
					
				</select>
			</td>
		</tr>
		
		<tr>
			<td>
			<label for="userlogin">Has a user Login?</label>
			</td>
			<td>
				<input type="checkbox" name="edit[userlogin]" id="userlogin" value="1" 
				{if $edit.userlogin == 1}
					checked="checked" 
				{elseif !$edit.username}
					checked="checked"
				{/if}
				/>
			</td>
		</tr>
		
		<tr>
			<td>
			<label for="subscription">Is a subscriber?</label>
			</td>
			<td>
				<input type="checkbox" name="edit[subscription]" id="subscription" value="1" 
				{if $edit.subscription == 1}
					checked="checked" 
				{elseif !$edit.username}
					checked="checked"
				{/if}
				/>
			</td>
		</tr>
		
		<tr>
			<td>
			<label for="receivehtml">Receives HTML emails?</label>
			</td>
			<td>
				<input type="checkbox" name="edit[receivehtml]" id="receivehtml" value="1" 
				{if $edit.receivehtml == 1}
					checked="checked" 
				{elseif !$edit.username}
					checked="checked"
				{/if}
				/>
			</td>
		</tr>
	
		<tr>
			<td>Belongs to email aliases:</td>
			<td>
				{foreach from=$aliases key=key item=alias}
					<label for="aliases{$key}">{$alias}</label>
						<input type="checkbox" name="edit[aliases][{$key}]" id="aliases{$key}" value="{$key}" 
						{if $edit.aliases.$key == $key}
							checked="checked"
						{/if}
						/>
				{/foreach}
			</td>	
		</tr>
		
		<tr>
			<td>
				<label for="language">Language</label>
			<td>
				<select name="edit[language_id]" id="language">
					
					{foreach from=$languages key=key item=language}
						<option 
							{if $edit.language_id == $key}
								selected="selected"
							{elseif !$edit.language_id && $key == 1}
								selected="selected"
							{/if}
						value="{$key}">{$language}</option>
					{/foreach}
					
				</select>
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="timezone">Timezone</label>
			<td>
				<select name="edit[timezone_id]" id="timezone">
					
					{foreach from=$timezones key=key item=timezone}
						<option 
							{if $edit.timezone_id == $key}
								selected="selected"
							{elseif !$edit.timezone_id && $key == 16}
								selected="selected"
							{/if}
						value="{$key}">{$timezone}</option>
					{/foreach}
					
				</select>
			</td>
		</tr>
		
		<tr>
			<td>
			<label for="active">Account Active</label>
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
	
	{else}
	
		
		<h1>Managing Users</h1>
	
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="10">
		{if $userList}
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Username</th>
				<th>Type</th>
				<th>Email Address</th>
				<th>Password changed</th>
				<th>Change password</th>
				<th>Activate</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			{foreach from=$userList key=key item=user}
				<tr>
					<td align="center">{$user.user_id}</td>
					
					{if !$user.lastname}
						<td align="left">{$user.firstname}</td>
					{elseif !$user.firstname}
						<td align="left"><b>{$user.lastname}</b></td>
					{else}
						<td align="left"><b>{$user.lastname}</b>, {$user.firstname}</td>
					{/if}
					
					<td align="center">{$user.username}</td>
					
					<td align="center">{$user.usertype}</td>
					
					<td><a href="mailto:{$user.email}">{$user.email}</a></td>
					
					<td align="center"><small><i>{$user.lastPwdChange}</i></small></td>
					
					<td>
						<form name="pwdUser" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="pwd" />
						<input type="hidden" name="uid" id="uid" value="{$user.user_id}" />
						<input type="hidden" name="listuid" id="listuid" value="{$listuid}" />
						<button type="submit" name="submitPwdUser" id="submitPwdUser"
							onclick="return confirm('Are you sure you want to change the password for {$user.username}?')">
							change password</button>	
						</form>
					</td>
					
					<td>
						<form name="activateUser" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="act" />
						<input type="hidden" name="uid" id="uid" value="{$user.user_id}" />
						<input type="hidden" name="listuid" id="listuid" value="{$listuid}" />
						{if $user.active == 1}
							<button type="submit" name="submitActivateUser" id="submitActivateUser"
								onclick="return confirm('Are you sure you want to deactivate {$user.username}?')">
								deactivate</button>
						{elseif $user.active == 0}
							<button type="submit" name="submitActivateUser" id="submitActivateUser"
								onclick="return confirm('Are you sure you want to activate {$user.username}?')">
								activate</button>
						{/if}
						</form>
					</td>
					
					<td>
						<form name="editUser" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="edit" />
						<input type="hidden" name="uid" id="uid" value="{$user.user_id}" />
						<input type="hidden" name="listuid" id="listuid" value="{$listuid}" />
						<button type="submit" name="submitEditUser" id="submitEditUser">edit</button>
						</form>
					</td>
					
					<td>
						<form name="delUser" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="uid" id="uid" value="{$user.user_id}" />
						<input type="hidden" name="listuid" id="listuid" value="{$listuid}" />
						<button type="submit" name="submitDelUser" id="submitDelUser"
							onclick="return confirm('Are you sure you want to delete {$user.username}?')">
							delete</button>
						</form>
					</td>
					
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="10"><i>There are no users to view.</i></td>
			</tr>
		{/if}
		
		<tr>
			<td colspan="10" align="right">
			<br />
			<form name="addUser" action="{$url}" method="post">		
			<input type="hidden" name="op" id="op" value="add" />		
			<input type="hidden" name="listuid" id="listuid" value="{$listuid}" />
			<button type="submit" name="submitAddUser" id="submitAddUser">add user</button>	
			</form>
			
			</td>
		</tr>
		</table>
	
	{/if}
			
	{include file='admin/footer.tpl'}
	
{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}