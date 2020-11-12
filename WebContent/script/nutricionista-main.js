$(function() {	       
   $("#pacienteMenu li").not('.emptyMessage').click(function() {
	   document.getElementById("seleccionePacienteMsj").style.display = "none";
	   var dni = this.id.slice(1);
	   getPacienteInfo(dni);
   });
});

function getPacienteInfo(dni){
	$.ajax({
		type: "GET",
		url: "PacienteInfo",                
		dataType: "json",
		data: {"dni" : dni},
		success: function(paciente){
			if(paciente){
				document.getElementById("panel").style.display = "block";
				
				$('#nombreApellido').append(paciente.nombre + ' ' + paciente.apellido);
				$('#email').append(paciente.email);
				$('#telefono').append(paciente.telefono);
				$('#imc').append(paciente.imc);
				$('#metabolismoBasal').append(paciente.metabolismoBasal + '   kcal/dia');
				
				$('#pesoActual').append(paciente.peso + ' kg.');
				$('#pesoObjetivo').append(paciente.pesoObjetivo + ' kg.');
				$('#ejercicioSemana').append(paciente.kcalEjercicioSemana + ' kcal.');
				$('#ejercicioObjetivo').append(paciente.kcalEjercicioObjetivo + ' kcal.');
			}
		},
		error:function(){
			alert('not worked.');
	} 
	})       
};
/*
$(function() {	       
   $(".rechazar").not('.emptyMessage').click(function() {
	   var dni = this.id.slice(1);
	   rechazarSolicitud(dni);
   });
});
*/

$(function() {	       
   $("#solicitudesMenu a .li-icon").not('.emptyMessage').click(function() {
	   var dni = this.id.slice(1);
	   if (this.id[0] == 'a'){
		   aceptarSolicitud(dni);
		} else {
			rechazarSolicitud(dni);
		}
   });
});
function aceptarSolicitud(dni){
	$.ajax({
		type: "POST",
		url: "AceptarSolicitud",                
		dataType: "json",
		data: {"dni" : dni},
		success: function(){
			$("#solicitudesMenu").find('#s' + dni).remove();
		},
		error:function(){
			alert('Error al aceptar solicitud.');
		} 
	})
}
function rechazarSolicitud(dni){
	$.ajax({
		type: "POST",
		url: "RechazarSolicitud",                
		dataType: "json",
		data: {"dni" : dni},
		success: function(){
			$("#solicitudesMenu").find('#s' + dni).remove();
		},
		error:function(){
			alert('Error al rechazar solicitud.');
		} 
	}) 
}