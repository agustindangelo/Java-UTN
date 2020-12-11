$(document).ready(function(){
	var selector;
	$('#registrarDesayuno').click(function(){
		selector = '#registrarDesayuno input[type="number"]'
		registrarIngesta(selector);
	})
	$('#registrarAlmuerzo').click(function(){
		selector = '#registrarAlmuerzo input[type="number"]'
		registrarIngesta(selector);
	})
	$('#registrarCena').click(function(){
		selector = '#registrarCena input[type="number"]'
		registrarIngesta(selector);
	})
	$('#registrarOtro').click(function(){
		selector = '#registrarOtros input[type="number"]'
		registrarIngesta(selector);
	})

	$('#btnAgregarAlimento').click(function() {
		alert($('#nuevo-categoria-alimento').val())
		var categoria = $('#nuevo-categoria-alimento').val();
		var nombre = $('#nuevo-nombre-alimento').val();
		var calorias = $('#nuevo-calorias-alimento').val();
		var grasas = $('#nuevo-grasas-alimento').val();
		var proteinas = $('#nuevo-proteinas-alimento').val();
		var carbohidratos = $('#nuevo-carbohidratos-alimento').val();
		alert(calorias === null);
	})
})

function registrarIngesta(selector){
	$(selector).each(function() {
		alimentosIngresados = []
		if ($(this).val() != 0) {
			idAlimento = this.id.slice(1)
			alimentosIngresados.push(idAlimento)	
			alert(idAlimento)
		}
	})
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