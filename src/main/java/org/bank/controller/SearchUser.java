package org.bank.controller;

import org.bank.DAO.BankDAO;
import org.bank.DAO.BankDAOImpl;
import org.bank.model.BankUserDetails;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchUser")
public class SearchUser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String searchTerm = request.getParameter("searchTerm");
        BankDAO dao = new BankDAOImpl();

      
        List<BankUserDetails> users = dao.searchUsers(searchTerm);
        HttpSession session=request.getSession();
        session.setAttribute("users", users);
        RequestDispatcher dispatcher=request.getRequestDispatcher("GetAllUserDetails.jsp");
        dispatcher.forward(request, response);
        
    }
    
}
