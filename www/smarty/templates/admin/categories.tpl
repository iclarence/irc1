{if $authenticated && $me.usertype == 'superuser' || $me.usertype == 'administrator'}

{include file='admin/header.tpl'}

<p><a href="{$home}">Home</a> -> <a href="{$home}/admin/index.php">Admin home</a> 
	-> <a href="{$url}?op=list">Manage categories</a>
{foreach from=$p key=key item=citem}
	-> <a href="{$url}?listcid={$citem.id}&amp;op=list&amp;categorytype_id={$categorytype_id}">
	{if $citem.id == 0}
		Top Level Categories</a>
	{else}
		Subcategories of {$citem.category}</a>
	{/if}
{/foreach}
</p>
<br />	

<table width="1000" border="0" cellspacing="5" cellpadding="0">

<tr>
<td width="150"><b><u>Category Type:</u></b></td>
<td>

<form name="dummyForm" action="{$url}" method="post">
<select name="dummy" onchange="location.href=this.options[this.selectedIndex].value">
{foreach from=$categoryType key=key item=catType}
	<option 
	{if $categorytype_id == $key}
		selected = "selected"
	{/if}
	value="{$url}?listcid=0&amp;cid=0&amp;op={$op}&amp;categorytype_id={$key}">{$catType}</option>
{/foreach}
</select>
</form>

</td>
</tr>

</table>
<br />

{if $ok}
	<script language="JavaScript">
	<!--
	window.location="{$url}?listcid={$listcid}&op=list&categorytype_id={$categorytype_id}";
	//-->
	</script>
{/if}

{if $op == 'edit' or $op == 'add' or $errmsg}

	{if $op == 'edit'}
		<h1>Editing "{$edit.category}"</h1>
	{elseif $op == 'add'}
		{if $thisCategory}
			<h1>New Category: Subcategory of {$thisCategory.category}</h1>
		{else}
			<h1>New Top Level Category</h1>
		{/if}
	{/if}

	{if $errmsg}
		<p>{$errmsg}</p>
	{/if}
	
	<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="2">
	
		
	<form name="myForm" action="{$url}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="op" id="op" value="{$op}" />
	<input type="hidden" name="cid" id="cid" value="{$cid}" />
	<input type="hidden" name="listcid" id="listcid" value="{$listcid}" />
	<input type="hidden" name="categorytype_id" id="categorytype_id" value="{$categorytype_id}" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
		
	<tr>
	<td>
	<label for="category">Category *</label>
	</td>
	<td>
	<input type="text" name="edit[category]" id="category" value="{$edit.category}" size="90" maxlength="100" tabindex="" />
	</td>
	</tr>
		
	<tr>
	<td>
	<label for="ordering">Category Order *</label>
	</td>
	<td>
	<input type="text" name="edit[ordering]" id="ordering" value="{$edit.ordering}" size="25" maxlength="100" tabindex="" />
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="description">Description</label>
	</td>
	<td>
	<textarea name="edit[description]" id="description" cols="68" rows="10" tabindex="">{$edit.description}</textarea>
	</td>
	</tr>
	
	<tr>
	<td>
	<label for="active">Active</label>
	</td>
	<td>
	{if $edit.active == 1}
		<input type="checkbox" name="edit[active]" id="active" value="1" checked="checked" />
	{else}
		<input type="checkbox" name="edit[active]" id="active" value="1" />
	{/if}
	</td>
	</tr>
	
	<tr>
	<td></td>
	<td>
	<button type="submit" name="submit" tabindex="">submit</button>
	</td>
	</tr>
		
	</form>
	
	</table>

