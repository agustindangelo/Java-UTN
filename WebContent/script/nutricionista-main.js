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
				$('#nombre-apellido').text(paciente.nombre + ' ' + paciente.apellido);
				$('#email').text(paciente.email);
				$('#telefono').text(paciente.telefono);
				$('#imc').text(paciente.imc);
				$('#metabolismo-basal').text(paciente.metabolismoBasal + '   kcal/dia');
				
				$('#peso-actual').empty().append(paciente.peso + ' kg.');
				$('#peso-objetivo').empty().append(paciente.pesoObjetivo + ' kg.');
				$('#ejercicio-semana').empty().append(paciente.kcalEjercicioSemana + ' kcal.');
				$('#ejercicio-objetivo').empty().append(paciente.kcalEjercicioObjetivo + ' kcal.');
				
				$("#kcal-progress").css("width", paciente.consumosHoy.calorias * 100 / paciente.plan.kcalDiarias );
				$("#carbohidratos-progress").css("width", paciente.consumosHoy.carbohidratos * 100 / paciente.plan.carbohidratosDiarios );
				$("#proteinas-progress").css("width", paciente.consumosHoy.proteinas * 100 / paciente.plan.proteinasDiarias );
				$("#grasas-progress").css("width", paciente.consumosHoy.grasas * 100 / paciente.plan.grasasDiarias );
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
