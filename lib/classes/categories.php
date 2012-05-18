<?php
class categories {

	public $category_id = 1;
	public $categorytype_id = 0;
	public $category = '';
	public $ordering = 0;
	public $description = '';
	public $parent_id = 0;
	public $created = '';
	public $active = 0;
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->categorytype_id = $edit['categorytype_id'];
		$this->category = $edit['category'];
		$this->ordering = $edit['ordering'];
		$this->description = $edit['description'];
		$this->parent_id = $edit['parent_id'];
		$this->created = $edit['created'];
		$this->active = $edit['active'];
	}
	
	function edit() {
		$edit['categorytype_id'] = $this->categorytype_id;
		$edit['category'] = $this->category;
		$edit['ordering'] = $this->ordering;
		$edit['description'] = $this->description;
		$edit['parent_id'] = $this->parent_id;
		$edit['created'] = $this->created;
		$edit['active'] = $this->active;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->category) {$errmsg .= "Please give this category a name.\n";}
		if (!is_numeric($this->ordering)) {$errmsg .= "The category order needs to be numerical.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select categorytype_id, category, ordering, description, parent_id, created, active ";
		$query .= "from categories where category_id = " . $this->category_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->categorytype_id = $row[0];
			$this->category = stripslashes($row[1]);
			$this->ordering = $row[2];
			$this->description = stripslashes($row[3]);
			$this->parent_id = $row[4];
			$this->created = $row[5];
			$this->active = $row[6];
		}
	}
		
	function delete() {	
		$query = "delete from categories where category_id = " . $this->category_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function insert() {
		$query1 = "select category_id from categories where ";
		$query1 .= "categorytype_id = " . $_SESSION['categorytype_id'] . " and ";
		$query1 .= "category = \"" . stripslashes($this->category) . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		if (mysql_num_rows($result1) == 0) {
			$query = "insert into categories ";
			$query .= "(categorytype_id, category, ordering, description, parent_id, created, active)";
			$query .= " values (";
			$query .= "\"" . $_SESSION['categorytype_id'] . "\", ";
			$query .= "\"" . addslashes($this->category) . "\", ";
			$query .= "\"" . $this->ordering . "\", ";
			$query .= "\"" . addslashes($this->description) . "\", ";
			$query .= "\"" . $this->parent_id . "\", ";
			$query .= "\"" . $_SESSION['datetimeNow'] . "\", ";
			$query .= "\"" . $this->active . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->category_id = $row[0];}
	}
	
	function activate() {
		$query = "select active from categories where category_id = " . $this->category_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->active = $row[0];
		}
		$query = "update categories set active = \"" . (($this->active == 1) ? 0 : 1);
		$query .= "\" where category_id = " . $this->category_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function update() {
		$q1 = "update categories set ";
		$q2 = "\" where category_id = " . $this->category_id . ";";
		
		$query = $q1 . "categorytype_id = \"" . $_SESSION['categorytype_id'] . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "category = \"" . addslashes($this->category) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "ordering = \"" . $this->ordering . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "description = \"" . addslashes($this->description) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "active = \"" . $this->active . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
}

?>