 $(document).ready(function() {
	$('#modal-mensaje').modal({show: false});
	$('#error-rango-horario').hide();
	$(function() {	       
		
	   $('#registrar-localidad').click(function() {
		   var codPostal = $('#codigo-postal').val();
		   var denominacion = $('#denominacion').val();
		   var yaRegistrada = false;
			$('#localidad > option').each(function(){
				if ($(this).attr('id') == codPostal){
					yaRegistrada = true;
				}
			})
			if (yaRegistrada){
		   		$('#modal-mensaje-titulo').text('El código postal '+ codPostal +' ya se encuentra registrado.');
		   		$('#modal-mensaje-cuerpo').text('Ingrese un código postal válido.');
		   		$('#modal-mensaje').modal('show');
			} else {
				if (codPostal != "" && denominacion != ""){
					   registrarLocalidad(codPostal, denominacion);
					   $('#localidad').append('<option id=' + codPostal + ' value='+ codPostal + '>' + denominacion + '</option>');
					   $('#modal-mensaje-titulo').text('Localidad registrada con éxito');
					   $('#modal-mensaje-cuerpo').text(denominacion + ' con CP ' + codPostal + ' se ha registrado satisfactoriamente.');
					   $('#modal-mensaje').modal('show');
				}
			}
	   });

		$('#registrar-horario').click(function() {
			var dia = $('#dia').val();
			var horaDesde = $('#hora-desde').val();
			var horaHasta = $('#hora-hasta').val();
			if (horaHasta <= horaDesde){
				$('#error-rango-horario').text("Debe ingresar un rango horario válido");
				$('#error-rango-horario').show();
				$('#modal-agregar-horario').show();
			} else {
				$('#error-rango-horario').hide();
				registrarHorario(dia, horaDesde, horaHasta);
			}
		});
		
		$('#borrar-horarios').click(function(){
			var horariosSeleccionados = [];
			$('input:checkbox:checked').each(function() {
				horariosSeleccionados.push(Number($(this).val()));
			});
			if (horariosSeleccionados.length == 0){
				$('#modal-mensaje-titulo').text('Error');
				$('#modal-mensaje-cuerpo').text('Debe seleccionar al menos un horario');
				$('#modal-mensaje').modal('show');
			} else {
				$('#modal-borrar-horarios').modal('show');
				$('#confirmacion-borrar-horarios').click(function() {
					borrarHorarios(horariosSeleccionados);
					for (var i=0; i < horariosSeleccionados.length; i++){
						$('table#tabla-horarios tr#' + horariosSeleccionados[i]).remove();
						$('#modal-borrar-horarios').modal('hide');
					}
				});
			}
		});
	});
});
function registrarLocalidad(codPostal, denominacion){
	$.ajax({
		type: "POST",
		url: "RegistrarLocalidad",                
		dataType: "json",
		data: {"codigo-postal" : codPostal, "denominacion": denominacion}
	})
}
function registrarHorario(dia, horaDesde, horaHasta){
	$.ajax({
		type: "GET",
		url: "RegistrarHorario",
		dataType: "json",
		data: {"dia": dia, "hora-desde": horaDesde, "hora-hasta": horaHasta},
		success: function(rta){
			var cantHorarios = $('.custom-checkbox').length;
			if (rta.message == null){
				$('#error-rango-horario').hide();
				var fila = '<tr id=' + cantHorarios +'><td><span class="custom-checkbox"><input type="checkbox" value='+ cantHorarios++ +'></span></td><td>'+dia+'</td><td>'+horaDesde+'</td><td>'+horaHasta+'</td></tr>'
				$('#tabla-horarios').append(fila);
			} else {
				$('#error-rango-horario').text(rta.message);
				$('#error-rango-horario').show();
			}
		},         // Por alguna razon, la peticion ajax entra por el error cuando en realidad se ejecutó correctamente, por lo tanto tuve que duplicar el codigo de success
		error: function(rta){
			var cantHorarios = $('.custom-checkbox').length;
			if (rta.message == null){
				$('#error-rango-horario').hide();
				var fila = '<tr id=' + cantHorarios +'><td><span class="custom-checkbox"><input type="checkbox" value='+ cantHorarios++ +'></span></td><td>'+dia+'</td><td>'+horaDesde+'</td><td>'+horaHasta+'</td></tr>'
				$('#tabla-horarios').append(fila);
			} else {
				$('#error-rango-horario').text(rta.message);
				$('#error-rango-horario').show();
			}
		},
	})
}
function borrarHorarios(horariosSeleccionados){
	$.ajax({
		type: 'POST',
		url: 'BorrarHorarios',
		dataType: 'json',
		data: {"horarios": JSON.stringify(horariosSeleccionados)}
	})
}