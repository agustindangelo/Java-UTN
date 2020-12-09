$(document).ready(function() {
	$('#password').focusout(function() {
		validarPassword();
	})
	$('#confirmacion-password').focusout(function() {
		validarPassword();
	})

})

function validarPassword() {
	var password = $('#password').val();
	var confirmacionPassword = $('#confirmacion-password').val();
	if (password == confirmacionPassword) {
		$('#guardarDatos').prop('disabled', false);
		$('#error-password').css('display', 'none');		
	} else {
		$('#guardarDatos').prop('disabled', true);
		$('#error-password').css('display', 'block');
	}
}