{if $thispage.imagedetails[1]}		

	<script type="text/javascript">
	
	{foreach from=$thispage.imagedetails key=key item=image}
		fadeimages[{$key}] = ["{$home}/images/uploads/{$image.filename}", "{$image.linkurl}", "_blank"]
	{/foreach}
	
	//new fadeshow(IMAGES_ARRAY_NAME, slideshow_width, slideshow_height, borderwidth, delay, pause (0=no, 1=yes), optionalRandomOrder "R")
	new fadeshow(fadeimages, {$imagewidth}, {$imageheight}, 0, 3000, 1, "Read More", 30) 
	</script>
{elseif $thispage.imagedetails[0]}
	{foreach from=$thispage.imagedetails key=key item=image}
		{if $image.linkurl}
			<a href="{$image.linkurl}" target="_blank">
		{/if}
		<img class="entryphoto" src="{$home}/images/uploads/{$image.filename}" width="{$imagewidth}" alt="{$image.identifier}" />
		{if $image.linkurl}
			</a><p><a href="{$image.linkurl}" target="_blank">Read More</a></p>
		{/if}
	{/foreach}
{/if}