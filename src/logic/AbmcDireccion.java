package logic;
import java.sql.SQLException;

import data.DataDireccion;
import entidades.*;

public class AbmcDireccion {
	private DataDireccion dd;
	
	public AbmcDireccion() throws SQLException{
		dd = new DataDireccion();
	}
	
	public void setDireccion(Nutricionista nut) throws SQLException{
		dd.setDireccion(nut);
	}
	public void updateDireccion(Nutricionista nut) throws SQLException{
		dd.update(nut);
	}
}
