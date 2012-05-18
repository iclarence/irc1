<h2>Co-pages</h2>
{foreach from=$copages key=key item=menu}
	<a class="link" href="{$menu.url}">{$menu.menuname}</a><br class="hide" />
{/foreach}