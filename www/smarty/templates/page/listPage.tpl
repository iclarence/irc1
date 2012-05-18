{foreach from=$subpages key=key item=menu}
	<div class="entry">
		<h2><a href="{$menu.url}">{$menu.heading}</a></h2>
		
		{if $menu.imagedetails[0]}
			<a href="{$menu.url}"><img src="{$home}/images/uploads/{$menu.imagedetails[0].thumbnail}" border="0" width="{$thumbnailwidth}" alt="{$menu.imagedetails[0].identifier}" /></a>
		{/if}
		
		<p>{$menu.introduction}</p>
	</div>
{/foreach}
		
{if $subpagePagination.numberOfPages > 1}
	{include file='page/pagination.tpl'}	
{/if}				