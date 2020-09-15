package entidades;
import java.time.LocalTime;
public class Horario {
	private LocalTime horaDesde;
	private LocalTime horaHasta;
	private String dia;
	
	public LocalTime getHoraDesde() {
		return horaDesde;
	}
	public void setHoraDesde(LocalTime horaDesde) {
		this.horaDesde = horaDesde;
	}
	public LocalTime getHoraHasta() {
		return horaHasta;
	}
	public void setHoraHasta(LocalTime horaHasta) {
		this.horaHasta = horaHasta;
	}
	public String getDia() {
		return dia;
	}
	public void setDia(String dia) {
		this.dia = dia;
	}
	
	@Override
	public String toString() {
		return "[dia=" + dia + ", desde=" + horaDesde + ", hasta=" + horaHasta + "]";
	}
	
}
