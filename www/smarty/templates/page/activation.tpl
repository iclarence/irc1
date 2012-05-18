{if $authenticated == 1}

	<p>{$activationMsg}</p>
	<p>Welcome {$me.firstname} {$me.lastname} to {$sitename}. You are now logged in as {$me.username}.</p>
	
	<form name="redirectHome" action="{$home}/page/{$me.languageIdentifier}/home" method="post">
	<input type="submit" name="submit" id="submit" value="continue" />					
	</form>
	
{else}
	
	{if $activationMsg}
		<p>{$activationMsg}</p>
	{/if}
	
	<table border="0" cellspacing ="5" cellpadding="0">
	
	<form name="activationForm" action="{$pageurl}" method="post">
	
	<input type="hidden" name="activationSubmitted" id="activationSubmitted" value="1" />
	
	<tr>
		<td>
			<label for="name">Activation Key</label>
		</td>
		<td>
			<input type="text" name="activationKey" id="activationKey" value="{$activationKey}"
			size="50" maxlength="100" tabindex="" onclick="document.getElementById('activationKey').value=''" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="email">Email</label>
		</td>
		<td>
			<input type="text" name="email" id="email" value="{$email}"
			size="50" maxlength="100" tabindex="" onclick="document.getElementById('email').value=''" />
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td>
			<input type="submit" name="submit" id="submit" value="activate" />
		</td>
	</tr>
		
	</form>
	
	</table>
	
{/if}