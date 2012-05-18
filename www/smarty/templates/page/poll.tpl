{if $thisPoll}
	<div class="entry">
		<h2>Online Poll: {$thisPoll.poll}</h2>
		{if $thisPoll.alreadyVoted}
			<p>You have already voted in this poll.
			{if $thisPoll.pollResults}
				<ul>
				{foreach from=$ansArray key=i item=ans}
					{if $thisPoll.answers.$i}
						<li>
							{$thisPoll.answers.$i}
							<b>{$thisPoll.pollResults.$i}%</b>
						</li>
					{/if}
				{/foreach}
				</ul>
			{else}
				<p><i>No results yet.</i></p>
			{/if}
		
		{else}
		
			<form name="pollForm" action="{$pageurl}" method="post">
			<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
			<input type="hidden" name="voted" id="voted" value="1" />
			<input type="hidden" name="poll_id" id="poll_id" value="{$thisPoll.poll_id}" />
			
			{foreach from=$ansArray key=i item=ans}
				{if $thisPoll.answers.$i}
					<input type="radio" name="vote" id="vote" value="{$i}">
					{$thisPoll.answers.$i}
					<br />
				{/if}
			{/foreach}			
					
			<input type="submit" name="submit" id="submit" value="vote" />
			</form>
		
		{/if}
		
		<p>
		{if $thisPoll.daysLeft == 0}
			Poll closes today.
		{elseif $thisPoll.daysLeft == 1}
			Poll closes tomorrow.
		{else}
			Poll closes in {$thisPoll.daysLeft} days time.
		{/if}
		</p>
	
		
	<form name="goToResults" action="{$home}/page/{$languageIdentifier}/listpolls/" method="post">
	<input type="submit" name="submit" value="poll results" />
	</form>
	
	</div>
{/if}