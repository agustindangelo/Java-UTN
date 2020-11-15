$(function() {	       
   $("#pacienteMenu li").not('.emptyMessage').click(function() {
	   document.getElementById("seleccionePacienteMsj").style.display = "none";
	   var dni = this.id;
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
				
				$('#nombre-apellido').append(paciente.nombre + ' ' + paciente.apellido);
				$('#email').append(paciente.email);
				$('#telefono').append(paciente.telefono);
				$('#imc').append(paciente.imc);
				$('#metabolismo-basal').append(paciente.metabolismoBasal + '   kcal/dia');
				
				$('#peso-actual').append(paciente.peso + ' kg.');
				$('#peso-objetivo').append(paciente.pesoObjetivo + ' kg.');
				$('#ejercicio-semana').append(paciente.kcalEjercicioSemana + ' kcal.');
				$('#ejercicio-objetivo').append(paciente.kcalEjercicioObjetivo + ' kcal.');
			}
		},
		error:function(){
			alert('not worked.');
	} 
	})       
};
$(function() {	       
   $("#solicitudesMenu li .li-icon").not('.emptyMessage').click(function() {
	   var dni = this.id.slice(1);
	   if (this.id[0] == 'a'){
		   	aceptarSolicitud(dni);
			console.log(this.id)
		} else {
			rechazarSolicitud(dni);
			console.log(this.id)
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
			$("#solicitudesMenu").remove("#s"+dni);
		},
	})
}
function rechazarSolicitud(dni){
	$.ajax({
		type: "POST",
		url: "RechazarSolicitud",                
		dataType: "json",
		data: {"dni" : dni},
		success: function(){
			$("#solicitudesMenu").remove("#s"+dni);
		},
	}) 
}