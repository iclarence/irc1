{if $authenticated == 0}

	<p>{$unsubscriptionMsg}</p>
	
	<form name="redirectHome" action="{$home}/page/{$me.languageIdentifier}/home" method="post">
	<input type="submit" name="submit" id="submit" value="continue" />					
	</form>
	
{/if}