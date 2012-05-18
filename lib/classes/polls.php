<?php
class polls {

	public $poll_id = 1;
	public $poll = '';
	public $startdate = '';
	public $stopdate = '';
	public $active = 0;
	public $answers = array();
	public $pollresults = array();
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->polltype_id = $edit['polltype_id'];
		$this->poll = $edit['poll'];
		$this->startdate = $edit['startdate'];
		$this->stopdate = $edit['stopdate'];
		$this->active = $edit['active'];
		$this->answers = $edit['answers'];
	}
	
	function edit() {
		$edit['polltype_id'] = $this->polltype_id;
		$edit['poll'] = $this->poll;
		$edit['startdate'] = $this->startdate;
		$edit['stopdate'] = $this->stopdate;
		$edit['active'] = $this->active;
		$edit['answers'] = $this->answers;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->poll) {$errmsg .= "Please enter a question.\n";}
		if (!$this->startdate) {$errmsg .= "Please give this poll a start date.\n";}
		if (!$this->stopdate) {$errmsg .= "Please give this poll a stop date.\n";}
		return ($errmsg);
	}
	
	function userAuthenticate() {
		$errmsg = "";
		if (!$this->poll) {$errmsg .= "Please enter a question.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select poll, startdate, stopdate, active ";
		$query .= "from polls where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->poll = stripslashes($row[0]);
			$this->startdate = $row[1];
			$this->stopdate = $row[2];
			$this->active = $row[3];
		}
		
		$query = "select ordering, answer from pollanswers where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->answers[$row[0]] = stripslashes($row[1]);
		}
	}
	
	function deleteanswers() {
		$query = "delete from pollanswers where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function deletevotes() {
		$query = "delete from pollvotes where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
		
	function delete() {
		$this->deleteanswers();
		$this->deletevotes();		
		$query = "delete from polls where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function updateanswers() {
		$this->deleteanswers();
		if(count($this->answers) > 0) {
			foreach ($this->answers as $key => $answer) {
				if ($answer) {
					$query = "insert into pollanswers (poll_id, answer, ordering) values (";
					$query .= "\"" . $this->poll_id . "\", ";
					$query .= "\"" . addslashes($answer) . "\", ";
					$query .= "\"" . $key . "\");";
					$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
				}
			}
		}
	}
	
	function insert() {
		$query1 = "select poll_id from polls where ";
		$query1 .= "poll = \"" . stripslashes($this->poll) . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		if (mysql_num_rows($result1) == 0) {
			$query = "insert into polls ";
			$query .= "(poll, startdate, stopdate, active)";
			$query .= " values (";
			$query .= "\"" . addslashes($this->poll) . "\", ";
			$query .= "\"" . $this->startdate . "\", ";
			$query .= "\"" . $this->stopdate . "\", ";
			$query .= "\"" . $this->active . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->poll_id = $row[0];}
		
		$this->updateanswers();
	}
	
	function activate() {
		$query = "select active from polls where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->active = $row[0];
		}
		$query = "update polls set active = \"" . (($this->active == 1) ? 0 : 1);
		$query .= "\" where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function update() {
		$q1 = "update polls set ";
		$q2 = "\" where poll_id = " . $this->poll_id . ";";
		
		$query = $q1 . "poll = \"" . addslashes($this->poll) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "startdate = \"" . $this->startdate . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "stopdate = \"" . $this->stopdate . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "active = \"" . $this->active . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$this->updateanswers();
	}
	
	function vote($vote) {
		$query = "select answer_id from pollanswers where poll_id = " . $this->poll_id . " and ordering = " . $vote . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$answer_id = $row[0];
		}
		
		$query = "insert into pollvotes (poll_id, answer_id, cast) values (";
		$query .= "\"" . $this->poll_id . "\", ";
		$query .= "\"" . $answer_id . "\", ";
		$query .= "\"" . $_SESSION['datetimeNow'] . "\");";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$_SESSION['poll' . $this->poll_id] = 1;
	}
	
	function getResults() {
		$this->select();
		$query = "select vote_id from pollvotes where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		$totalVotes = mysql_num_rows($result);
		if ($totalVotes == 0) {
			return false;
		}
		foreach ($this->answers as $key => $answer) {
			$query = "select v.vote_id from pollvotes v, pollanswers a where v.answer_id = a.answer_id and v.poll_id = ";
			$query .= $this->poll_id . "  and a.ordering = " . $key . ";";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$this->pollresults[$key] = round((100 * mysql_num_rows($result) / $totalVotes), 1);
		}
		return $this->pollresults;
	}
	
	function getPollOK() {
		$query = "select active, unix_timestamp(startdate), unix_timestamp(stopdate) from polls where poll_id = ";
		$query .= $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if ($row = mysql_fetch_row($result)) {
			return (($row[0] == 1) && (date() >= $row[1]) && (date() <= $row[2]) && !$_SESSION['poll' . $this->poll_id]);
		}
		else {
			return false;
		}	
	}
	
	function getDaysLeft() {
		$query = "select unix_timestamp(stopdate) from polls where poll_id = " . $this->poll_id . ";";
		// echo $query;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if ($row = mysql_fetch_row($result)) {
			// echo " id " . $this->poll_id . " stop date " . $row[0] . " time now " . time();
			// die();
			return floor(($row[0] - time()) / 86400);
		}
		else {
			return false;
		}	
	}
	
	function getPollClosed() {
		$query = "select unix_timestamp(stopdate) from polls where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if ($row = mysql_fetch_row($result)) {
			return (time() > $row[0]);
		}
		else {
			return false;
		}
	}
	
	function getNotYetStarted() {
		$query = "select unix_timestamp(startdate) from polls where poll_id = " . $this->poll_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if ($row = mysql_fetch_row($result)) {
			return (time() < $row[0]);
		}
		else {
			return false;
		}
	}
	
}

?>