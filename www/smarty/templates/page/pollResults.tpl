{foreach from=$pollList key=key item=poll}
	<h2>{$poll.poll}</h2>
	{if $poll.pollResults}
		<ul>
		{foreach from=$ansArray key=i item=ans}
			{if $poll.answers.$i}
				<li>
					{$poll.answers.$i}
					<b>{$poll.pollResults.$i}%</b>
				</li>
			{/if}
		{/foreach}
		</ul>
	{else}
	 	<p><i>No results yet.</i></p>
	{/if}
	<p>
	{if $poll.notYetStarted}
		Coming soon.
	{elseif $poll.pollClosed}
		Poll closed.
	{elseif $poll.daysLeft == 0}
		Poll closes today.
	{elseif $poll.daysLeft == 1}
		Poll closes tomorrow.
	{else}
		Poll closes in {$poll.daysLeft} days time.
	{/if}
	</p>
{/foreach}