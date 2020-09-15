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

function filtrarEjercicios() {
	var input, filter, ul, li, i;
	input = document.getElementById("ejerciciosSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("ejerciciosMenu");
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
function filtrarDesayuno() {
	var input, filter, ul, li, i;
	input = document.getElementById("desayunoSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("desayunoMenu");
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
function filtrarAlmuerzo() {
	var input, filter, ul, li, i;
	input = document.getElementById("almuerzoSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("almuerzoMenu");
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
function filtrarCena() {
	var input, filter, ul, li, i;
	input = document.getElementById("cenaSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("cenaMenu");
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
function filtrarOtros() {
	var input, filter, ul, li, i;
	input = document.getElementById("otrosSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("otrosMenu");
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

// Listado editable de horarios
$(document).ready(function(){
	// Activar tooltips
	$('[data-toggle="tooltip"]').tooltip();
	
	// Seleccionar y deseleccionar checkboxes
	var checkbox = $('table tbody input[type="checkbox"]');
	$("#selectAll").click(function(){
		if(this.checked){
			checkbox.each(function(){
				this.checked = true;                        
			});
		} else{
			checkbox.each(function(){
				this.checked = false;                        
			});
		} 
	});
	checkbox.click(function(){
		if(!this.checked){
			$("#selectAll").prop("checked", false);
		}
	});
});