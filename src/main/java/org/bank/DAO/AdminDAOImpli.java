package org.bank.DAO;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAOImpli implements AdminDAO{
	private Connection connection;
	private static final String url="jdbc:mysql://localhost:3306/teca62_projects?user=root&password=root";
	private static final String select="select * from admin where Admin_Email_Id=? AND Password=?";

	@Override
	public boolean adminLogin(String emailid, String password) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement ps=connection.prepareStatement(select);
			ps.setString(1, emailid);
			ps.setString(2, password);
			ResultSet resultset=ps.executeQuery();
			if(resultset.next()) {
				return true;
			}
			else {
				return false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		
		
	}

}
