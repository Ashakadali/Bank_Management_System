package org.bank.DAO;

import java.util.List;

import org.bank.model.BankStatementDetails;

public interface BankStatementDAO {
	public boolean updateStatementDetails(BankStatementDetails bankstatementdetails);
	public List<BankStatementDetails> getStatementByAccountNumber(int accountNumber);

}