 $(document).ready(function() {
	$('#modal-mensaje').modal({show: false});
	$('#error-rango-horario').hide();
	$(function() {	       
	   $('#registrar-localidad').click(function() {
		   var codPostal = $('#codigo-postal').text();
		   var denominacion = $('#denominacion').text();
		   if (codPostal != "" && denominacion != "") {
		   		registrarLocalidad(codPostal, denominacion);
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
		})
	});
});
function registrarLocalidad(codPostal, denominacion){
	$.ajax({
		type: "POST",
		url: "RegistrarLocalidad",                
		dataType: "json",
		data: {"codigo-postal" : codPostal, "denominacion": denominacion},
		success: function(){
			$('#modal-mensaje-titulo').text('Operación exitosa');
			$('#modal-mensaje-cuerpo').text('La localidad ' + denominacion + ' se ha registrado con éxito.');
			$('#modal-mensaje').modal('show');
			$('#localidad').append('<option data-tokens="${denominacion}">${denominacion}</option>');
		},
		error: function(){
			$('#modal-mensaje-titulo').text('Ha ocurrido un error');
			$('#modal-mensaje-cuerpo').text('La localidad no se ha podido registrar.');
			$('#modal-mensaje').modal('show');
		} 
	})
}
function registrarHorario(dia, horaDesde, horaHasta){
	$.ajax({
		type: "GET",
		url: "RegistrarHorario",
		dataType: "json",
		data: {"dia": dia, "hora-desde": horaDesde, "hora-hasta": horaHasta},
		success: function(rta){
			if (rta.message == null){
				$('#error-rango-horario').hide();
				var fila = '<tr><td><span class="custom-checkbox"><input type="checkbox" id="checkbox1" name="options[]" value="1"><label for="checkbox1"></label></span></td><td>'+dia+'</td><td>'+horaDesde+'</td><td>'+horaHasta+'</td></tr>'
				$('#tabla-horarios').append(fila);
			} else {
				$('#error-rango-horario').text(rta.message);
				$('#error-rango-horario').show();
			}
		},         // Por alguna razon, la peticion ajax entra por el error cuando en realidad se ejecutó correctamente
		error: function(rta){
			if (rta.message == null){
				$('#error-rango-horario').hide();
				var fila = '<tr><td><span class="custom-checkbox"><input type="checkbox" id="checkbox1" name="options[]" value="1"><label for="checkbox1"></label></span></td><td>'+dia+'</td><td>'+horaDesde+'</td><td>'+horaHasta+'</td></tr>'
				$('#tabla-horarios').append(fila);
			} else {
				$('#error-rango-horario').text(rta.message);
				$('#error-rango-horario').show();
			}
		},
	})
}