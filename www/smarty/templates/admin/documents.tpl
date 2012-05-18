{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

	{include file='admin/header.tpl'}
	
	<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> -> 
	<a href="{$url}?op=list">Manage documents</a></p>
	<br />
	
	{if $ok}
		<SCRIPT language="JavaScript">
		<!--
		window.location="{$url}?listdid={$listdid}&op=list";
		//-->
		</SCRIPT>
	{/if}
	
	{if $op == 'add' or $errmsg}
	
		{if $op == 'add'}
			<h1>Upload New Document</h1>
		{/if}
	
		{if $errmsg}
			<p>{$errmsg}</p>
		{/if}
		
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
			
		<form name="myForm" action="{$url}" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
		<input type="hidden" name="op" id="op" value="{$op}" />
		<input type="hidden" name="did" id="did" value="{$did}" />
		<input type="hidden" name="listdid" id="listdid" value="{$listdid}" />
		<input type="hidden" name="edit[filename]" id="filename" value="{$edit.filename}" />
		<input type="hidden" name="submitted" id="submitted" value="1" />
		
		<tr>
			<td>
				<label for="identifier">Identifier *</label>
			</td>
			<td>
				<input type="text" name="edit[identifier]" id="identifier" value="{$edit.identifier}" size="50" maxlength="100" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="title">Title</label>
			</td>
			<td>
				<input type="text" name="edit[title]" id="title" value="{$edit.title}" size="100" maxlength="200" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="uploadedFile">Select File</label>
			</td>
			<td>
				<input type="file" name="uploadedFile" id="uploadedFile" size="50" maxlength="200" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<button type="submit" name="submit" tabindex="">upload</button>
			</td>
		</tr>
			
		</form>
		
		</table>
	
	{else}	
		
		<h1>Managing Documents</h1>
	
		<table width="1000" border="0" cellspacing="10" cellpadding="0" cols="6">
		{if $documentList}
			<tr>
				<th>ID</th>
				<th>Identifier</th>
				<th>Title</th>
				<th>Document</th>
				<th>HTML Code</th>
				<th>Delete</th>
			</tr>
			{foreach from=$documentList key=key item=document}
				<tr>
					<td align="center">{$document.document_id}</td>
					
					<td><b>{$document.identifier}</b></td>
					
					<td><i>{$document.title}</i></td>
					
					<td>
						<a href="{$home}/documents/uploads/{$document.filename}" target="_blank">{$document.filename}</a>
					</td>
					
					<td>
						<textarea cols="40" rows="2"><a href="{$home}/documents/uploads/{$document.filename}" target="_blank">{if $document.title}{$document.title}{else}{$document.filename}{/if}</a></textarea>
					</td>					
					
					<td>
						<form name="delDocument" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="did" id="did" value="{$document.document_id}" />
						<input type="hidden" name="listdid" id="listdid" value="{$listdid}" />
						<button type="submit" name="submitDelDocument" id="submitDelDocument"
							onclick="return confirm('Are you sure you want to delete this document?')">
							delete</button>
						</form>
					</td>
					
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="6"><i>There are no documents to view.</i></td>
			</tr>
		{/if}
		
		<tr>
			<td colspan="6" align="right">
			<br />
			<form name="addDocument" action="{$url}" method="post">		
			<input type="hidden" name="op" id="op" value="add" />		
			<input type="hidden" name="listdid" id="listdid" value="{$listdid}" />
			<button type="submit" name="submitAddDocument" id="submitAddDocument">new document</button>		
			</form>
			
			</td>
		</tr>
		</table>
	
	{/if}
			
	{include file='admin/footer.tpl'}
	
{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}