{include file='page/header.tpl'}
	
	{if $error404}					
		{include file='page/notFound404.tpl'}
		
	{elseif $thispage.homepage == 1}					
		{include file='page/homepage.tpl'}
		
	{else}
	
		{include file='page/viewPage.tpl'}
		
		{if $thispage.listpage == 1}
			{include file='page/listPage.tpl'}
			
		{elseif $thispage.newspage == 1}
			{include file='page/newsList.tpl'}
			
		{/if}
		
		{if $thispage.identifier == 'register'}
			{include file='page/registrationForm.tpl'}
			
		{elseif $thispage.identifier == 'contact'}
			{include file='page/contactForm.tpl'}
			
		{elseif $thispage.identifier == 'searchresults'}
			{include file='page/searchResults.tpl'}
						
		{elseif $thispage.identifier == 'advsearch'}
			{include file='page/advancedSearch.tpl'}
						
		{elseif $thispage.identifier == 'logout'}
			{include file='page/logout.tpl'}
					
		{elseif $thispage.identifier == 'forgotten'}
			{include file='page/forgottenPassword.tpl'}
					
		{elseif $thispage.identifier == 'activate'}
			{include file='page/activation.tpl'}
						
		{elseif $thispage.identifier == 'unsubscribe'}
			{include file='page/unsubscription.tpl'}
												
		{elseif $thispage.identifier == 'mydetails'}
			{include file='page/myDetails.tpl'}
						
		{elseif $thispage.identifier == 'updatedetails'}
			{include file='page/updateMyDetails.tpl'}
						
		{elseif $thispage.identifier == 'newvenue'}
			{include file='page/addNewVenue.tpl'}
						
		{elseif $thispage.identifier == 'newpoll'}
			{include file='page/addNewPoll.tpl'}
						
		{elseif $thispage.identifier == 'listpolls'}
			{include file='page/pollResults.tpl'}
			
		{elseif $thispage.identifier == 'changepassword'}
			{include file='page/changePassword.tpl'}
			
		{elseif $thispage.identifier == 'sitemap'}
			{include file='page/sitemap.tpl'}
			
		{/if}
		
	{/if}
	
{include file='page/footer.tpl'}
