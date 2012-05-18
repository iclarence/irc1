<form name="searchForm" action="{$home}/page/{$languageIdentifier}/searchresults/" method="post">
<input type="hidden" name="sessid" id="sessid" value="{$sessid}" />
<input type="text" name="searchTerm" id="searchTerm" value="{$searchTerm}" size="20" maxlength="100" />
<input type="hidden" name="searchConditions" id="searchConditions" value="all words" />
<input type="submit" name="submit" value="search" />
</form>