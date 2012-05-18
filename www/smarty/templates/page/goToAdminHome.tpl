{if $me.usertype == 'superuser' || $me.usertype == 'administrator'}
	<form action="{$home}/admin/index.php" method="post">
	<input type="submit" name="adminHome" value="Admin" />
	</form>
{/if}