<%@page import="java.util.List"%>
<%@ page import="org.bank.DAO.BankStatementDAOImpl" %>
<%@ page import="org.bank.model.BankStatementDetails" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Check Account Balance</title>
    <style>
        body {
         font-family: Arial, sans-serif;
         }
         
        .container {
         width: 50%;
         margin: 0 auto;
          text-align: center;
           }
           
        .result { 
        margin-top: 20px;
         font-size: 1.2em;
          color: #333;
           }
        .error { 
        color: red;
         }
    </style>
</head>
<body>
    <div class="container">
        <h2>Check Account Balance</h2>

        <form method="post" action="">
            <label for="accountNumber">Enter Account Number:</label>
            <input type="number" id="accountNumber" name="accountNumber" required>
            <button type="submit">Check Balance</button>
        </form>

        <div class="result">
            <%
                String accountNumberStr = request.getParameter("accountNumber");
                if (accountNumberStr != null && !accountNumberStr.isEmpty()) {
                    int accountNumber = Integer.parseInt(accountNumberStr);
                    BankStatementDAOImpl dao = new BankStatementDAOImpl();
                    List<BankStatementDetails> statements = dao.getStatementByAccountNumber(accountNumber);

                    if (statements != null && !statements.isEmpty()) {
                        BankStatementDetails latestStatement = statements.get(statements.size() - 1);
            %>
                        <p>Current Balance for Account Number <%= accountNumber %>: <strong><%= latestStatement.getBalanceamount() %></strong></p>
            <%
                    } else {
            %>
                        <p class="error">No balance details found for account number <%= accountNumber %>.</p>
            <%
                    }
                }
            %>
        </div>
    </div>
</body>
</html>
