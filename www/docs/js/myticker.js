var sText = ""
var i=0
var iNews=0
var itemNodes=new Array()

function GetNewsSource(itemNodes){
	var iMax = itemNodes.length
	sText = itemNodes[iNews][0]
	myTicker.href = itemNodes[iNews][1]
	ticker()
	iNews+=1
	if(iNews==iMax){
		iNews=0
	}
	window.setTimeout("GetNewsSource(itemNodes)", (90*sText.length +4000))
}

function ticker(){
	i+=1
	myTicker.innerText = sText.substring(0,i) + "*"
	if(i<sText.length){
		window.setTimeout("ticker()",90)
	}
	else{
		i=0
	}
}