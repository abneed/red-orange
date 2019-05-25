function leerArchivo(e) {
	  var archivo = $("#xml")[0].files[0];
	  if (!archivo) {
		return;
	  }
	  var lector = new FileReader();
	  lector.onload = function(e) {
		var contenido = e.target.result;
		mostrarContenido(contenido);
	  };
	  lector.readAsText(archivo);
	}

function mostrarContenido(contenido) {
	//alert(contenido);
	var parser, xmlDoc;
	parser = new DOMParser();
	xmlDoc = parser.parseFromString(contenido,"text/xml");

	$("#nombre").val(xmlDoc.getElementsByTagName("nombre")[0].childNodes[0].nodeValue);
	$("#usuario").val(xmlDoc.getElementsByTagName("usuario")[0].childNodes[0].nodeValue);
	$("#telefono").val(xmlDoc.getElementsByTagName("telefono")[0].childNodes[0].nodeValue);
	$("#correo").val(xmlDoc.getElementsByTagName("correo")[0].childNodes[0].nodeValue);
	$("#contrasena").val(xmlDoc.getElementsByTagName("contrasena")[0].childNodes[0].nodeValue);
}