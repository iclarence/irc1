<h2>Sub-Pages</h2>
{foreach from=$subpages key=key item=menu}
	<a class="link" href="{$menu.url}">{$menu.menuname}</a><br class="hide" />
{/foreach}