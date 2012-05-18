<?php

class pagination {
	// given
	public $arraySize = 100;
	public $pageNumber = 1;
	public $numberPerPage = 10;
	public $pageNumbersToView = 5; // must be an odd number
	// need to find
	public $previousPage = 0;
	public $nextPage = 10;
	public $numberOfPages = 10;
	public $arrayStart = 0;
	public $arrayStop = 9;
	public $actualNumber = 10;
	public $firstViewedPageNumber = 1;
	public $lastViewedPageNumber = 5;
	public $pageNumbers = array();
	
	function __construct() {
	}
	
	function __destruct() {
	}
	
	function getPagination() {
		$this->numberOfPages = ($this->arraySize % $this->numberPerPage == 0) ? $this->arraySize / $this->numberPerPage :
			ceil($this->arraySize / $this->numberPerPage);
		if ($this->pageNumber > 1) {
			$this->previousPage = $this->pageNumber - 1;
		}
		else {
			unset($this->previousPage);
		}
		if ($this->pageNumber < $this->numberOfPages) {
			$this->nextPage = $this->pageNumber + 1;
		}
		else {
			unset($this->nextPage);
		}
		if ($this->arraySize == 0) {
			$this->arrayStart = 0;
			$this->arrayStop = 0;
			$this->actualNumber = 0;
		}
		else {
			$this->arrayStart = ($this->pageNumber - 1) * $this->numberPerPage;
			$this->arrayStop = ($this->pageNumber == $this->numberOfPages) ? 
				$this->arraySize - 1 : $this->arrayStart + $this->numberPerPage - 1;
			$this->actualNumber = $this->arrayStop - $this->arrayStart + 1;
		}
		
		$half = ($this->pageNumbersToView - 1) / 2;
		
		if ($this->pageNumbersToView >= $this->numberOfPages) {
			$this->firstViewedPageNumber = 1;
			$this->lastViewedPageNumber = $this->numberOfPages;
		}
		elseif ($this->pageNumber <= $half) {
			$this->firstViewedPageNumber = 1;
			$this->lastViewedPageNumber = $this->pageNumbersToView;
		}
		elseif ($this->pageNumber > $this->numberOfPages - $half) {
			$this->firstViewedPageNumber = $this->numberOfPages - $this->pageNumbersToView + 1;
			$this->lastViewedPageNumber = $this->numberOfPages;
		}
		else {
			$this->firstViewedPageNumber = $this->pageNumber - $half;
			$this->lastViewedPageNumber = $this->pageNumber + $half;
		}
			
		for ($key = $this->firstViewedPageNumber; $key <= $this->lastViewedPageNumber; $key++) {
			$this->pageNumbers[] = $key;
		}		
	}
	
	function modifyArray($dataArray) {
		$newArray = array();
		for ($key = $this->arrayStart; $key <= $this->arrayStop; $key++) {
			$newArray[] = $dataArray[$key];
		}
		return $newArray;
	}
	
	function edit() {
		$edit['previousPage'] = $this->previousPage;
		$edit['nextPage'] = $this->nextPage;
		$edit['arraySize'] = $this->arraySize;
		$edit['pageNumber'] = $this->pageNumber;
		$edit['numberPerPage'] = $this->numberPerPage;
		$edit['pageNumbersToView'] = $this->pageNumbersToView;
		$edit['numberOfPages'] = $this->numberOfPages;
		$edit['arrayStart'] = $this->arrayStart;
		$edit['arrayStop'] = $this->arrayStop;
		$edit['firstViewedPageNumber'] = $this->firstViewedPageNumber;
		$edit['lastViewedPageNumber'] = $this->lastViewedPageNumber;
		$edit['pageNumbers'] = $this->pageNumbers;
		return $edit;
	}
}

?>