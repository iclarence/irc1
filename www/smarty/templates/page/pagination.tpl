<p class="pagenav">
{if $subpagePagination.previousPage}
	<a href="{$pageurl}1/">&laquo;</a>
	<a href="{$pageurl}{$subpagePagination.previousPage}/">&lt;</a>
{else}
	&laquo;
	&lt;
{/if}
{foreach from=$subpagePagination.pageNumbers key=key item=pgNo}
	{if $pgNo == $subpagePagination.pageNumber}
		{$pgNo}
	{else}
		<a href="{$pageurl}{$pgNo}/">{$pgNo}</a>
	{/if}
{/foreach}
{if $subpagePagination.nextPage}
	<a href="{$pageurl}{$subpagePagination.nextPage}/">&gt;</a>
	<a href="{$pageurl}{$subpagePagination.numberOfPages}/">&raquo;</a>
{else}
	&gt;
	&raquo;
{/if}
</p>