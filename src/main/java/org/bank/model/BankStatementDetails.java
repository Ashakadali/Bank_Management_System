package org.bank.model;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BankStatementDetails {
	
	private int id;
	private String typeoftransaction;
	private double amount;
	private LocalDate dateoftransaction;
	private LocalTime timeoftransaction;
	private long accountnumber;
	private double balanceamount;

}
