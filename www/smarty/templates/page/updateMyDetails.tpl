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
		
	<form name="registrationForm" action="{$pageurl}" method="post">
	
	<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
	<input type="hidden" name="edit[address_id]" id="address_id" value="{$edit.address_id}" />
	<input type="hidden" name="edit[usertype_id]" id="usertype_id" value="{$edit.usertype_id}" />
	<input type="hidden" name="edit[userlogin]" id="userlogin" value="1" />
	<input type="hidden" name="edit[active]" id="active" value="1" />
	<input type="hidden" name="submitted" id="submitted" value="1" />
	
	<tr>
		<td>
			<label for="title">Title</label>
		<td>
			<select name="edit[title]" id="title">
			
				<option 
					{if $edit.title == 'Mr'}
						selected="selected"
					{/if}
				value="Mr">Mr</option>
			
				<option 
					{if $edit.title == 'Mrs'}
						selected="selected"
					{/if}
				value="Mrs">Mrs</option>
			
				<option 
					{if $edit.title == 'Miss'}
						selected="selected"
					{/if}
				value="Miss">Miss</option>
			
				<option 
					{if $edit.title == 'Ms'}
						selected="selected"
					{/if}
				value="Ms">Ms</option>
			
				<option 
					{if $edit.title == 'Dr'}
						selected="selected"
					{/if}
				value="Dr">Dr</option>
				
			</select>
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="firstname">First Name *</label>
		</td>
		<td>
			<input type="text" name="edit[firstname]" id="firstname" value="{$edit.firstname}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="lastname">Last Name *</label>
		</td>
		<td>
			<input type="text" name="edit[lastname]" id="lastname" value="{$edit.lastname}" size="50" maxlength="100" tabindex="" />
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="username">Username *</label>
		</td>
		<td>
			<input type="text" name="edit[username]" id="username" value="{$edit.username}" size="50" maxlength="100" tabindex="" />
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
		<td>
		<label for="subscription">Subscribe?</label>
		</td>
		<td>
			<input type="checkbox" name="edit[subscription]" id="subscription" value="1" 
			{if $edit.subscription == 1}
				checked="checked" 
			{elseif !$edit.username}
				checked="checked"
			{/if}
			/>
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="language">Language</label>
		<td>
			<select name="edit[language_id]" id="language">
				
				{foreach from=$languages key=key item=language}
					<option 
						{if $edit.language_id == $key}
							selected="selected"
						{elseif !$edit.language_id && $key == 1}
							selected="selected"
						{/if}
					value="{$key}">{$language}</option>
				{/foreach}
				
			</select>
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="timezone">Timezone</label>
		<td>
			<select name="edit[timezone_id]" id="timezone">
				
				{foreach from=$timezones key=key item=timezone}
					<option 
						{if $edit.timezone_id == $key}
							selected="selected"
						{elseif !$edit.timezone_id && $key == 16}
							selected="selected"
						{/if}
					value="{$key}">{$timezone}</option>
				{/foreach}
				
			</select>
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="receivehtml">Receive HTML emails?</label>
		</td>
		<td>
			<input type="checkbox" name="edit[receivehtml]" id="receivehtml" value="1" 
			{if $edit.receivehtml == 1}
				checked="checked" 
			{elseif !$edit.username}
				checked="checked"
			{/if}
			/>
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