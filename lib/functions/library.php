<?php

// Generating a random password of alphanumerics.
function generatePassword($passwordLength) {	
	srand(generateSeed());	
	$characters = "ABCDEGHJKLMNPQRSTUVWXYZabcdeghjkmnopqrstuvwxyz23456789AEUaeiu23456789-";
	$password = "";
	for($i = 0; $i < $passwordLength; $i++) {
	  $password .= $characters[rand(0, strlen($characters))];
	}    
	return $password;
}
	
function generateSeed() {
  list($microseconds, $seconds) = explode(' ', microtime());
  return (float)$seconds + ((float)$microseconds * 1e6);
}

// Shortening a character string for use in search results
function stringShorten($str) {
	$maxStringLength = 100;
	return (strlen($str) > $maxStringLength) ? 
		substr($str, 0, ($maxStringLength / 2)) . "..." . substr($str, (-$maxStringLength / 2)) : $str;
}

function firstStringShorten($str) {
	$maxStringLength = 100;
	return (strlen($str) > $maxStringLength) ? ".." . substr($str, (-$maxStringLength)) : $str;
}

function lastStringShorten($str) {
	$maxStringLength = 100;
	return (strlen($str) > $maxStringLength) ? substr($str, 0, $maxStringLength) . ".." : $str;
}

// from MySQL to UNIX timestamp
function convert_datetime($str) {
	list($date, $time) = explode(' ', $str);
	list($year, $month, $day) = explode('-', $date);
	list($hour, $minute, $second) = explode(':', $time);
	return mktime($hour, $minute, $second, $month, $day, $year);
}

function convert_date($str) {
	list($year, $month, $day) = explode('-', $str);
	return mktime(0, 0, 0, $month, $day, $year);
}

// Testing to see whether a string is a valid email address.
function is_emailAddress($email) {
	$emailparts = explode('@', $email);
	if (count($emailparts) != 2) {
		return false;
	}
	else {
		$domainparts = explode('.', $emailparts[1]);
		return (count($domainparts) >= 2);
	}
}
?>