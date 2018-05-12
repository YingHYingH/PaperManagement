package utilold;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

public class MySQLDBcon {
	private static  Connection conn = null;

	@Test
	public static Connection getConn() throws Exception{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String user = "root";
			String password = "0000";
			String url = "jdbc:mysql://localhost:3306/papermanagement";
			try {
				conn = DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
