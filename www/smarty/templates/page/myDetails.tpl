<table border="0" cellpadding="0" cellspacing="10">

<tr>
	<td></td>
	<td>
	
		<form name="updateMyDetails" action="{$home}/page/{$languageIdentifier}/updatedetails" method="post">
		<input type="submit" name="submit" id="submit" value="update my details" />					
		</form>
	
		<form name="changePassword" action="{$home}/page/{$languageIdentifier}/changepassword" method="post">
		<input type="submit" name="submit" id="submit" value="change my password" />					
		</form>	
	
	</td>
</tr>

<tr>
	<td>Name</td>
	<td>{$me.title} {$me.firstname} {$me.lastname}</td>
</tr>

<tr>
	<td>Username</td>
	<td>{$me.username}</td>
</tr>

<tr>
	<td>User Type</td>
	<td>{$me.usertype}</td>
</tr>

<tr>
	<td>Email</td>
	<td>{$me.email}</td>
</tr>

<tr>
	<td>Telephone</td>
	<td>{$me.phone}</td>
</tr>

{if $me.mobile}
	<tr>
		<td>Mobile</td>
		<td>{$me.mobile}</td>
	</tr>
{/if}

{if $me.fax}
	<tr>
		<td>Fax</td>
		<td>{$me.fax}</td>
	</tr>
{/if}

<tr>
	<td valign="top">Address</td>
	<td valign="top">
	
		{$me.street}
		
		{if $me.district}
			<br />
			{$me.district}
		{/if}
		
		<br />
		{$me.city}
		
		{if $me.state}
			<br />
			{$me.state}
		{/if}
		
		<br />
		{$me.zip}
		
		<br />
		{$me.country}
	
	</td>
</tr>

<tr>
	<td>Language</td>
	<td>{$me.language}</td>
</tr>

<tr>
	<td>Timezone</td>
	<td>{$me.timezone}</td>
</tr>

<tr>
	<td></td>
	<td>
		{if $me.subscription}
			Subscribes to newsletter.
		{else}
			Does not subscribe to newsletter.
		{/if}
	</td>
</tr>

<tr>
	<td></td>
	<td>
		{if $me.receivehtml}
			Receives emails in HTML format.
		{else}
			Does not receive emails in HTML format.
		{/if}
	</td>
</tr>

</table>