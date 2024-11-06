package org.bank.DAO;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.bank.DAO.BankDAO;
import org.bank.model.BankUserDetails;

public class BankDAOImpl implements BankDAO{
	private static final String url = "jdbc:mysql://localhost:3306/teca62_projects?user=root&password=root";
	private static final String updateQuery = "UPDATE bank_user_details SET Acount_Number = ?, Pin = ? WHERE Id = ?";
	private static final String insert="INSERT INTO bank_user_details(Name, Emailid,Mobile_Number, Aadhar_Number, Address, Amount, Gender,IFSC_code, Branch, Pan_Number, Status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
	private static final String query = "SELECT * FROM bank_user_details WHERE Name= ? OR Emailid = ? OR Mobile_Number = ? OR Aadhar_Number = ? OR Address=? OR Pan_Number=? OR Gender=?";
	private static final String select="select * from bank_user_details where Emailid=? AND Pin=?";
	private static final String update="update bank_user_details set Amount=? where Acount_Number=?";
	private Connection connection;

    @Override
	
//    public int insertBankUserDetails(String name, String emailid, String mb, String an, String address, String pn,String amount, String gender,String ifsc){
    public int insertBankUserDetails(BankUserDetails bankuserdetails) {
		String insert="INSERT INTO bank_user_details(Name, Emailid,Mobile_Number, Aadhar_Number, Address, Amount, Gender,IFSC_code, Branch, Pan_Number, Status) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(url);
			PreparedStatement preparedStatement=connection.prepareStatement(insert);
			preparedStatement.setString(1,bankuserdetails.getName());
			preparedStatement.setString(2, bankuserdetails.getEmailid());
			preparedStatement.setLong(3, bankuserdetails.getMobilenumber());
			preparedStatement.setLong(4, bankuserdetails.getAadharnumber());
			preparedStatement.setString(5, bankuserdetails.getAddress());
			preparedStatement.setDouble(6, bankuserdetails.getAmount());
			preparedStatement.setString(7, bankuserdetails.getGender());
			preparedStatement.setString(8, "TECA62007"); 
			preparedStatement.setString(9,"JNTU");
			preparedStatement.setString(10,bankuserdetails.getPannumber());
			preparedStatement.setString(11,"Pending");
			return preparedStatement.executeUpdate();
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}

	}

    @Override
    public List<BankUserDetails> getAllUserDetails() {
        List<BankUserDetails> users = new ArrayList<>();
        String select = "SELECT * FROM bank_user_details";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection.prepareStatement(select);
            ResultSet resultset = preparedStatement.executeQuery();
            if(resultset.isBeforeFirst()) {
            while (resultset.next()) {
                BankUserDetails user = new BankUserDetails();
                user.setId(resultset.getInt("Id"));
                user.setName(resultset.getString("Name"));
                user.setEmailid(resultset.getString("Emailid"));
                user.setMobilenumber(resultset.getLong("Mobile_Number"));
                user.setAadharnumber(resultset.getLong("Aadhar_Number"));
                user.setAddress(resultset.getString("Address"));
                user.setAmount(resultset.getDouble("Amount"));
                user.setGender(resultset.getString("Gender"));
                user.setPannumber(resultset.getString("Pan_Number"));
                user.setStatus(resultset.getString("Status"));
                users.add(user);
            }
            }}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return users;
        
	}

    public int updateAccountNumberAndPin(int id, int pin, int accountNumber) {
        
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url);
            PreparedStatement ps = connection.prepareStatement(updateQuery);
            
            ps.setLong(1, accountNumber);
            ps.setInt(2, pin);
            ps.setInt(3, id);
           return ps.executeUpdate();
            
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public List<BankUserDetails> searchUsers(String searchTerm) {
        List<BankUserDetails> users = new ArrayList<>();
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url);
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, searchTerm);
            preparedStatement.setString(2, searchTerm);
            preparedStatement.setString(3, searchTerm);
            preparedStatement.setString(4, searchTerm);
            preparedStatement.setString(5, searchTerm);
            preparedStatement.setString(6, searchTerm);
            preparedStatement.setString(7, searchTerm);



            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                BankUserDetails user = new BankUserDetails();
                user.setId(resultSet.getInt("Id"));
                user.setName(resultSet.getString("Name"));
                user.setEmailid(resultSet.getString("Emailid"));
                user.setMobilenumber(resultSet.getLong("Mobile_Number"));
                user.setAadharnumber(resultSet.getLong("Aadhar_Number"));
                user.setAddress(resultSet.getString("Address"));
                user.setAmount(resultSet.getDouble("Amount"));
                user.setGender(resultSet.getString("Gender"));
                user.setPannumber(resultSet.getString("Pan_Number"));
                user.setStatus(resultSet.getString("Status"));

                users.add(user);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

	@Override
	public BankUserDetails userLogin(String emailid, int password) {
	 try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		connection=DriverManager.getConnection(url);
		PreparedStatement ps=connection.prepareStatement(select);
		ps.setString(1, emailid);
		ps.setInt(2, password);
		ResultSet resultset=ps.executeQuery();
		if(resultset.next()) {
			 BankUserDetails user = new BankUserDetails();
             user.setId(resultset.getInt("Id"));
             user.setName(resultset.getString("Name"));
             user.setEmailid(resultset.getString("Emailid"));
             user.setMobilenumber(resultset.getLong("Mobile_Number"));
             user.setAadharnumber(resultset.getLong("Aadhar_Number"));
             user.setAddress(resultset.getString("Address"));
             user.setAmount(resultset.getDouble("Amount"));
             user.setGender(resultset.getString("Gender"));
             user.setPannumber(resultset.getString("Pan_Number"));
             user.setStatus(resultset.getString("Status"));
             user.setAccountnumber(resultset.getLong("Acount_Number"));
             return user;
		}
		else {
			return null;
		}
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		return null;
	}
	}

	@Override
	public int updateBalanceAmount(double amount, long accountnumber) {
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url);
            PreparedStatement ps = connection.prepareStatement(update);
            ps.setDouble(1, amount);
            ps.setLong(2, accountnumber);
            return ps.executeUpdate();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;

        }
		
		
	}

	
}
