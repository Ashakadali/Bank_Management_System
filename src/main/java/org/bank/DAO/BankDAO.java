package org.bank.DAO;

import org.bank.model.BankUserDetails;

import java.util.List;

import org.bank.DAO.BankDAO;

public interface BankDAO {

	int insertBankUserDetails(BankUserDetails bankuserdetails);
	List<BankUserDetails> getAllUserDetails();
	 int updateAccountNumberAndPin(int id, int pin, int accountNumber);
     List<BankUserDetails> searchUsers(String searchTerm);
     BankUserDetails userLogin(String emailid,int password);
     public int updateBalanceAmount(double amount,long accountnumber);
     

}
