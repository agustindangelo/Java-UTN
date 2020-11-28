 $(document).ready(function() {
	$(function() {	       
	   $('#registrar-localidad').click(function() {
		   var codPostal = $('#codigo-postal').text();
		   var denominacion = $('#denominacion').text();
		   if (codPostal != "" && denominacion != "") {
		   		registrarLocalidad(codPostal, denominacion);
		   }
	   });
	});
});
function registrarLocalidad(codPostal, denominacion){
	$.ajax({
		type: "POST",
		url: "RegistrarLocalidad",                
		dataType: "json",
		data: {"codigo-postal" : codPostal, "denominacion": denominacion},
		success: function(){
			$('#modal-mensaje').modal({ show: false});
			$('#modal-mensaje-titulo').text('Operación exitosa');
			$('#modal-mensaje-cuerpo').text('La localidad ' + denominacion + ' se ha registrado con éxito.');
			$('#modal-mensaje').modal('show');
			$('#localidad').append('<option data-tokens="${denominacion}">${denominacion}</option>');
		},
		error: function(){
			$('#modal-mensaje').modal({ show: false});
			$('#modal-mensaje-titulo').text('Ha ocurrido un error');
			$('#modal-mensaje-cuerpo').text('La localidad no se ha podido registrar.');
			$('#modal-mensaje').modal('show');
		} 
	})
}
