{if $ok}

	<p>Your password has been updated.</p>
	<form name="redirectHome" action="{$home}/page/{$languageIdentifier}/home" method="post">
	<input type="submit" name="submit" id="submit" value="continue" />					
	</form>
	
{else}

	{if $errmsg}
		<p>{$errmsg}</p>
	{/if}
	
	<table width="700" border="0" cellspacing="5" cellpadding="0" cols="2">	
		
	<form name="registrationForm" action="{$pageurl}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
	
	<tr>
		<td>
			<label for="password">Password *</label>
		</td>
		<td>
			<input type="password" name="password" id="password" value="{$password}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="confirm">Confirm Password *</label>
		</td>
		<td>
			<input type="password" name="confirm" id="confirm" value="{$confirm}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td>
			<input type="submit" name="submit" value="submit" tabindex="" />
		</td>
	</tr>
		
	</form>
	
	</table>
{/if}