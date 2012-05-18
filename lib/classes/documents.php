<?php
class documents {

	public $document_id = 1;
	public $identifier = '';
	public $title = '';
	public $filename = '';
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->identifier = $edit['identifier'];
		$this->title = $edit['title'];
		$this->filename = $edit['filename'];
	}
	
	function edit() {
		$edit['identifier'] = $this->identifier;
		$edit['title'] = $this->title;
		$edit['filename'] = $this->filename;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->identifier) {$errmsg .= "Please give this document an identifier.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select identifier, title, filename ";
		$query .= "from documents where document_id = " . $this->document_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->identifier = stripslashes($row[0]);
			$this->title = stripslashes($row[1]);
			$this->filename = stripslashes($row[2]);
		}
	}
		
	function delete() {	
		$query = "delete from documents where document_id = " . $this->document_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			
		$query = "delete from pagedocuments where document_id = " . $this->document_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function insert() {
		$query1 = "select document_id from documents where ";
		$query1 .= "identifier = \"" . stripslashes($this->identifier) . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		if (mysql_num_rows($result1) == 0) {
			$query = "insert into documents (identifier, title, filename) values (";
			$query .= "\"" . addslashes($this->identifier) . "\", ";
			$query .= "\"" . addslashes($this->title) . "\", ";
			$query .= "\"" . addslashes($this->filename) . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->document_id = $row[0];}
	}
	
	function update() {
		$q1 = "update documents set ";
		$q2 = "\" where document_id = " . $this->document_id . ";";
		
		$query = $q1 . "identifier = \"" . addslashes($this->identifier) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "title = \"" . addslashes($this->title) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "filename = \"" . addslashes($this->filename) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function getFilePath() {
		if ($this->filename) {
			return $_SESSION['basepath'] . 'www/docs/documents/uploads/' . $this->filename;
		}
		else {
			return '';
		}
	}
	
	function uploadFile() {	   
		if ($_FILES["uploadedFile"]["error"] == UPLOAD_ERR_OK) {
		   $tmp_name = $_FILES["uploadedFile"]["tmp_name"];
		   $this->filename = $_FILES["uploadedFile"]["name"];
		   move_uploaded_file($tmp_name, $this->getFilePath());
		   return true;
		}
		else {
			return false;
		}
	}
	
	function deleteFile() {
		if (file_exists($this->getFilePath())) {
			return unlink($this->getFilePath());
		}
		else {
			return false;
		}
	}
}

?>