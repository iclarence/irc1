{if $ok}
	<p>Your details have been updated.</p>
	<form name="redirectHome" action="{$home}/page/{$languageIdentifier}/home" method="post">
	<input type="submit" name="submit" id="submit" value="continue" />					
	</form>
	
{else}

	{if $errmsg}
		<p>{$errmsg}</p>
	{/if}
	
	<table width="700" border="0" cellspacing="5" cellpadding="0" cols="2">	
		
	<form name="newVenueForm" action="{$pageurl}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="edit[address_id]" id="address_id" value="{$edit.address_id}" />
	<input type="hidden" name="edit[usertype_id]" id="usertype_id" value="{$edit.usertype_id}" />
	<input type="hidden" name="edit[userlogin]" id="userlogin" value="1" />
	<input type="hidden" name="edit[active]" id="active" value="1" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
	
	<tr>
		<td>
			<label for="companyname">Venue Name *</label>
		</td>
		<td>
			<input type="text" name="edit[companyname]" id="companyname" value="{$edit.companyname}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="email">Email Address *</label>
		</td>
		<td>
			<input type="text" name="edit[email]" id="email" value="{$edit.email}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="phone">Telephone Number *</label>
		</td>
		<td>
			<input type="text" name="edit[phone]" id="phone" value="{$edit.phone}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="mobile">Mobile Number</label>
		</td>
		<td>
			<input type="text" name="edit[mobile]" id="mobile" value="{$edit.mobile}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="fax">Fax Number</label>
		</td>
		<td>
			<input type="text" name="edit[fax]" id="fax" value="{$edit.fax}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="website">Website URL</label>
		</td>
		<td>
			<input type="text" name="edit[website]" id="website" value=
			{if $edit.website}
				"{$edit.website}"
			{else}
				"http://"
			{/if}
			 size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="street">Address Line 1 *</label>
		</td>
		<td>
			<input type="text" name="edit[street]" id="street" value="{$edit.street}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="district">Address Line 2</label>
		</td>
		<td>
			<input type="text" name="edit[district]" id="district" value="{$edit.district}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="city">Town / City *</label>
		</td>
		<td>
			<input type="text" name="edit[city]" id="city" value="{$edit.city}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="state">County / State</label>
		</td>
		<td>
			<input type="text" name="edit[state]" id="state" value="{$edit.state}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="zip">Post Code / Zip *</label>
		</td>
		<td>
			<input type="text" name="edit[zip]" id="zip" value="{$edit.zip}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="country">Country</label>
		<td>
			<select name="edit[country_id]" id="country">
				
				{foreach from=$countries key=key item=country}
					<option 
						{if $edit.country_id == $key}
							selected="selected"
						{elseif !$edit.country_id && $key == 77}
							selected="selected"
						{/if}
					value="{$key}">{$country}</option>
				{/foreach}
				
			</select>
		</td>
	</tr>
	
	<tr>
	<td></td>
	<td>
	<input type="submit" name="submit" value="submit" tabindex="" />
	</td>
	</tr>
		
	</form>
	
	</table>
{/if}