package org.bank.controller;

import java.io.IOException;

import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bank.DAO.BankDAO;
import org.bank.DAO.BankDAOImpl;
import org.bank.model.BankUserDetails;

@WebServlet("/GenerateAccountNumberAndPin")
public class GenerateAccountNumberAndPin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String tempId=request.getParameter("userid");
      int id=Integer.parseInt(tempId);
      Random random=new Random();
      int pin=random.nextInt(10000);
      if(pin<1000) {
    	  pin+=1000;
      }
      int accountnumber=random.nextInt(10000000);
      if(accountnumber<1000000) {
    	  accountnumber+=1000000;
      }
      BankDAO dao=new BankDAOImpl();
      int number=dao.updateAccountNumberAndPin(id, pin, accountnumber);
      if(number!=0) {
    	  System.out.println("Updated Successfully");
      }
    
    }
}
