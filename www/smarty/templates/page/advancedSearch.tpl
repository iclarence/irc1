<form name="advancedSearchForm" action="{$home}/page/{$languageIdentifier}/searchresults/" method="post">
<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
<input type="text" name="searchTerm" id="searchTerm" value="{$searchTerm}" size="50" maxlength="100" />
<select name="searchConditions" id="searchConditions">

	<option 
		{if $searchConditions == 'any word'}
			selected="selected"
		{/if}
		value="any word">any word</option>
		
	<option 
		{if $searchConditions == 'all words'}
			selected="selected"
		{/if}
		value="all words">all words</option>
		
	<option
		{if $searchConditions == 'exact phrase'}
			selected="selected"
		{/if}
		value="exact phrase">exact phrase</option>
		
</select>
<input type="submit" name="submit" value="search" />
</form>