{if $announcements[1]}		

	<script type="text/javascript">
	
	{foreach from=$announcements key=key item=menu}
		fadeannouncements[{$key}] = ["Announcement: {$menu.heading|truncate:90}", "{$menu.url}", "_blank"]
	{/foreach}
	
	//new fadeshow(IMAGES_ARRAY_NAME, slideshow_width, slideshow_height, borderwidth, delay, pause (0=no, 1=yes), optionalRandomOrder "R")
	new fadenews(fadeannouncements, 780, 16, 0, 7000, 1) 
	</script>
{elseif $announcements[0]}
	{foreach from=$announcements key=key item=menu}
		{if $menu.url}
			<p><a href="{$menu.url}" target="_blank">
		{/if}
		Announcement: {$menu.heading|truncate:90}
		{if $menu.url}
			</a></p>
		{/if}
	{/foreach}
{/if}