{if $thispage.imagedetails || $thispage.content || $thispage.documentdetails}

	<div class="entry">
		<h2>{$thispage.heading}</h2>				
		{include file='page/images.tpl'}		
		<p>{$thispage.content}</p>		
		{include file='page/documents.tpl'}
	</div>
	
{else}

	<h2>{$thispage.heading}</h2>
	
{/if}

{include file='page/announcements.tpl'}
{include file='page/breakingNews.tpl'}
{include file='page/poll.tpl'}