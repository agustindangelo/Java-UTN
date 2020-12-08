$(document).ready(function() {
	$(function() {       
	   $("#pacienteMenu li").not('.emptyMessage').click(function() {
		   document.getElementById("seleccionePacienteMsj").style.display = "none";
		   var previousDni = $('#dni').text();
		   var dni = this.id;
		   if (previousDni != dni) {
		   		getPacienteInfo(dni);
		   }
	   });
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
				$('#nombre-apellido').text(paciente.nombre + ' ' + paciente.apellido);
				$('#dni').text(paciente.dni);
				$('#email').text(paciente.email);
				$('#telefono').text(paciente.telefono);
				$('#altura').text(paciente.altura);
				$('#imc').text(paciente.imc.toString());
				$('#modificar-altura').val(paciente.altura);
				$('#modificar-metabolismo-basal').val(paciente.metabolismoBasal);
				$('#modificar-imc').val(paciente.imc);
				$('#modificar-objetivo').val(paciente.objetivo);
				$('#metabolismo-basal').text(paciente.metabolismoBasal);
				$('#nuevo-peso-objetivo').val(paciente.pesoObjetivo);
				$('#peso').val(paciente.peso);
				$('#modificar-calorias').val(paciente.plan.kcalDiarias);
				$('#modificar-carbohidratos').val(paciente.plan.carbohidratosDiarios);
				$('#modificar-proteinas').val(paciente.plan.proteinasDiarias);
				$('#modificar-grasas').val(paciente.plan.grasasDiarias);
				
				if (paciente.pesoObjetivo == 0){
					$('#peso-objetivo').text('---');
				} else {
					$('#peso-objetivo').text(paciente.pesoObjetivo.toString() + ' kg.');
				}
				if (paciente.peso == 0){
					$('#peso-actual').text('---');
				} else {
					$('#peso-actual').text(paciente.peso.toString() + ' kg.');
				}

				$('#ejercicio-semana').text(paciente.kcalEjercicioSemana.toString() + ' kcal.');
				$('#ejercicio-objetivo').text(paciente.kcalEjercicioObjetivo.toString() + ' kcal.');
				
				$('#kcal').text(paciente.consumosHoy.calorias.toString() + '  /  ' + paciente.plan.kcalDiarias.toString() + ' kcal.');
				$('#proteinas').text(paciente.consumosHoy.proteinas.toString() + '  /  ' + paciente.plan.proteinasDiarias.toString() + ' g.');
				$('#carbohidratos').text(paciente.consumosHoy.carbohidratos.toString() + '  /  ' + paciente.plan.carbohidratosDiarios.toString() + ' g.');
				$('#grasas').text(paciente.consumosHoy.grasas.toString() + '  /  ' + paciente.plan.grasasDiarias.toString() + ' g.');
				
				if (paciente.consumosHoy.calorias == 0){
					$('#kcal-progress').css('width', '0%');
					$('#carbohidratos-progress').css('width',  '0%');
					$('#proteinas-progress').css('width', '0%' );
					$('#grasas-progress').css('width', '0%');
				} else {
					$('#kcal-progress').css('width', (paciente.consumosHoy.calorias * 100 / paciente.plan.kcalDiarias).toString() + '%' );
					$('#carbohidratos-progress').css('width', (paciente.consumosHoy.carbohidratos * 100 / paciente.plan.carbohidratosDiarios).toString() + '%');
					$('#proteinas-progress').css('width', (paciente.consumosHoy.proteinas * 100 / paciente.plan.proteinasDiarias).toString() + '%' );
					$('#grasas-progress').css('width', (paciente.consumosHoy.grasas * 100 / paciente.plan.grasasDiarias).toString() + '%');
				}
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
		   	insertarPaciente(dni);
		} else {
			rechazarSolicitud(dni);
		}
		$('#s' + dni).remove();
   });
});
function aceptarSolicitud(dni){
	$.ajax({
		type: "POST",
		url: "AceptarSolicitud",                
		dataType: "json",
		data: {"dni" : dni},
	})
}
function insertarPaciente(dni){
	$.ajax({
		type: "GET",
		url: "PacienteInfo",                
		dataType: "json",
		data: {"dni" : dni},
		success: function(paciente){
			$('#pacienteMenu').append(
				'<li class="list-group-item" id=' + paciente.dni + '><a href="#">' + paciente.apellido + ' ' + paciente.nombre + '</a></li>'
			);
		},
	})
}
function rechazarSolicitud(dni){
	$.ajax({
		type: "POST",
		url: "RechazarSolicitud",                
		dataType: "json",
		data: {"dni" : dni}
	}) 
}
$(function(){
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});

	$(window).resize(function(e) {
		if($(window).width()<=768){
			$("#wrapper").removeClass("toggled");
		}else{
			$("#wrapper").addClass("toggled");
		}
	});
});
   
function filtrarPacientes() {
  var input, filter, ul, li, a, i;
  input = document.getElementById("pacienteSearch");
  filter = input.value.toUpperCase();
  ul = document.getElementById("pacienteMenu");
  li = ul.getElementsByTagName("li");

	for (i = 0; i < li.length; i++) {
		a = li[i].getElementsByTagName("a")[0];
		if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
			li[i].style.display = "";
		} else {
			li[i].style.display = "none";
		}
	}
}
function filtrarSolicitudes() {
	var input, filter, ul, li, a, i;
	input = document.getElementById("solicitudesSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("solicitudesMenu");
	li = ul.getElementsByTagName("li");
  
	  for (i = 0; i < li.length; i++) {
		a = li[i].getElementsByTagName("a")[0];
		if (a.innerText.toUpperCase().indexOf(filter) > -1) {
			li[i].style.display = "";
		} else {
			li[i].style.display = "none";
		}
	  }
  }
