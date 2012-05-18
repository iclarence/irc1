<h2>User Menu</h2>
{foreach from=$usermenupages key=key item=menu}
	<a class="link" href="{$menu.url}">{$menu.menuname}</a><br class="hide" />
{/foreach}