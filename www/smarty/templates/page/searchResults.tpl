{if $noSearch == 1}
	<div class="entry">
		<p><i>No search was performed.</i></p>
	</div>
	
{else}

	<div class="entry">
		<p><b>Search term: "{$searchTerm}". Search condition: {$searchConditions}.</b></p>
		
		{if $numberOfResults == 1}
			<p><i>Only one page found.</i></p>
		{elseif $numberOfResults == 0}
			<p><i>No results found.</i></p>
		{else}
			<p><i>{$numberOfResults} pages found.</i></p>
		{/if}
	</div>
	
	{if $searchResults[0]}
		{foreach from=$searchResults key=key item=searchResult}
			<div class="entry">
				<h2><a href="{$searchResult.url}">{$searchResult.heading}</a></h2>
				<p>{$searchResult.output}</p>
			</div>
		{/foreach}
		
		{if $searchPagination.numberOfPages > 1}
			{include file='page/searchPagination.tpl'}
		{/if}
		
	{/if}
	
{/if}