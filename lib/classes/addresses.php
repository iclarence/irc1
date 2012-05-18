<?php
class addresses {

	public $address_id = 1;
	public $street = '';
	public $district = '';
	public $city = '';
	public $state = '';
	public $zip = '';
	public $country_id = 77;
	public $country = "United Kingdom";
	
	function __construct() {
	}
	
	function __destruct() {
	}	
	
	function post($edit) {
		$this->street = $edit['street'];
		$this->district = $edit['district'];
		$this->city = $edit['city'];
		$this->state = $edit['state'];
		$this->zip = $edit['zip'];
		$this->country_id = $edit['country_id'];
		$this->country = $edit['country'];
	}
	
	function edit() {
		$edit['street'] = $this->street;
		$edit['district'] = $this->district;
		$edit['city'] = $this->city;
		$edit['state'] = $this->state;
		$edit['zip'] = $this->zip;
		$edit['country_id'] = $this->country_id;
		$edit['country'] = $this->country;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->street) {$errmsg .= "Please give the first line of the address.\n";}
		if (!$this->city) {$errmsg .= "Please give the town or city.\n";}
		if (!$this->zip) {$errmsg .= "Please give the post code or zip.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select a.street, a.district, a.city, a.state, a.zip, a.country_id, c.country ";
		$query .= "from addresses a, countries c where a.country_id = c.country_id and a.address_id = ";
		$query .= $this->address_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->street = stripslashes($row[0]);
			$this->district = stripslashes($row[1]);
			$this->city = stripslashes($row[2]);
			$this->state = stripslashes($row[3]);
			$this->zip = stripslashes($row[4]);
			$this->country_id = $row[5];
			$this->country = stripslashes($row[6]);
		}
	}
		
	function delete() {	
		$query = "delete from addresses where address_id = " . $this->address_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function insert() {
		$query1 = "select address_id from addresses where ";
		$query1 .= "street = \"" . stripslashes($this->street) . "\" and ";
		$query1 .= "district = \"" . stripslashes($this->district) . "\" and ";
		$query1 .= "city = \"" . stripslashes($this->city) . "\" and ";
		$query1 .= "state = \"" . stripslashes($this->state) . "\" and ";
		$query1 .= "zip = \"" . stripslashes($this->zip) . "\" and ";
		$query1 .= "country_id = \"" . $this->country_id . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		if (mysql_num_rows($result1) == 0) {
			$query = "insert into addresses ";
			$query .= "(street, district, city, state, zip, country_id)";
			$query .= " values (";
			$query .= "\"" . addslashes($this->street) . "\", ";
			$query .= "\"" . addslashes($this->district) . "\", ";
			$query .= "\"" . addslashes($this->city) . "\", ";
			$query .= "\"" . addslashes($this->state) . "\", ";
			$query .= "\"" . addslashes($this->zip) . "\", ";
			$query .= "\"" . $this->country_id . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->address_id = $row[0];}
	}
	
	function update() {
		$q1 = "update addresses set ";
		$q2 = "\" where address_id = " . $this->address_id . ";";
		
		$query = $q1 . "street = \"" . addslashes($this->street) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "district = \"" . addslashes($this->district) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "city = \"" . addslashes($this->city) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "state = \"" . addslashes($this->state) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "zip = \"" . addslashes($this->zip) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "country_id = \"" . $this->country_id . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
}