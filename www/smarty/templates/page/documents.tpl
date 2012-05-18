{if $thispage.documentdetails}
	<h2>Downloads</h2>
	<ul>
	{foreach from=$thispage.documentdetails key=key item=doc}
		<li>
			<a href="{$home}/documents/uploads/{$doc.filename}" target="_blank">
				{if $doc.title}
					{$doc.title}
				{else}
					{$doc.filename}
				{/if}
			</a>
		</li>
	{/foreach}
	</ul>
{/if}