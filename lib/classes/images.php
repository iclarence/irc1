<?php
class images {

	public $image_id = 1;
	public $identifier = '';
	public $filename = '';
	public $width = 0;
	public $height = 0;
	public $imagetype = '';
	public $thumbnail = '';
	public $thumbwidth = 0;
	public $thumbheight = 0;
	public $thumbtype = '';
	public $linkurl = '';
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->identifier = $edit['identifier'];
		$this->filename = $edit['filename'];
		$this->width = $edit['width'];
		$this->height = $edit['height'];
		$this->imagetype = $edit['imagetype'];
		$this->thumbnail = $edit['thumbnail'];
		$this->thumbwidth = $edit['thumbwidth'];
		$this->thumbheight = $edit['thumbheight'];
		$this->thumbtype = $edit['thumbtype'];
		$this->linkurl = $edit['linkurl'];
	}
	
	function edit() {
		$edit['identifier'] = $this->identifier;
		$edit['filename'] = $this->filename;
		$edit['width'] = $this->width;
		$edit['height'] = $this->height;
		$edit['imagetype'] = $this->imagetype;
		$edit['thumbnail'] = $this->thumbnail;
		$edit['thumbwidth'] = $this->thumbwidth;
		$edit['thumbheight'] = $this->thumbheight;
		$edit['thumbtype'] = $this->thumbtype;
		$edit['linkurl'] = $this->linkurl;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->identifier) {$errmsg .= "Please give this image an identifier.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select identifier, filename, width, height, imagetype, thumbnail, thumbwidth, thumbheight, thumbtype, linkurl ";
		$query .= "from images where image_id = " . $this->image_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->identifier = stripslashes($row[0]);
			$this->filename = stripslashes($row[1]);
			$this->width = $row[2];
			$this->height = $row[3];
			$this->imagetype = $row[4];
			$this->thumbnail = stripslashes($row[5]);
			$this->thumbwidth = $row[6];
			$this->thumbheight = $row[7];
			$this->thumbtype = $row[8];
			$this->linkurl = $row[9];
		}
	}
		
	function delete() {	
		$query = "delete from images where image_id = " . $this->image_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "delete from pageimages where image_id = " . $this->image_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function insert() {
		$query1 = "select image_id from images where ";
		$query1 .= "identifier = \"" . stripslashes($this->identifier) . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		if (mysql_num_rows($result1) == 0) {
			$query = "insert into images ";
			$query .= "(identifier, filename, width, height, imagetype, thumbnail, thumbwidth, thumbheight, thumbtype, linkurl)";
			$query .= " values (";
			$query .= "\"" . addslashes($this->identifier) . "\", ";
			$query .= "\"" . addslashes($this->filename) . "\", ";
			$query .= "\"" . $this->width . "\", ";
			$query .= "\"" . $this->height . "\", ";
			$query .= "\"" . $this->imagetype . "\", ";
			$query .= "\"" . addslashes($this->thumbnail) . "\", ";
			$query .= "\"" . $this->thumbwidth . "\", ";
			$query .= "\"" . $this->thumbheight . "\", ";
			$query .= "\"" . $this->thumbtype . "\", ";
			$query .= "\"" . $this->linkurl . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->image_id = $row[0];}
	}
	
	function update() {
		$q1 = "update images set ";
		$q2 = "\" where image_id = " . $this->image_id . ";";
		
		$query = $q1 . "identifier = \"" . addslashes($this->identifier) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "filename = \"" . addslashes($this->filename) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "width = \"" . $this->width . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "height = \"" . $this->height . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "imagetype = \"" . $this->imagetype . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "thumbnail = \"" . addslashes($this->thumbnail) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "thumbwidth = \"" . $this->thumbwidth . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "thumbheight = \"" . $this->thumbheight . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "thumbtype = \"" . $this->thumbtype . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "linkurl = \"" . $this->linkurl . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function getFilePath() {
		if ($this->filename) {
			return $_SESSION['basepath'] . 'www/docs/images/uploads/' . $this->filename;
		}
		else {
			return '';
		}
	}
	
	function getThumbnailPath() {
		if ($this->thumbnail) {
			return $_SESSION['basepath'] . 'www/docs/images/uploads/thumbnails/' . $this->thumbnail;
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
	
	function uploadThumbnail() {	   
		if ($_FILES["uploadedThumbnail"]["error"] == UPLOAD_ERR_OK) {
		   $tmp_name = $_FILES["uploadedThumbnail"]["tmp_name"];
		   $this->thumbnail = $_FILES["uploadedThumbnail"]["name"];
		   move_uploaded_file($tmp_name, $this->getThumbnailPath());
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
	
	function deleteThumbnail() {
		if (file_exists($this->getThumbnailPath())) {
			return unlink($this->getThumbnailPath());
		}
		else {
			return false;
		}
	}
	
	function getImageSizes() {
		if ($this->filename) {
			$size = getimagesize($this->getFilePath());
			$this->width = $size[0];
			$this->height = $size[1];
			$this->imagetype = $size[2];
		}
		if ($this->thumbnail) {
			$thumbsize = getimagesize($this->getThumbnailPath());
			$this->thumbwidth = $thumbsize[0];
			$this->thumbheight = $thumbsize[1];
			$this->thumbtype = $size[2];
		}
	}
}

?>