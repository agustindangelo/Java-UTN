function filtrarPacientes() {
  // Declare variables
  var input, filter, ul, li, a, i;
  input = document.getElementById("pacienteSearch");
  filter = input.value.toUpperCase();
  ul = document.getElementById("pacienteMenu");
  li = ul.getElementsByTagName("li");

  // Loop through all list items, and hide those who don't match the search query
  for (i = 0; i < li.length; i++) {
    a = li[i].getElementsByTagName("a")[0];
    if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}

  function filtrarAlimentos() {
	// Declare variables
	var input, filter, ul, li, i;
	input = document.getElementById("alimentosSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("alimentosMenu");
	li = ul.getElementsByTagName("li");
  
	// Loop through all list items, and hide those who don't match the search query
	for (i = 0; i < li.length; i++) {
	  if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
		li[i].style.display = "";
	  } else {
		li[i].style.display = "none";
	  }
	}
  }
  function filtrarEjercicios() {
	// Declare variables
	var input, filter, ul, li, i;
	input = document.getElementById("ejerciciosSearch");
	filter = input.value.toUpperCase();
	ul = document.getElementById("ejerciciosMenu");
	li = ul.getElementsByTagName("li");
  
	// Loop through all list items, and hide those who don't match the search query
	for (i = 0; i < li.length; i++) {
	  if (li[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
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
