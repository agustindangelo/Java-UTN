$(document).ready(function(){
	$(function() {
		var selector;
		$('#btnRegistrarDesayuno').click(function(){
			tipoIngesta='desayuno'
			selector = '#registrarDesayuno input[type="number"]'
			registrarIngesta(selector, tipoIngesta);
		});
		$('#btnRegistrarAlmuerzo').click(function(){
			tipoIngesta='almuerzo'
			selector = '#registrarAlmuerzo input[type="number"]'
			registrarIngesta(selector, tipoIngesta);
		});
		$('#btnRegistrarCena').click(function(){
			tipoIngesta='cena'
			selector = '#registrarCena input[type="number"]'
			registrarIngesta(selector, tipoIngesta);
		});
		$('#btnRegistrarOtro').click(function(){
			tipoIngesta='otro'
			selector = '#registrarOtros input[type="number"]'
			registrarIngesta(selector, tipoIngesta);
		});
		
		
		$('#btnAgregarAlimento').click(function() {
			var categoria = $('#nuevo-categoria-alimento').val();
			var nombre = $('#nuevo-nombre-alimento').val();
			var calorias = $('#nuevo-calorias-alimento').val();
			var grasas = $('#nuevo-grasas-alimento').val();
			var proteinas = $('#nuevo-proteinas-alimento').val();
			var carbohidratos = $('#nuevo-carbohidratos-alimento').val();
			var yaRegistrada = false;
			
			$('#lista-cena a').each(function() {
				if ($(this).text() == nombre) {
					yaRegistrada = true;
				}		
			});

			if (yaRegistrada){
				$('#error-modal-agregar-alimento').text('El alimento ya se encuentra registrado');
				$('#error-modal-agregar-alimento').show();
			} else {
				if (
					nombre === '' ||
					calorias === '' ||
					grasas === '' ||
					proteinas === '' ||
					carbohidratos === ''  
				){
					$('#error-modal-agregar-alimento').text('Ha dejado campos vacios!');
					$('#error-modal-agregar-alimento').show();
				} else {
					$.ajax({
						type: 'POST',
						url: 'RegistrarAlimento',
						dataType: 'JSON',
						data: {
							'categoria': categoria,
							'nombre': nombre,
							'calorias': calorias,
							'grasas': grasas,
							'proteinas': proteinas,
							'carbohidratos': carbohidratos		
						}
					});
					$('#error-modal-agregar-alimento').hide();
					$('#agregarAlimento').modal('hide');
					
					var nuevaFila = '<li class="list-group-item"><a class="colored-title">'+nombre+'</a><input class="float-right" type="number" value="0" min="0" max="5000"/><label class="float-right text-muted">Gr.</label></li>'
					$('#otrosMenu').append(nuevaFila)
					$('#cenaMenu').append(nuevaFila)
					$('#almuerzoMenu').append(nuevaFila)
					$('#desayunoMenu').append(nuevaFila)

					$('#nuevo-categoria-alimento').val('');
				    $('#nuevo-nombre-alimento').val('');
					$('#nuevo-calorias-alimento').val('');
					$('#nuevo-grasas-alimento').val('');
					$('#nuevo-proteinas-alimento').val('');
					$('#nuevo-carbohidratos-alimento').val('');
				}
			} 	
		});
		
	})
})

function registrarIngesta(selector, tipoIngesta){
	$(selector).each(function() {
		var cantidad;
		var ingesta;
		cantidad = $(this).val();
		if (cantidad != '0') {
			idAlimento = $(this).attr('id').slice(1);
			$.ajax({
				type: 'POST',
				url: 'RegistrarIngesta',
				dataType: 'json',
				data: {
					'idAlimento': idAlimento,
					'cantidad': cantidad,
					'tipo': tipoIngesta
				} 
			})
			$('#')
		}
	});
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