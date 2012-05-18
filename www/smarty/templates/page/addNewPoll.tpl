{if $ok}
	<p>Your suggestion for a new poll has been received.</p>
	<form name="redirectHome" action="{$home}/page/{$languageIdentifier}/home" method="post">
	<input type="submit" name="submit" id="submit" value="continue" />					
	</form>
	
{else}

	{if $errmsg}
		<p>{$errmsg}</p>
	{/if}
	
	<table width="700" border="0" cellspacing="5" cellpadding="0" cols="2">	
		
	<form name="pollSuggestionForm" action="{$pageurl}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="edit[active]" id="active" value="0" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
		
	<tr>
		<td>
			<label for="poll">Question *</label>
		</td>
		<td>
			<input type="text" name="edit[poll]" id="poll" value="{$edit.poll}" size="90" maxlength="100" tabindex="" />
		</td>
	</tr>
		
	{foreach from=$ansArray key=key item=ans}
		<tr>
			<td>
				<label for="ordering">Option {$ans}</label>
			</td>
			<td>
				<input type="text" name="edit[answers][{$key}]" id="ordering" value="{$edit.answers.$key}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
	{/foreach}
	
	<tr>
	<td></td>
	<td>
	<input type="submit" name="submit" value="submit" tabindex="" />
	</td>
	</tr>
		
	</form>
	
	</table>
{/if}