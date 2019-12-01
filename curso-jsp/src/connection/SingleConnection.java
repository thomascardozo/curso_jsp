package connection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Responsável por fazer a conexão com o banco de dados
 * @author alex
 *
 */
public class SingleConnection {
	
	private static String banco = "jdbc:postgresql://localhost:5432/devlabstg?autoReconnect=true";
	private static String password = "admin";//senha da hospedagem
	private static String user = "admin";
	private static Connection connection = null;
	//banco: devlabs1_projetojspeservlet e devlabs1_projetojsf1 / user: / senha:  
	//projeto no computador local => user: postgres / senha: admin / projeto: curso-jsp
	static {
		conectar();
	}
	
	public SingleConnection() {
		conectar();
	}
	
	private static void conectar(){
		try {
			
			if(connection == null){
				Class.forName("org.postgresql.Driver");
				connection = DriverManager.getConnection(banco, user, password);
				connection.setAutoCommit(false);
			}
			
		}catch (Exception e){
			e.printStackTrace();
			throw new RuntimeException("Erro ao conectar com o banco de dados "+e.getMessage());
		}
	}
	
	public static Connection getConnection() {
		return connection;
	}
}
