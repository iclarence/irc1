
</div>

<div id="right">

	{include file='page/dateAndTime.tpl'}
	
	<h2>Search</h2>
	<p class="intro">
		{include file='page/searchForm.tpl'}
	</p>
	
	<p>
		{include file='page/advancedSearchButton.tpl'}
	</p>
	
	{if !$authenticated}
		<h2>Subscribe</h2>
		<p class="intro">
			{include file='page/subscription.tpl'}
		</p>
	{/if}
	
	<h2>Login</h2>
	<p class="intro">
		{include file='page/login.tpl'}
	</p>
	
	<div class="subcontainer">
		<div class="rightsub3">
		
			{if $copages[1] && $thispage.homepage == 0 && $thispage.newsitem == 0}
				{include file='page/copages.tpl'}
			{/if}
			
			{if $subpages[0] && $thispage.homepage == 0 && $thispage.newspage == 0}
				{include file='page/subpages.tpl'}
			{/if}
			
			{if $usermenupages[0]}
				{include file='page/userMenu.tpl'}
			{/if}
	
			{if $me.usertype == 'superuser' || $me.usertype == 'administrator'}
			
				<h2>Administrative</h2>
			
				{include file='page/editThisPage.tpl'}
				{include file='page/goToAdminHome.tpl'}
				{include file='page/goToListOfPages.tpl'}
				{include file='page/goToListOfUsers.tpl'}
			
			{/if}
		
		</div>
	</div>
	
</div>

<div id="footer">
	<h2 class="hide">Site info</h2>
	<span>{$sitename}</span><br />
	&copy; {$thisyear} {$sitename} |
		<a href="{$home}/page/{$languageIdentifier}/sitemap/">Site Map</a> |
		<a href="{$home}/page/{$languageIdentifier}/tac/">Terms and Conditions</a> |
		CMS by <a href="http://www.iclarence.com" target="_blank">iClarence.Com</a> | 
		Design by <a href="http://andreasviklund.com" target="_blank">Andreas Viklund</a> | 
		Valid: <a href="http://validator.w3.org/check?uri=referer" target="_blank">XHTML 1.1</a> / 
		<a href="http://jigsaw.w3.org/css-validator/check/referer" target="_blank">CSS</a> / AA / 508
</div>
</div>
</div>
</body>
</html>