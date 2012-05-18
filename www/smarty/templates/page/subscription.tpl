{if $subscribeMsg}
	<p>{$subscribeMsg}</p>
{/if}

<form name="subscriptionForm" action="{$pageurl}" method="post">	
<input type="hidden" name="subscribeSubmitted" id="subscribeSubmitted" value="1" />	
<label for="name">Name</label>
<br />
<input type="text" name="name" id="name" value="{$name}" size="20" maxlength="100" tabindex="" />

<br />
<label for="email">Email</label>
<br />
<input type="text" name="email" id="email" value="{$email}" size="20" maxlength="100" tabindex="" />

<br />
<input type="submit" name="submit" id="submit" value="subscribe" />

</form>