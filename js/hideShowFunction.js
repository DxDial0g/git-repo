function hideShowText(fieldId, d){
	var field = document.getElementById(fieldId);
	if(field.value == d){
		return "";
	}else if(field.value == ""){
		return d;
	}else{
		return value;
	}
}
function hS(fieldId, value){
	document.getElementById(fieldId).value = hideShowText(fieldId, value);
}