<p class="pagenav">
{if $searchPagination.previousPage}
	<a href="{$pageurl}1/">&laquo;</a>
	<a href="{$pageurl}{$searchPagination.previousPage}/">&lt;</a>
{else}
	&laquo;
	&lt;
{/if}
{foreach from=$searchPagination.pageNumbers key=key item=pgNo}
	{if $pgNo == $searchPagination.pageNumber}
		{$pgNo}
	{else}
		<a href="{$pageurl}{$pgNo}/">{$pgNo}</a>
	{/if}
{/foreach}
{if $searchPagination.nextPage}
	<a href="{$pageurl}{$searchPagination.nextPage}/">&gt;</a>
	<a href="{$pageurl}{$searchPagination.numberOfPages}/">&raquo;</a>
{else}
	&gt;
	&raquo;
{/if}
</p>