{include file='admin/header.tpl'}

<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a></p>
<br />

{if $loginMsg}
	<p>{$loginMsg}</p>
	<br />
{/if}
{if $authenticated}
	<h1>Welcome {$me.firstname} {$me.lastname}!</h1>
	<ul>
	<li><a href="{$home}">Site Home</a></li>
	<li><a href="{$home}/admin/pages.php">Manage Pages</a></li>
	<li><a href="{$home}/admin/users.php">Manage Users</a> (all contacts: includes companies, event venues, etc.)</li>
	<li><a href="{$home}/admin/categories.php">Manage Categories</a></li>
	<li><a href="{$home}/admin/emails.php">Manage Emails</a></li>
	<li><a href="{$home}/admin/images.php">Manage Images</a></li>
	<li><a href="{$home}/admin/documents.php">Manage Documents</a></li>
	<li><a href="{$home}/admin/polls.php">Manage Online Polls</a></li>
	<li><a href="{$home}/admin/logout.php">Logout</a></li>
	</ul>
{else}
	<table width="1000" border="0" cellspacing="5" celpadding="0">
	<form name="loginForm" action="{$url}" method="post">
	<input type="hidden" name="loginSubmitted" id="loginSubmitted" value="1" />
	<input type="hidden" name="adminLogin" id="loginSubmitted" value="1" />
	
	<tr>
		<td>
			<label for="username">Username</label>
		</td>
		<td>
			<input type="text" name="username" id="username" value="{$myLoginDetails[0]}" 
			size="50" maxlength="100" tabindex="" onclick="document.getElementById('username').value=''" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="password">Password</label>
		</td>
		<td>
			<input type="password" name="password" id="password" value="{$myLoginDetails[1]}"
			size="50" maxlength="100" tabindex="" onclick="document.getElementById('password').value=''" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="keepMeLoggedIn">Keep me logged in.</label>
		</td>
		<td>
			<input type="checkbox" name="keepMeLoggedIn" id="keepMeLoggedIn" value="1"  
			{if $keepMeLoggedIn == 1}
				checked="checked"
			{/if}
			/>
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="rememberMe">Remember me on this computer.</label>
		</td>
		<td>
			<input type="checkbox" name="rememberMe" id="rememberMe" value="1"  
			{if $rememberMe == 1}
				checked="checked"
			{/if}
			/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<button type="submit" name="submit" id="submit">login</button>
		</td>
	</tr>
	</form>
	</table>

{/if}
		
{include file='admin/footer.tpl'}