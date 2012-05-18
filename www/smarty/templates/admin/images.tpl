{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

	{include file='admin/header.tpl'}
	
	<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> -> 
	<a href="{$url}?op=list">Manage images</a></p>
	<br />
	
	{if $ok}
		<SCRIPT language="JavaScript">
		<!--
		window.location="{$url}?listiid={$listiid}&op=list";
		//-->
		</SCRIPT>
	{/if}
	
	{if $op == 'add' or $errmsg}
	
		{if $op == 'add'}
			<h1>Upload New Image</h1>
		{/if}
	
		{if $errmsg}
			<p>{$errmsg}</p>
		{/if}
		
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
			
		<form name="myForm" action="{$url}" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
		<input type="hidden" name="op" id="op" value="{$op}" />
		<input type="hidden" name="iid" id="iid" value="{$iid}" />
		<input type="hidden" name="listiid" id="listiid" value="{$listiid}" />
		<input type="hidden" name="edit[filename]" id="filename" value="{$edit.filename}" />
		<input type="hidden" name="edit[thumbnail]" id="thumbnail" value="{$edit.thumbnail}" />
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
				<label for="uploadedFile">Select File</label>
			</td>
			<td>
				<input type="file" name="uploadedFile" id="uploadedFile" size="50" maxlength="200" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="uploadedThumbnail">Select Thumbnail</label>
			</td>
			<td>
				<input type="file" name="uploadedThumbnail" id="uploadedThumbnail" size="50" maxlength="200" tabindex="" />
			</td>
		</tr>
		
		<tr>
			<td>
				<label for="linkurl">Link URL</label>
			</td>
			<td>
				<input type="text" name="edit[linkurl]" id="linkurl" value="{$edit.linkurl}" size="100" maxlength="200" tabindex="" />
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
		
		<h1>Managing Images</h1>
	
		<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="9">
		{if $imageList}
			<tr>
				<th>ID</th>
				<th>Identifier</th>
				<th>Image File</th>
				<th>Image</th>
				<th>HTML Code</th>
				<th>Thumbnail File</th>
				<th>Thumbnail</th>
				<th>HTML Code</th>
				<th>Delete</th>
			</tr>
			{foreach from=$imageList key=key item=image}
				<tr>
					<td align="center">{$image.image_id}</td>
					
					<td>{$image.identifier}</td>
					
					<td><a href="{$home}/images/uploads/{$image.filename}" target="_blank">{$image.filename}</a></td>
					
					<td><a href="{$home}/images/uploads/{$image.filename}" target="_blank"><img src="{$home}/images/uploads/{$image.filename}" width="70" border="0" alt="{$image.identifier}" /></a></td>
					
					<td><textarea cols="20" rows="3"><img src="{$home}/images/uploads/{$image.filename}" border="0" width="{$imagewidth}" alt="{$image.identifier}" /></textarea></td>
					
					<td><a href="{$home}/images/uploads/thumbnails/{$image.thumbnail}" target="_blank">{$image.thumbnail}</a></td>
					
					<td><a href="{$home}/images/uploads/thumbnails/{$image.thumbnail}" target="_blank"><img src="{$home}/images/uploads/thumbnails/{$image.thumbnail}" width="50" border="0" alt="{$image.identifier}" /></a></td>
					
					<td><textarea cols="20" rows="3"><img src="{$home}/images/uploads/thumbnails/{$image.thumbnail}" border="0" width="{$thumbnailwidth}" alt="{$image.identifier}" /></textarea></td>
					
					<td>
						<form name="delImage" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="iid" id="iid" value="{$image.image_id}" />
						<input type="hidden" name="listiid" id="listiid" value="{$listiid}" />
						<button type="submit" name="submitDelImage" id="submitDelImage"
							onclick="return confirm('Are you sure you want to delete this image?')">
							delete</button>
						</form>
					</td>
					
				</tr>
			{/foreach}
		{else}
			<tr>
				<td colspan="9"><i>There are no images to view.</i></td>
			</tr>
		{/if}
		
		<tr>
			<td colspan="9" align="right">
			<br />
			<form name="addImage" action="{$url}" method="post">		
			<input type="hidden" name="op" id="op" value="add" />		
			<input type="hidden" name="listiid" id="listiid" value="{$listiid}" />
			<button type="submit" name="submitAddImage" id="submitAddImage">new image</button>		
			</form>
			
			</td>
		</tr>
		</table>
	
	{/if}
			
	{include file='admin/footer.tpl'}
	
{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}