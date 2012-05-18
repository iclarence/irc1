<?php
class emails {

	public $email_id = 1;
	public $subject = '';
	public $emailbody = '';
	public $created = '';
	public $sent = '';
	public $to_subscribers = 0;
	public $to_usertypes = array();
	public $to_aliases = array();
	public $active = 0;
	public $emailList = array();
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->subject = $edit['subject'];
		$this->emailbody = $edit['emailbody'];
		$this->created = $edit['created'];
		$this->sent = $edit['sent'];
		$this->to_subscribers = $edit['to_subscribers'];
		$this->to_usertypes = $edit['to_usertypes'];
		$this->to_aliases = $edit['to_aliases'];
		$this->active = $edit['active'];
	}
	
	function edit() {
		$edit['subject'] = $this->subject;
		$edit['emailbody'] = $this->emailbody;
		$edit['created'] = $this->created;
		$edit['sent'] = $this->sent;
		$edit['to_subscribers'] = $this->to_subscribers;
		$edit['to_usertypes'] = $this->to_usertypes;
		$edit['to_aliases'] = $this->to_aliases;
		$edit['active'] = $this->active;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->subject) {$errmsg .= "Please give this email a subject.\n";}
		if (!$this->emailbody) {$errmsg .= "Please give this email a body.\n";}
		return ($errmsg);
	}
	
	function select() {
		$query = "select subject, emailbody, created, sent, to_subscribers, active ";
		$query .= "from emails where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->subject = stripslashes($row[0]);
			$this->emailbody = stripslashes($row[1]);
			$this->created = $row[2];
			$this->sent = $row[3];
			$this->to_subscribers = $row[4];
			$this->active = $row[5];
		}
		
		$query = "select usertype_id, included from emailusertypes where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->to_usertypes[$row[0]] = $row[1];
		}
		
		$query = "select alias_id from emailaliases where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->to_aliases[$row[0]] = $row[0];
		}
	}
	
	function delete_to_usertypes() {
		$query = "delete from emailusertypes where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function delete_to_aliases() {
		$query = "delete from emailaliases where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
		
	function delete() {	
		$this->delete_to_usertypes();
		$this->delete_to_aliases();
				
		$query = "delete from emails where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");		
	}
	
	function update_to_usertypes() {
		$this->delete_to_usertypes();
			
		$query = "select usertype_id, usertype from usertypes where usertype <> \"superuser\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$userType[$row[0]] = $row[1];
		}
		
		foreach ($userType as $key=>$utype) {
			$query = "insert into emailusertypes (email_id, usertype_id, included) values (";
			$query .= $this->email_id . ", " . $key . ", ";
			$query .= (is_numeric($this->to_usertypes[$key]) ? $this->to_usertypes[$key] : 0) . ");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		}
	}
	
	function update_to_aliases() {
		$this->delete_to_aliases();
		if (count($this->to_aliases) > 0) {		
			foreach ($this->to_aliases as $key => $to_a) {
				$query = "insert into emailaliases (email_id, alias_id) values (" . $this->email_id . ", " . $to_a . ");";
				$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			}
		}
	}
	
	function insert() {
		$query = "insert into emails (subject, emailbody, created, sent, to_subscribers, active) values (";
		$query .= "\"" . addslashes($this->subject) . "\", ";
		$query .= "\"" . addslashes($this->emailbody) . "\", ";
		$query .= "\"" . $_SESSION['datetimeNow'] . "\", ";
		$query .= "\"" . $this->sent . "\", ";
		$query .= "\"" . $this->to_subscribers . "\", ";
		$query .= "\"" . $this->active . "\");";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			
		$query = "select email_id from emails where ";
		$query .= "created = \"" . $_SESSION['datetimeNow'] . "\" and ";
		$query .= "subject = \"" . stripslashes($this->subject) . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {$this->email_id = $row[0];}
			
		$this->update_to_usertypes();
		$this->update_to_aliases();
	}
	
	function activate() {
		$query = "select active from emails where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->active = $row[0];
		}
		$query = "update emails set active = \"" . (($this->active == 1) ? 0 : 1);
		$query .= "\" where email_id = " . $this->email_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function update() {
		$q1 = "update emails set ";
		$q2 = "\" where email_id = " . $this->email_id . ";";
		
		$query = $q1 . "subject = \"" . addslashes($this->subject) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "emailbody = \"" . addslashes($this->emailbody) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "sent = \"" . $this->sent . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "to_subscribers = \"" . $this->to_subscribers . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "active = \"" . $this->active . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			
		$this->update_to_usertypes();
		$this->update_to_aliases();
	}
	
	function composeEmailList() {
		$this->select();
		$this->emailList = array();
			
		if (count($this->to_aliases) > 0) {		
			foreach ($this->to_aliases as $key => $to_a) {
				$query = "select user_id from aliasusers u, emailaliases e where ";
				$query .= "u.alias_id = e.alias_id and e.email_id = " . $this->email_id;
				$query .= " and e.alias_id = " . $to_a . ";";
				$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
				while ($row = mysql_fetch_row($result)) {
					$this->emailList[$row[0]] = $row[0];
				}
			}
		}		
		
		foreach ($this->to_usertypes as $key => $to_t) {
			if ($to_t == 1) {
				$query = "select u.user_id from users u, emailusertypes e where ";
				$query .= "u.usertype_id = e.usertype_id and e.email_id = " . $this->email_id;
				$query .= " and e.usertype_id = " . $key . " and e.included = 1;";
				$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
				while ($row = mysql_fetch_row($result)) {
					$this->emailList[$row[0]] = $row[0];
				}
			}
		}
		
		if ($this->to_subscribers == 1) {
			$query = "select user_id from users where subscription = 1;";
			echo $query;
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			while ($row = mysql_fetch_row($result)) {
				$this->emailList[$row[0]] = $row[0];
			}
		}
		
		return $this->emailList;		
	}
	
}

?>