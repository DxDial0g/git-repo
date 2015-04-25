function AJAXLogin($, eId, pId, divId){	
	$.ajax({
		url: 'php/login.php',
		type: 'POST',
		data: {email: $(eId).value, pass: $(pId).value},
	}).done(function(response){
		$(divId).text(response)
	});	
}