package data;

import java.sql.*;

import exceptions.ClosedDBException;

public class DbConnector {

	private static DbConnector instancia;
	
	private String driver="com.mysql.cj.jdbc.Driver";
	private String host="localhost";
	private String port="3306";
	private String user="java";
	private String password="himitsu";
	private String db="nutricionista";
	private int conectados=0;
	private Connection conn=null;
	
	private DbConnector(){
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static DbConnector getInstancia() {
		if (instancia == null) {
			instancia = new DbConnector();
		}
		return instancia;
	}
	
	public Connection getConn() throws SQLException{
		try {
			if(conn==null || conn.isClosed()) {
				conn=DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+db, user, password);
				conectados=0;
			}
			conectados++;
		} catch (SQLException e) {
			throw e;
		}
		return conn;
	}
	
	public void releaseConn() throws SQLException, ClosedDBException{
		conectados--;
		try {
			if (conectados<=0) {
				conn.close();
			}
		} catch (NullPointerException e) {
			throw new ClosedDBException("La base de datos está cerrada");
		} catch (SQLException e) {
			throw e;
		}
	}
}
