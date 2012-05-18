{if $thispage.imagedetails || $thispage.content || $thispage.documentdetails}

	<div class="entry">
		<h2>{$thispage.heading}</h2>
		{include file='page/images.tpl'}		
		<p>{$thispage.content}</p>		
		{include file='page/documents.tpl'}				
		{if $thispage.newsitem == 1}
			<p class="meta"><span class="date">{$thispage.newsdate}</span></p>
		{/if}
	</div>
	
{else}

	<h2>{$thispage.heading}</h2>
	
{/if}


