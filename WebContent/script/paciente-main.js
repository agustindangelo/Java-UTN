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

function actualizarHumor(estado) {
	alert(estado);
	$.ajax({
		type: "POST",
		url: "RegistrarHumorPaciente",                
		dataType: "json",
		data: {"estado" : estado}
	})
}