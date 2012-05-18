<p>
{foreach from=$breadcrumb key=key item=bcrumb}
	&gt; <a href="{$bcrumb.url}">{$bcrumb.menuname}</a>	
{/foreach}
</p>