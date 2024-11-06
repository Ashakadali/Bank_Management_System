package org.bank.controller;
import org.bank.DAO.BankDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bank.DAO.BankDAOImpl;
import org.bank.model.BankUserDetails;
@WebServlet("/Registration")
public class UserRegistration extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		BankDAO dao=new BankDAOImpl();
		String name=request.getParameter("name");
	String emailid=request.getParameter("emailid");
	String mb=request.getParameter("mb");
    Long mobile=Long.parseLong(mb);
	String an=request.getParameter("an");
	Long aadhar=Long.parseLong(an);
	String address=request.getParameter("address");
	String pn=request.getParameter("pn");
	String amount=request.getParameter("amount");
	Double bankamount=Double.parseDouble(amount);
	String gender=request.getParameter("gender");
	
	PrintWriter writer=response.getWriter();
	response.setContentType("text/html");
	HttpSession session=request.getSession();
	BankUserDetails userDetails = new BankUserDetails();
	userDetails.setName(name);
	userDetails.setEmailid(emailid);
	userDetails.setMobilenumber(mobile);
	userDetails.setAadharnumber(aadhar);
	userDetails.setAddress(address);
	userDetails.setPannumber(pn);
	userDetails.setAmount(bankamount);
	userDetails.setGender(gender);
	int result=dao.insertBankUserDetails(userDetails);
	if(result!=0) {
		writer.println("Registration is Successfull");
		RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
	
	}
}
