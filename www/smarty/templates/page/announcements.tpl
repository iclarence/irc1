{if $announcements}
	<div class="entry">
		<h2>Announcements</h2>
		<ul>
			{foreach from=$announcements key=key item=menu}
				<li><a href="{$menu.url}">{$menu.heading}</a></li>
			{/foreach}
		</ul>
	</div>
{/if}