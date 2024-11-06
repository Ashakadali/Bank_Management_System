package org.bank.DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.bank.model.BankStatementDetails;

public class BankStatementDAOImpl implements BankStatementDAO{
	private static final String url = "jdbc:mysql://localhost:3306/teca62_projects?user=root&password=root";
	private Connection connection;
	private static final String insertdetails="insert into bank_statement_details (Transaction_Type, Transaction_Amount, Transaction_Date, Transaction_Time, Account_Number, Balance_Amount)values(?,?,?,?,?,?)";
	@Override
	public boolean updateStatementDetails(BankStatementDetails bankstatementdetails) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement ps=connection.prepareStatement(insertdetails);
			ps.setString(1, bankstatementdetails.getTypeoftransaction());
			ps.setDouble(2, bankstatementdetails.getAmount());
			ps.setDate(3,  Date.valueOf(LocalDate.now()));
			ps.setTime(4,  Time.valueOf(LocalTime.now()));
			ps.setLong(5, bankstatementdetails.getAccountnumber());
			ps.setDouble(6, bankstatementdetails.getBalanceamount());
			int result=ps.executeUpdate();
			if(result!=0) {
				return true;
			}
			else {
				return false;
			}

			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
		
		
	}
	@Override
	public List<BankStatementDetails> getStatementByAccountNumber(int accountNumber) {
	    List<BankStatementDetails> statements = new ArrayList();
	    String query = "SELECT * FROM bank_statement_details WHERE Account_Number = ?";
	    
	    try (Connection connection = DriverManager.getConnection(url);
	         PreparedStatement ps = connection.prepareStatement(query)) {
	        
	        ps.setInt(1, accountNumber);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            BankStatementDetails statement = new BankStatementDetails();
	            statement.setTypeoftransaction(rs.getString("Transaction_Type"));
	            statement.setAmount(rs.getDouble("Transaction_Amount"));
	            statement.setDateoftransaction(rs.getDate("Transaction_Date").toLocalDate());
	            statement.setTimeoftransaction(rs.getTime("Transaction_Time").toLocalTime());
	            statement.setAccountnumber(rs.getInt("Account_Number"));
	            statement.setBalanceamount(rs.getDouble("Balance_Amount"));
	            statements.add(statement);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return statements;
	}

}
