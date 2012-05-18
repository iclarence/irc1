<?php
class users {

	public $user_id = 1;
	public $title = 'Mr';
	public $firstname = '';
	public $lastname = '';
	public $username = '';
	public $companyname = '';
	public $address_id = 0;
	public $email = '';
	public $phone = '';
	public $mobile = '';
	public $fax = '';
	public $website = '';
	public $password = '';
	public $usertype_id = 0;
	public $usertype = 'ordinary';
	public $userlogin = 0;
	public $subscription = 0;
	public $language_id = 1;
	public $language = 'English (United Kingdom)';
	public $languageIdentifier = 'en-uk';
	public $timezone_id = 16;
	public $timezone = '(UTC 00:00) Western Europe Time, London, Lisbon, Casablanca';
	public $receivehtml = 0;
	public $activationkey = '';
	public $unsubscription = '';
	public $active = 0;
	public $joined = '';
	public $aliases = array();
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function post($edit) {
		$this->title = $edit['title'];
		$this->firstname = $edit['firstname'];
		$this->lastname = $edit['lastname'];
		$this->username = $edit['username'];
		$this->companyname = $edit['companyname'];
		$this->address_id = $edit['address_id'];
		$this->email = $edit['email'];
		$this->phone = $edit['phone'];
		$this->mobile = $edit['mobile'];
		$this->fax = $edit['fax'];
		$this->website = $edit['website'];
		$this->password = $edit['password'];
		$this->usertype_id = $edit['usertype_id'];
		$this->usertype = $edit['usertype'];
		$this->userlogin = $edit['userlogin'];
		$this->subscription = $edit['subscription'];
		$this->language_id = $edit['language_id'];
		$this->language = $edit['language'];
		$this->languageIdentifier = $edit['languageIdentifier'];
		$this->timezone_id = $edit['timezone_id'];
		$this->timezone = $edit['timezone'];
		$this->receivehtml = $edit['receivehtml'];
		$this->active = $edit['active'];
		$this->joined = $edit['joined'];
		$this->aliases = $edit['aliases'];
	}
	
	function edit() {
		$edit['title'] = $this->title;
		$edit['firstname'] = $this->firstname;
		$edit['lastname'] = $this->lastname;
		$edit['username'] = $this->username;
		$edit['companyname'] = $this->companyname;
		$edit['address_id'] = $this->address_id;
		$edit['email'] = $this->email;
		$edit['phone'] = $this->phone;
		$edit['mobile'] = $this->mobile;
		$edit['fax'] = $this->fax;
		$edit['website'] = $this->website;
		$edit['password'] = $this->password;
		$edit['usertype_id'] = $this->usertype_id;
		$edit['usertype'] = $this->usertype;
		$edit['userlogin'] = $this->userlogin;
		$edit['subscription'] = $this->subscription;
		$edit['language_id'] = $this->language_id;
		$edit['language'] = $this->language;
		$edit['languageIdentifier'] = $this->languageIdentifier;
		$edit['timezone_id'] = $this->timezone_id;
		$edit['timezone'] = $this->timezone;
		$edit['receivehtml'] = $this->receivehtml;
		$edit['active'] = $this->active;
		$edit['joined'] = $this->joined;
		$edit['aliases'] = $this->aliases;
		return $edit;
	}
	
	function authenticate() {
		$errmsg = "";
		if (!$this->firstname) {$errmsg .= "Please supply first name.\n";}
		if (!$this->lastname) {$errmsg .= "Please supply last name.\n";}
		if (!$this->username) {$errmsg .= "Please supply username.\n";}
		if (!is_emailAddress($this->email)) {$errmsg .= "Please supply valid email address.\n";}
		if (!$this->phone) {$errmsg .= "Please supply phone number.\n";}
		return $errmsg;
	}
	
	function contactAuthenticate() {
		$errmsg = "";
		if (!$this->firstname) {$errmsg .= "Please supply first name.\n";}
		if (!$this->lastname) {$errmsg .= "Please supply last name.\n";}
		if (!is_emailAddress($this->email)) {$errmsg .= "Please supply valid email address.\n";}
		return $errmsg;
	}
	
