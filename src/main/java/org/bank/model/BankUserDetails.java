package org.bank.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class BankUserDetails {
	
	private int id;
	private String name;
	private String emailid;
	private int pin;
	private long mobilenumber;
	private long aadharnumber;
	private String address;
	private double amount;
	private String gender;
	private long accountnumber;
	private String ifsccode;
	private String branch;
	private String pannumber;
	private String status;

}
