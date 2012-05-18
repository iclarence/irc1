<?php
class pages {

	public $page_id = 1;
	public $identifier = '';
	public $title = '';
	public $keywords = '';
	public $description = '';
	public $menuname = '';
	public $heading = '';
	public $introduction = '';
	public $content = '';
	public $pageorder = 1;
	public $parent_id = 0;
	public $created = '';
	public $active = 0;
	public $newspage = 0;
	public $newsitem = 0;
	public $newsdate = '';
	public $announcement = 0;
	public $inmenu = 1;
	public $inusermenu = 0;
	public $homepage = 0;
	public $listpage = 0;
	public $visibleto = array();
	public $pageurl = '';
	public $core = 0;
	public $imagelist = array();
	public $documentlist = array();
	public $imagedetails = array();
	public $documentdetails = array();
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->identifier = $edit['identifier'];
		$this->title = $edit['title'];
		$this->keywords = $edit['keywords'];
		$this->description = $edit['description'];
		$this->menuname = $edit['menuname'];
		$this->heading = $edit['heading'];
		$this->introduction = $edit['introduction'];
		$this->content = $edit['content'];
		$this->pageorder = $edit['pageorder'];
		$this->parent_id = $edit['parent_id'];
		$this->created = $edit['created'];
		$this->active = $edit['active'];
		$this->newspage = $edit['newspage'];
		$this->newsitem = $edit['newsitem'];
		$this->newsdate = $edit['newsdate'];
		$this->announcement = $edit['announcement'];
		$this->inmenu = $edit['inmenu'];
		$this->inusermenu = $edit['inusermenu'];
		$this->homepage = $edit['homepage'];
		$this->listpage = $edit['listpage'];
		$this->visibleto = $edit['visibleto']; 
		$this->core = $edit['core']; 
		$this->imagelist = $edit['imagelist'];
		$this->documentlist = $edit['documentlist']; 
		$this->imagedetails = $edit['imagedetails'];
		$this->documentdetails = $edit['documentdetails'];   
	}
	
	function edit() {
		$edit['identifier'] = $this->identifier;
		$edit['title'] = $this->title;
		$edit['keywords'] = $this->keywords;
		$edit['description'] = $this->description;
		$edit['menuname'] = $this->menuname;
		$edit['heading'] = $this->heading;
		$edit['introduction'] = $this->introduction;
		$edit['content'] = $this->content;
		$edit['pageorder'] = $this->pageorder;
		$edit['parent_id'] = $this->parent_id;
		$edit['created'] = $this->created;
		$edit['active'] = $this->active;
		$edit['newspage'] = $this->newspage;
		$edit['newsitem'] = $this->newsitem;
		$edit['newsdate'] = $this->newsdate;
		$edit['announcement'] = $this->announcement;
		$edit['inmenu'] = $this->inmenu;
		$edit['inusermenu'] = $this->inusermenu;
		$edit['homepage'] = $this->homepage;
		$edit['listpage'] = $this->listpage;
		$edit['visibleto'] = $this->visibleto;
		$edit['core'] = $this->core;
		$edit['imagelist'] = $this->imagelist;
		$edit['documentlist'] = $this->documentlist;
		$edit['imagedetails'] = $this->imagedetails;
		$edit['documentdetails'] = $this->documentdetails;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->identifier) {$errmsg .= "Please give this page an identifier string.\n";}
		if ($_POST['op'] == 'add') {
			$query = "select page_id from pages where identifier = \"" . addslashes(strtolower($this->identifier)) . "\";";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			if (mysql_num_rows($result) > 0) {
				$errmsg .= "Identifier " . addslashes(strtolower($this->identifier));
				$errmsg .= " already in use. Must be unique. Please choose another.\n";
			}
		}
		if (is_numeric($this->identifier)) {$errmsg .= "The page identifier cannot be numerical.\n";}
		if (isset($this->pageorder) && !is_numeric($this->pageorder)) {$errmsg .= "The page order must be numerical.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select identifier, pageorder, parent_id, created, active, newspage, ";
		$query .= "newsitem, newsdate, announcement, inmenu, inusermenu, homepage, listpage, core ";
		$query .= "from pages where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->identifier = stripslashes($row[0]);
			$this->pageorder = $row[1];
			$this->parent_id = $row[2];
			$this->created = $row[3];
			$this->active = $row[4];
			$this->newspage = $row[5];
			$this->newsitem = $row[6];
			$this->newsdate = $row[7];
			$this->announcement = $row[8];
			$this->inmenu = $row[9];
			$this->inusermenu = $row[10];
			$this->homepage = $row[11];
			$this->listpage = $row[12];
			$this->core = $row[13];
		}
		
		$query = "select m.title, m.keywords, m.description, l.menuname, l.heading, ";
		$query .= "l.introduction, l.content ";
		$query .= "from languagepages l, metadata m ";
		$query .= "where l.language_id = " . $_SESSION['langid'];
		$query .= " and l.metadata_id = m.metadata_id and l.page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->title = stripslashes($row[0]);
			$this->keywords = stripslashes($row[1]);
			$this->description = stripslashes($row[2]);
			$this->menuname = stripslashes($row[3]);
			$this->heading = stripslashes($row[4]);
			$this->introduction = stripslashes($row[5]);
			$this->content = stripslashes($row[6]);
		}
		
		$query = "select usertype_id, visible from pageusertypes where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->visibleto[$row[0]] = $row[1];
		}
		
		$query = "select image_id from pageimages where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->imagelist[$row[0]] = $row[0];
		}
		
		$query = "select document_id from pagedocuments where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->documentlist[$row[0]] = $row[0];
		}
	}
	
	function deleteimage() {
		$query = "delete from pageimages where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function deletedocument() {
		$query = "delete from pagedocuments where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function deletevisible() {
		$query = "delete from pageusertypes where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
		
	function delete() {		
		$this->deleteimage();	
		$this->deletedocument();
		$this->deletevisible();
		
		$query = "delete from metadata where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "delete from languagepages where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "delete from pages where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function updateimage() {
		$this->deleteimage();
		if(count($this->imagelist) > 0) {
			foreach ($this->imagelist as $key => $image_id) {
				$query = "insert into pageimages (image_id, page_id) values (";
				$query .= $image_id . ", " . $this->page_id . ");";
				$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			}
		}
	}
	
	function updatedocument() {
		$this->deletedocument();
		if(count($this->documentlist) > 0) {
			foreach ($this->documentlist as $key => $document_id) {
				$query = "insert into pagedocuments (document_id, page_id) values (";
				$query .= $document_id . ", " . $this->page_id . ");";
				$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			}
		}
	}
	
	function updatevisible() {
		$this->deletevisible();
			
		$query = "select usertype_id, usertype from usertypes where usertype <> \"superuser\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$userType[$row[0]] = $row[1];
		}
		
		foreach ($userType as $key=>$utype) {
			$query = "insert into pageusertypes (page_id, usertype_id, visible) values (";
			$query .= $this->page_id . ", " . $key . ", ";
			$query .= (is_numeric($this->visibleto[$key]) ? $this->visibleto[$key] : 0) . ");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		}
	}
	
	function insertMetadata() {
		$query = "delete from metadata where page_id = ";
		$query .= $this->page_id . " and language_id = " . $_SESSION['langid'] . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "insert into metadata ";
		$query .= "(title, keywords, description, page_id, language_id) values(";
		$query .= "\"" . addslashes($this->title) . "\", ";
		$query .= "\"" . addslashes($this->keywords) . "\", ";
		$query .= "\"" . addslashes($this->description) . "\", ";
		$query .= "\"" . $this->page_id . "\", ";
		$query .= "\"" . $_SESSION['langid'] . "\");";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "select metadata_id from metadata where page_id = ";
		$query .= $this->page_id . " and language_id = " . $_SESSION['langid'] . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$metadata_id = $row[0];
		}
		return $metadata_id;
	}
	
	function insertLanguagepages($metadata_id) {
		$query = "delete from languagepages where page_id = ";
		$query .= $this->page_id . " and language_id = " . $_SESSION['langid'] . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "insert into languagepages ";
		$query .= "(page_id, language_id, metadata_id, menuname, heading, introduction, content)";
		$query .= " values (";
		$query .= "\"" . $this->page_id . "\", ";
		$query .= "\"" . $_SESSION['langid'] . "\", ";
		$query .= "\"" . $metadata_id . "\", ";
		$query .= "\"" . addslashes($this->menuname) . "\", ";
		$query .= "\"" . addslashes($this->heading) . "\", ";
		$query .= "\"" . addslashes($this->introduction) . "\", ";
		$query .= "\"" . addslashes($this->content) . "\");";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function insert() {
		$query1 = "select page_id from pages where ";
		$query1 .= "identifier = \"" . stripslashes($this->identifier) . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		if (mysql_num_rows($result1) == 0) {
			$query = "insert into pages ";
			$query .= "(identifier, pageorder, parent_id, created, active, ";
			$query .= "newspage, newsitem, newsdate, announcement, inmenu, inusermenu, homepage, listpage)";
			$query .= " values (";
			$query .= "\"" . addslashes(strtolower($this->identifier)) . "\", ";
			$query .= "\"" . $this->pageorder . "\", ";
			$query .= "\"" . $this->parent_id . "\", ";
			$query .= "\"" . $_SESSION['datetimeNow'] . "\", ";
			$query .= "\"" . $this->active . "\", ";
			$query .= "\"" . $this->newspage . "\", ";
			$query .= "\"" . $this->newsitem . "\", ";
			$query .= "\"" . $this->newsdate . "\", ";
			$query .= "\"" . $this->announcement . "\", ";
			$query .= "\"" . $this->inmenu . "\", ";
			$query .= "\"" . $this->inusermenu . "\", ";
			$query .= "\"" . $this->homepage . "\", ";
			$query .= "\"" . $this->listpage . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->page_id = $row[0];}
		
		$metadata_id = $this->insertMetadata();
		$this->insertLanguagepages($metadata_id);		
			
		$this->updatevisible();			
		$this->updateimage();			
		$this->updatedocument();
	}
	
	function activate() {
		$query = "select active from pages where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->active = $row[0];
		}
		$query = "update pages set active = \"" . (($this->active == 1) ? 0 : 1);
		$query .= "\" where page_id = " . $this->page_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function update() {
		$metadata_id = $this->insertMetadata();
		$this->insertLanguagepages($metadata_id);
		
		$q1 = "update pages set ";
		$q2 = "\" where page_id = " . $this->page_id . ";";
		
		$query = $q1 . "identifier = \"" . addslashes(strtolower($this->identifier)) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "pageorder = \"" . $this->pageorder . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "active = \"" . $this->active . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "newspage = \"" . $this->newspage . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "newsitem = \"" . $this->newsitem . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "newsdate = \"" . $this->newsdate . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "announcement = \"" . $this->announcement . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "inmenu = \"" . $this->inmenu . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "inusermenu = \"" . $this->inusermenu . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "homepage = \"" . $this->homepage . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "listpage = \"" . $this->listpage . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$this->updatevisible();			
		$this->updateimage();			
		$this->updatedocument();
	}
	
	function getIdentifierArray() {
		$identifier = $this->identifier;
		$identifierArray = array();
		$identifierArray[] = $identifier;
		while ($identifier <> '') {
			$query = "select p1.identifier from pages p1, pages p2 ";
			$query .= "where p1.page_id = p2.parent_id and p2.identifier = \"" . $identifier . "\";";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			if ($row = mysql_fetch_row($result)) {
				$identifier = $row[0];
			}
			else {
				$identifier = '';
			}
			$identifierArray[] = $identifier;
		}
		return array_reverse($identifierArray);
	}
	
	function composeUrl() {
		$identifierArray = $this->getIdentifierArray();
		
		$query = "select identifier from languages where language_id = " . $_SESSION['langid'] . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$languageIdentifier = $row[0];
		}
		$this->pageurl = 
			"http://" . $_SERVER['HTTP_HOST'] . "/page/" . $languageIdentifier . implode('/', $identifierArray).'/';		
		return $this->pageurl;
	}
	
	function composeUrlNewLang($languageIdentifier) {
		$identifierArray = $this->getIdentifierArray();
		$this->pageurl = 
			"http://" . $_SERVER['HTTP_HOST'] . "/page/" . $languageIdentifier . implode('/', $identifierArray).'/';		
		return $this->pageurl;
	}
	
	function getLanguageArray() {	
		$query = "select l.identifier, l.language from languages l, languagepages p ";
		$query .= "where l.active = 1 and l.language_id = p.language_id and p.page_id = " . $this->page_id;
		$query .= " order by l.ordering;";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		$key = 0;
		$languageArray = array();
		while ($row = mysql_fetch_row($result)) {
			$languageArray[$key]['identifier'] = $row[0];
			$languageArray[$key]['url'] = $this->composeUrlNewLang($row[0]);
			$languageArray[$key]['language'] = $row[1];
			$key++;
		}
		return $languageArray;
	}
	
	// Search engine: searches page content, page headings and page introductions. Not case sensitive.
	// Search conditions may be: "exact phrase", "any word" or "all words".
	function searchPage($searchTerm, $searchConditions) {
		$searchConditions = $searchConditions ? $searchConditions : "exact phrase";
		$toBeSearched = strtolower(strip_tags($this->heading . ' - ' . $this->introduction . ' ' . $this->content));
		$toBeSearched0 = $toBeSearched;
		$searchTerms = ($searchConditions == "exact phrase") ? 
			array(trim(strtolower($searchTerm))) : explode(' ', strtolower($searchTerm));
		$inString = true;
		if (count($searchTerms) > 0) {
			foreach ($searchTerms as $term) {
				$term = trim($term);
				if ($term) {if (strpos($toBeSearched0, $term) === false) {$inString = false;}}
				if ($term) {$toBeSearched = implode(("<b>" . $term . "</b>"), explode($term, $toBeSearched));}
			}
		}
		if (!$inString && ($searchConditions == "all words")) {return '';}
		$fragments = explode("b>", $toBeSearched);
		foreach ($fragments as $key => $frag) {
			if ($key == 0) {
				$newFragments[$key] = firstStringShorten($frag);
			}
			elseif ($key == count($fragments) - 1) {
				$newFragments[$key] = lastStringShorten($frag);
			}
			else {
				$newFragments[$key] = stringShorten($frag);
			}
		}
		return (count($newFragments) > 1) ? implode("b>", $newFragments) : '';
	}
	
	function getImageList() {
		if (count($this->imagelist) > 0) {
			$key2 = 0;
			foreach ($this->imagelist as $key => $image_id) {
				$myImage = new images();
				$myImage->image_id = $image_id;
				$myImage->select();
				$this->imagedetails[$key2] = $myImage->edit();
				$myImage->__destruct();
				$key2++;
			}
		}
	}
	
	function getDocumentList() {
		if (count($this->documentlist) > 0) {
			$key2 = 0;
			foreach ($this->documentlist as $key => $document_id) {
				$myDocument = new documents();
				$myDocument->document_id = $document_id;
				$myDocument->select();
				$this->documentdetails[$key] = $myDocument->edit();
				$myDocument->__destruct();
				$key2++;
			}
		}
	}
}

?>