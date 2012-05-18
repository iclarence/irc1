<ul>
{foreach from=$menupages key=key item=menu}
	<li><a href="{$menu.url}">{$menu.menuname}</a></li>
{/foreach}
</ul>