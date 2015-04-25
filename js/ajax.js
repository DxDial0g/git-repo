function AJAXLogin($, eId, pId, divId){
	var e = document.getElementById(eId);
	var p = document.getElementById(pId);

	if((e.length == 0) || (p.length == 0)){
		$(divId).text('los campos estan vacios');
		return;
	}
	$.ajax({
		url: 'php/login.php',
		type: 'POST',
		data: {email: e.value, pass: p.value},
	}).done(function(response){
		$(divId).text(response)
	});	
}