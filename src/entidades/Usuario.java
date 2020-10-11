package entidades;

public class Usuario {
	public enum Rol {Nutricionista, Paciente}
	String dni;
	String nombre;
	String apellido;
	String email;
	String password;
	String telefono;
	Rol rol;
	public String getDni() {
		return dni;
	}
	public void setDni(String string) {
		this.dni = string;
	}
	public String getNombre() {
		return nombre;
	}
	public Rol getRol() {
		return rol;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public void setRol(String r) {
		if (r.contentEquals("Nutricionista")) {
			this.rol = Rol.Nutricionista;
		}
		else if (r.contentEquals("Paciente")) {
			this.rol = Rol.Paciente;
		}
	}
	
}