{else}

	{if $thisCategory}
		<h1>Managing Subcategories of {$thisCategory.category}</h1>
	{else}
		<h1>Managing Top Level Categories</h1>
	{/if}

	<table width="1000" border="0" cellspacing="5" cellpadding="0" cols="7">
	{if $categoryList}
		<tr>
			<th>ID</th>
			<th>Category Name</th>
			<th>Order</th>
			<th>Activate</th>
			<th>Edit</th>
			<th>Delete</th>
			<th>Subcategories</th>
		</tr>
		{foreach from=$categoryList key=key item=category}
			<tr>
				<td align="center">{$category.category_id}</td>
				
				<td align="center"><b>{$category.category}</b></td>
				
				<td align="center">{$category.ordering}</td>
				
				<td>
					<form name="activateCategory" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="act" />
					<input type="hidden" name="cid" id="cid" value="{$category.category_id}" />
					<input type="hidden" name="listcid" id="listcid" value="{$listcid}" />
					<input type="hidden" name="categorytype_id" id="categorytype_id" value="{$categorytype_id}" />
					{if $category.active == 1}
						<button type="submit" name="submitDectivateCategory" id="submitDeactivateCategory"
							onclick="return confirm('Are you sure you want to deactivate {$category.category}?')">
							deactivate</button>
					{elseif $category.active == 0}
						<button type="submit" name="submitActivateCategory" id="submitActivateCategory"
							onclick="return confirm('Are you sure you want to activate {$category.category}?')">
							activate</button>
					{/if}
					</form>
				</td>
				
				<td>
					<form name="editCategory" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="edit" />
					<input type="hidden" name="cid" id="cid" value="{$category.category_id}" />
					<input type="hidden" name="listcid" id="listcid" value="{$listcid}" />
					<input type="hidden" name="categorytype_id" id="categorytype_id" value="{$categorytype_id}" />
					<button type="submit" name="submitEditCategory" id="submitEditCategory">edit</button>
					</form>
				</td>
				
				<td>
					{if $category.subcategories == 0}
						<form name="delCategory" action="{$url}" method="post">
						<input type="hidden" name="op" id="op" value="del" />
						<input type="hidden" name="cid" id="cid" value="{$category.category_id}" />
						<input type="hidden" name="listcid" id="listcid" value="{$listcid}" />
						<input type="hidden" name="categorytype_id" id="categorytype_id" value="{$categorytype_id}" />
						<button type="submit" name="submitDelCategory" id="submitDelCategory"
							onclick="return confirm('Are you sure you want to delete {$category.category}?')">
							delete</button>	
						</form>
					{elseif $category.subcategories == 1}
						<i>{$category.subcategories} subcategory</i>
					{else}
						<i>{$category.subcategories} subcategories</i>
					{/if}
				</td>
				
				<td>
					<form name="viewSubCategories" action="{$url}" method="post">
					<input type="hidden" name="op" id="op" value="list" />
					<input type="hidden" name="cid" id="cid" value="{$category.category_id}" />
					<input type="hidden" name="listcid" id="listcid" value="{$category.category_id}" />
					<input type="hidden" name="categorytype_id" id="categorytype_id" value="{$categorytype_id}" />
					<button type="submit" name="submitViewSubCategories" id="submitViewSubCategories">subcategories</button>			
					</form>
				</td>
				
			</tr>
		{/foreach}
	{else}
		<tr>
			<td colspan="7"><i>There are no categories to view.</i></td>
		</tr>
	{/if}
	
	<tr>
		<td colspan="7" align="right">
		<br />
		<form name="addCategory" action="{$url}" method="post">		
		<input type="hidden" name="op" id="op" value="add" />		
		<input type="hidden" name="listcid" id="listcid" value="{$listcid}" />
		<input type="hidden" name="categorytype_id" id="categorytype_id" value="{$categorytype_id}" />
		<button type="submit" name="submitAddCategory" id="submitAddCategory">add category</button>		
		</form>
		
		</td>
	</tr>
	
	<tr>
		<td colspan="7">
		Only categories with no subcategories can be deleted. Subcategories must be deleted first.
		</td>
	</tr>
	
	</table>

{/if}

<br />

<table width="1000" border="0" cellspacing="5" cellpadding="0">

<tr>
<td width="150"><b><u>Category Type:</u></b></td>
<td>

<form name="dummyForm" action="{$url}" method="post">
<select name="dummy" onchange="location.href=this.options[this.selectedIndex].value">
{foreach from=$categoryType key=key item=catType}
	<option 
	{if $categorytype_id == $key}
		selected = "selected"
	{/if}
	value="{$url}?listcid=0&amp;cid=0&amp;op={$op}&amp;categorytype_id={$key}">{$catType}</option>
{/foreach}
</select>
</form>

</td>
</tr>

</table>
		
{include file='admin/footer.tpl'}

{else}

	<p>Sorry. You are not authorized to view this page.</p>
	
{/if}