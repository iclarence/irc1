{if $forgottenMsg != 'OK'}
	{if $forgottenMsg}
		<p>{$forgottenMsg}</p>
	{/if}
	<form name="forgottenPasswordForm" action="{$pageurl}" method="post">
	<input type="hidden" name="forgottenSubmitted" id="forgottenSubmitted" value="1" />
	<p>Please enter your email address:</p>
	<input type="text" name="email" id="email" value="{$email}" size="50" maxlength="100" tabindex="" />
	<p>Please confirm your email address:</p>
	<input type="text" name="confirm" id="confirm" value="{$confirm}" size="50" maxlength="100" tabindex="" />
	<br />
	<input type="submit" name="submit" id="submit" value="submit" />
	</form>
	<p>A new password will be emailed to your email address.</p>
{else}
	<p>A new password has been sent to your email address.</p>
	<form name="redirectHome" action="{$home}/page/{$languageIdentifier}/home" method="post">
	<input type="submit" name="submit" id="submit" value="ok" />					
	</form>
{/if}