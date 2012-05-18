{if !$authenticated || $me.usertype == 'superuser'}
	<form name="dummyForm" action="{$url}" method="post">
	<select name="dummy" onchange="location.href=this.options[this.selectedIndex].value">
	{foreach from=$languageArray key=key item=lang}
		<option 
		{if $languageIdentifier == $lang.identifier}
			selected = "selected"
		{/if}
		value="{$lang.url}">{$lang.language}</option>
	{/foreach}
	</select>
	</form>
{/if}