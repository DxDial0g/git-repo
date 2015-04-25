function load(divId, linkId,templateId){
	var templates = document.getElementById(linkId).import;
	var template = templates.getElementById(templateId);
	var object = document.importNode(template.content, true);
	document.getElementById(divId).innerHTML = "";
	document.getElementById(divId).appendChild(object);
}