	function companyAuthenticate() {
		$errmsg = "";
		if (!$this->companyname) {$errmsg .= "Please supply company name.\n";}
		if (!is_emailAddress($this->email)) {$errmsg .= "Please supply valid email address.\n";}
		if (!$this->phone) {$errmsg .= "Please supply phone number.\n";}
		return $errmsg;
	}
	
	function passwordAuthenticate() {
		if (!$this->password) {
			return "Please supply password.\n";
		}
		if ($_POST['confirm'] != $this->password) {
			return "Please confirm your password.\n";
		}
	}
	
	function select() {
		$query = "select u.title, u.firstname, u.lastname, u.username, u.companyname, address_id, u.email, ";
		$query .= "u.phone, u.mobile, u.fax, u.website, u.usertype_id, y.usertype, u.userlogin, u.subscription, ";
		$query .= "u.language_id, l.language, l.identifier, u.timezone_id, t.timezone, u.receivehtml, u.active, u.joined ";
		$query .= "from users u, usertypes y, languages l, timezones t ";
		$query .= "where u.usertype_id = y.usertype_id and u.language_id = l.language_id and ";
		$query .= "u.timezone_id = t.timezone_id and u.user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->title = stripslashes($row[0]);
			$this->firstname = stripslashes($row[1]);
			$this->lastname = stripslashes($row[2]);
			$this->username = stripslashes($row[3]);
			$this->companyname = stripslashes($row[4]);
			$this->address_id = $row[5];
			$this->email = stripslashes($row[6]);
			$this->phone = stripslashes($row[7]);
			$this->mobile = stripslashes($row[8]);
			$this->fax = stripslashes($row[9]);
			$this->website = stripslashes($row[10]);
			$this->usertype_id = $row[11];
			$this->usertype = stripslashes($row[12]);
			$this->userlogin = $row[13];
			$this->subscription = $row[14];
			$this->language_id = $row[15];
			$this->language = stripslashes($row[16]);
			$this->languageIdentifier = stripslashes($row[17]);
			$this->timezone_id = $row[18];
			$this->timezone = stripslashes($row[19]);
			$this->receivehtml = $row[20];
			$this->active = $row[21];
			$this->joined = $row[22];
		}
		
