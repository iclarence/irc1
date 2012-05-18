{include file='admin/header.tpl'}

<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a></p>
<br />

<p>{$logoutMsg}</p>
<form name="redirectHome" action="{$home}/page/{$languageIdentifier}/home" method="post">
<button type="submit" name="submit" id="submit" value="continue">continue</button>				
</form>

{include file='admin/footer.tpl'}