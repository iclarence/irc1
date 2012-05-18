function Mailit(form) {
document.location.href=("mailto:" + form.address.value + "?subject=A web page to see&body=I found this web page at " + document.location.href + ", which I thought you might like to see.")
return false
} 