		$query = "select alias_id from aliasusers where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->aliases[$row[0]] = $row[0];
		}
	}
	
	function deletealias() {
		$query = "delete from aliasusers where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function delete() {		
		$this->deletealias();
		
		$query = "delete from users where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function updatealias() {
		$this->deletealias();
		if(count($this->aliases) > 0) {
			foreach ($this->aliases as $key => $alias_id) {
				$query = "insert into aliasusers (alias_id, user_id) values (";
				$query .= $alias_id . ", " . $this->user_id . ");";
				$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			}
		}
	}
	
	function insert() {
		$query1 = "select user_id from users where ";
		$query1 .= "email = \"" . stripslashes($this->email) . "\";";
		$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		$num = mysql_num_rows($result1);
		if ($num == 0) {
			$query = "insert into users ";
			$query .= "(title, firstname, lastname, username, companyname, address_id, email, ";
			$query .= "phone, mobile, fax, website, password, usertype_id, userlogin, subscription, ";
			$query .= "language_id, timezone_id, receivehtml, active, joined)";
			$query .= " values (";
			$query .= "\"" . addslashes($this->title) . "\", ";
			$query .= "\"" . addslashes($this->firstname) . "\", ";
			$query .= "\"" . addslashes($this->lastname) . "\", ";
			$query .= "\"" . addslashes($this->username) . "\", ";
			$query .= "\"" . addslashes($this->companyname) . "\", ";
			$query .= "\"" . $this->address_id . "\", ";
			$query .= "\"" . addslashes($this->email) . "\", ";
			$query .= "\"" . addslashes($this->phone) . "\", ";
			$query .= "\"" . addslashes($this->mobile) . "\", ";
			$query .= "\"" . addslashes($this->fax) . "\", ";
			$query .= "\"" . addslashes($this->website) . "\", ";
			$query .= "\"" . md5($this->password) . "\", ";
			$query .= "\"" . $this->usertype_id . "\", ";
			$query .= "\"" . $this->userlogin . "\", ";
			$query .= "\"" . $this->subscription . "\", ";
			$query .= "\"" . $this->language_id . "\", ";
			$query .= "\"" . $this->timezone_id . "\", ";
			$query .= "\"" . $this->receivehtml . "\", ";
			$query .= "\"" . $this->active . "\", ";
			$query .= "\"" . $_SESSION['datetimeNow'] . "\");";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
			$result1 = mysql_query($query1, $_SESSION['link']) or die("invalid query " . $query1 . "\n");
		}
		while ($row = mysql_fetch_row($result1)) {$this->user_id = $row[0];}		
			
		$this->updatealias();
		
		return $num;
	}
	
	function subscribe() {
		if (!is_emailAddress($_POST['email'])) {
			return "Please supply a valid email address.\n";
		}
		if ((!$_POST['name']) || ($_POST['name'] == 'name')) {
			return "Please supply a name.\n";
		}
		$this->email = $_POST['email'];
		$names = explode(' ', $_POST['name']);
		if (count($names) == 1) {
			$this->firstname = $names[0];
			$this->username = $names[0];
			$this->lastname = '';
		}
		else {
			$this->firstname = $names[0];
			$this->lastname = $names[1];
			$this->username = $names[0];
		}
		$this->title = '';
		$this->usertype_id = 4;
		$this->userlogin = 0;
		$this->subscription = 1;
		$this->active = 0;
		if ($this->insert() > 0) {
			$query = "update users set subscription = 1 where email = \"" . $this->email . "\";";
			$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		}
		$this->generateUnsubscription();
		return "Thank you, " . $_POST['name'] . " for subscribing to " . SITENAME . ".\n";
	}
	
	function login() {
		$query = "select u.user_id, t.usertype, u.active from users u, usertypes t ";
		$query .= "where u.usertype_id = t.usertype_id and u.username = \"";
		$query .= $_POST['username'] . "\" and u.password = \"" . md5($_POST['password']) . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if (mysql_num_rows($result) == 1) {
			while ($row = mysql_fetch_row($result)) {
				$this->user_id = $row[0];
				$_SESSION['myUid'] = $this->user_id;
				$this->usertype = $row[1];
				$this->active = $row[2];
			}
			if (($this->usertype == 'anonymous') || (($_POST['adminLogin'] == 1) && ($this->usertype == 'ordinary'))) {
				$msg = "Sorry. Not authorized.\n";
				unset($_SESSION['myUid']);
				unset($_SESSION['authenticated']);
			}
			elseif ($this->active == 0) {
				$msg = "Sorry. You have not yet activated your account. Your activation key has been sent to your email address. ";
				$msg .= "If you have any problems, please email ";
				$msg .= "<a href=\"mailto:" . ADMINEMAIL . "\">" . ADMINEMAIL . "</a>.\n";
				unset($_SESSION['myUid']);
				unset($_SESSION['authenticated']);
			}
			else {
				$this->select();
				$msg = "Login successful!\n";
				if ($_POST['keepMeLoggedIn'] == 1) {
					setcookie('myUid', $this->user_id, time()+COOKIELIFE, '/');
					$_SESSION['keepMeLoggedIn'] = 1;
				}
				else {
					setcookie('myUid', $this->user_id, 0, '/');
					$_SESSION['keepMeLoggedIn'] = 0;
				}
				if ($_POST['rememberMe'] == 1) {
					setcookie('myLogin', $this->username . "," . $this->password, time()+COOKIELIFE, '/');
					$_SESSION['rememberMe'] = 1;
				}
				else {
					setcookie('myLogin', $this->username . "," . $this->password, 0, '/');
					$_SESSION['rememberMe'] = 0;
				}
				$_SESSION['authenticated'] = 1;
			}
		}
		else {
			$msg = "Sorry. Username and password not recognised.\n";
			unset($_SESSION['myUid']);
			unset($_SESSION['authenticated']);
		}
		return $msg;	
	}
	
	function startup() {
		if (is_numeric($_COOKIE['myUid'])) {
			$this->user_id = $_COOKIE['myUid'];
			$_SESSION['myUid'] = $this->user_id;
		}
		elseif (is_numeric($_SESSION['myUid'])) {
			$this->user_id = $_SESSION['myUid'];
		}
		if ((is_numeric($this->user_id)) && ($this->user_id >= 4)) {
			$this->select();
			$_SESSION['authenticated'] = 1;
		}
		else {
			unset($_SESSION['authenticated']);
		}
	}
	
	function logout() {
		setcookie('myUid', $this->user_id, time()-3600, '/');
		unset($_SESSION['myUid']);
		unset($_SESSION['authenticated']);
		return "Good-bye " . $this->firstname . " " . $this->lastname . ". You have logged out.\n";
	}
	
	function forgottenPassword() {
		$msg = '';
		if (!is_emailAddress($_POST['email'])) {
			return "Please enter a valid email address.\n";
		}
		if ($_POST['email'] != $_POST['confirm']) {
			return "Email addresses do not match.\n";
		}
		$query = "select user_id from users where email = \"" . $_POST['email'] . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if (mysql_num_rows($result) == 0) {
			return "Sorry, there is no user with this email address.\n";
		}
		while ($row = mysql_fetch_row($result)) {
			$this->user_id = $row[0];
		}
		$this->newpassword();
		return "OK";
	}
	
	function newpassword() {
		$this->select();
		$this->password = generatePassword(PASSWORD_LENGTH);
		$query = "update users set password = \"" . md5($this->password);
		$query .= "\" where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = "insert into passwordchanges (user_id, changed) values (\"";
		$query .= $this->user_id . "\", \"" . $_SESSION['datetimeNow'] . "\");";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$subject = "password for " . $_SERVER['HTTP_HOST'];
		$message = "Dear " . $this->title . " " . $this->firstname . " " . $this->lastname . ",\n\n";
		$message .= "Your password for logging onto " . $_SERVER['HTTP_HOST'];
		$message .= " with username " . $this->username . " has been updated.\n";
		$message .= "The new password is: " . $this->password . "\n";
		$message .= "After logging onto your account, you may change your password to one of your choice at any time.\n\n";
		$message .= "NB Please do not reply to this email: it has been automatically generated.\n\n";
		$message .= "Kind regards,\n";
		$message .= $_SERVER['HTTP_HOST'] . "\n";
		$to = $this->email;
		$headers = "From: " . ADMINEMAIL . "\r\nCc: " . ADMINEMAIL . "\r\nX-Mailer: PHP/" . phpversion();
		mail($to, $subject, $message, $headers);
	}
	
	function updatePassword() {
		$query = "update users set password = \"" . md5($this->password);
		$query .= "\" where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function generateUnsubscription() {
		$this->unsubscription = UNSUBSCRIPTION_START . generatePassword(UNSUBSCRIPTION_LENGTH);
		$query = "update users set unsubscription = \"" . $this->unsubscription;
		$query .= "\" where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function unsubscription($unsubscription) {
		$query = "select user_id from users where unsubscription = \"" . $unsubscription . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if (mysql_num_rows($result) == 0) {
			return "Sorry, unsubscription key not valid.\n";
		}
		while ($row = mysql_fetch_row($result)) {
			$this->user_id = $row[0];
		}
		$query = "update users set subscription = 0 where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		return "You have successfully unsubscribed.\n";
	}
	
	function generateActivationKey() {
		$this->select();
		$this->activationkey = ACTIVATIONKEY_START . generatePassword(ACTIVATION_LENGTH);
		$query = "update users set activationkey = \"" . $this->activationkey;
		$query .= "\" where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$subject = "activation key for " . $_SERVER['HTTP_HOST'];
		$message = "Dear " . $this->title . " " . $this->firstname . " " . $this->lastname . ",\n\n";
		$message .= "Here is the activation key for your account " . $this->username . " on " . $_SERVER['HTTP_HOST'];
		$message .= ".\n\n";
		$message .= $this->activationkey . "\n\n";
		$message .= "To activate your account please click on the link below:\n";
		$message .= "http://" . $_SERVER['HTTP_HOST'] . "/page/" . $this->languageIdentifier . "/activate/" . $this->activationkey . "/\n\n";
		$message .= "Alternatively, go to the activation page ";
		$message .= "http://" . $_SERVER['HTTP_HOST'] . "/page/" . $this->languageIdentifier;
		$message .= "/activate/ and type in your email address and activation key.\n\n";		
		$message .= "NB Please do not reply to this email: it has been automatically generated.\n\n";
		$message .= "Kind regards,\n";
		$message .= $_SERVER['HTTP_HOST'] . "\n";
		$to = $this->email;
		$headers = "From: " . ADMINEMAIL . "\r\nCc: " . ADMINEMAIL . "\r\nX-Mailer: PHP/" . phpversion();
		mail($to, $subject, $message, $headers);		
	}
	
	function activationActivation() {
		$query = "update users set active = 1 where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		$_SESSION['myUid'] = $this->user_id;
		$_SESSION['authenticated'] = 1;
		$this->select();
	}
	
	function activationKeyActivation($activationKey) {
		$query = "select user_id from users where activationkey = \"" . $activationKey . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if (mysql_num_rows($result) == 0) {
			return "Sorry, activation key not valid.\n";
		}
		while ($row = mysql_fetch_row($result)) {
			$this->user_id = $row[0];
		}
		$this->activationActivation();
		return "Activation successful.\n";
	}
	
	function activationFormActivation() {
		if (!is_emailAddress($_POST['email'])) {
			return "Please supply your email address.\n";
		}
		if (!$_POST['activationKey']) {
			return "Please supply activation key.\n";
		}
		
		$query = "select user_id, activationkey from users where email = \"" . $_POST['email'] . "\";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		if (mysql_num_rows($result) == 0) {
			return "Sorry, activation key not valid.\n";
		}
		while ($row = mysql_fetch_row($result)) {
			$this->user_id = $row[0];
			$this->activationkey = $row[1];
		}
		
		if ($this->activationkey != $_POST['activationKey']) {
			return "Sorry, activation key not valid.\n";
		}
		
		$this->activationActivation();
		return "Activation successful for " . $_POST['email'] . ".\n";
	}
	
	function activate() {
		$query = "select active from users where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		while ($row = mysql_fetch_row($result)) {
			$this->active = $row[0];
		}
		$query = "update users set active = \"" . (($this->active == 1) ? 0 : 1);
		$query .= "\" where user_id = " . $this->user_id . ";";
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
	}
	
	function update() {
		$q1 = "update users set ";
		$q2 = "\" where user_id = " . $this->user_id . ";";
		
		$query = $q1 . "title = \"" . addslashes($this->title) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "firstname = \"" . addslashes($this->firstname) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "lastname = \"" . addslashes($this->lastname) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "username = \"" . addslashes($this->username) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "companyname = \"" . addslashes($this->companyname) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "address_id = \"" . $this->address_id . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "email = \"" . addslashes($this->email) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "phone = \"" . addslashes($this->phone) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "mobile = \"" . addslashes($this->mobile) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "fax = \"" . addslashes($this->fax) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "website = \"" . addslashes($this->website) . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "usertype_id = \"" . $this->usertype_id . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "userlogin = \"" . $this->userlogin . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "subscription = \"" . $this->subscription . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "language_id = \"" . $this->language_id . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "timezone_id = \"" . $this->timezone_id . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "receivehtml = \"" . $this->receivehtml . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$query = $q1 . "active = \"" . $this->active . $q2;
		$result = mysql_query($query, $_SESSION['link']) or die("invalid query " . $query . "\n");
		
		$this->updatealias();
	}
}

?>