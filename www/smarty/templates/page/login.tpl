{if $thispage.identifier == 'logout'}
	<p>Logging out.</p>
{elseif $thispage.identifier == 'forgotten'}
	<p>Changing password.</p>
{elseif $thispage.identifier == 'activate'}
	<p>Activating account.</p>
{else}
	{if $loginMsg}
		<p>{$loginMsg}</p>
	{/if}
	{if $authenticated}
		<p>Welcome {$me.firstname} {$me.lastname}!</p>
		<p><a href="{$home}/page/{$languageIdentifier}/logout/">Logout</a></p>
	{else}
		<form name="loginForm" action="{$pageurl}" method="post">
		<input type="hidden" name="loginSubmitted" id="loginSubmitted" value="1" />
		<label for="username">Username</label>
		<br />
		<input type="text" name="username" id="username" value="{$myLoginDetails[0]}" 
		size="20" maxlength="100" tabindex="" onclick="document.getElementById('username').value=''" />
		<br />
		<label for="password">Password</label>
		<br />
		<input type="password" name="password" id="password" value="{$myLoginDetails[1]}"
		size="20" maxlength="100" tabindex="" onclick="document.getElementById('password').value=''" />
		<br />
		<input type="checkbox" name="keepMeLoggedIn" id="keepMeLoggedIn" value="1"  
		{if $keepMeLoggedIn == 1}
			checked="checked"
		{/if}
		/>
		<label for="keepMeLoggedIn">Keep me logged in.</label>
		<br />
		<input type="checkbox" name="rememberMe" id="rememberMe" value="1"  
		{if $rememberMe == 1}
			checked="checked"
		{/if}
		/>
		<label for="rememberMe">Remember me.</label>
		<br />
		<input type="submit" name="submit" id="submit" value="login" />
		</form>
		<p><a href="{$home}/page/{$languageIdentifier}/register/">Register</a></p>
		<p><a href="{$home}/page/{$languageIdentifier}/forgotten/">Forgotten password?</a></p>
	
	{/if}
{/if}