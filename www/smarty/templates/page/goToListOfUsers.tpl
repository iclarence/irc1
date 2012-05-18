{if $me.usertype == 'superuser' || $me.usertype == 'administrator'}
	<form action="{$home}/admin/users.php" method="post">
	<input type="hidden" name="op" id="op" value="list" />
	<input type="hidden" name="listuid" id="listuid" value="0" />
	<input type="submit" name="manageUsers" value="Users" />
	</form>
{/if}