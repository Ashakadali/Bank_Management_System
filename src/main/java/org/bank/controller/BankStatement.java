package org.bank.controller;


import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.bank.DAO.BankStatementDAOImpl;
import org.bank.model.BankStatementDetails;

@WebServlet("/BankStatement")
public class BankStatement extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
        
        BankStatementDAOImpl dao = new BankStatementDAOImpl();
        List<BankStatementDetails> statements = dao.getStatementByAccountNumber(accountNumber);
        
        // Set the list of statements as a request attribute to be accessed in JSP
        request.setAttribute("statements", statements);
        
        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("bankStatement.jsp");
        dispatcher.forward(request, response);
    }
}
