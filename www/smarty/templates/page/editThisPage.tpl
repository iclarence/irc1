{if $me.usertype == 'superuser' || $me.usertype == 'administrator'}
	<form action="{$home}/admin/pages.php" method="post">
	<input type="hidden" name="op" id="op" value="edit" />
	<input type="hidden" name="pid" id="pid" value="{$page_id}" />
	<input type="hidden" name="listpid" id="listpid" value="{$thispage.parent_id}" />
	<input type="hidden" name="langid" id="langid" value="{$langid}" />
	<input type="submit" name="editPage" value="Edit" />
	</form>
{/if}