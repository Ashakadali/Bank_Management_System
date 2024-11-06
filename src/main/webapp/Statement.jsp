<%@page import="java.util.List"%>
<%@page import="org.bank.DAO.BankStatementDAOImpl"%>
<%@page import="org.bank.DAO.BankStatementDAO"%>
<%@page import="org.bank.model.BankStatementDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Page</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<center>
    <p id="display"></p>
    <div id="account-section">
        <h3>Account Number</h3>
        <form action="Statement.jsp" method="get">
            <input type="text" placeholder="Enter the Account Number" name="accountNumber" required>
            <input id="displayuseramount" hidden="true" name="usramount">
            <input type="submit" value="Proceed">
        </form>
    </div>
</center>

<%
    String accountNumber = request.getParameter("accountNumber");
    if (accountNumber != null) {
        try {
            int accnumber = Integer.parseInt(accountNumber);
            
            session.setAttribute("accountNumber", accountNumber);
            
            BankStatementDAO sdao = new BankStatementDAOImpl();
            List<BankStatementDetails> users = sdao.getStatementByAccountNumber(accnumber);
            
            if (users != null && !users.isEmpty()) {
%>
                <h2 style="text-align: center;">Bank Statement</h2>
                <table>
                    <tr>
                        <th>Transaction Type</th>
                        <th>Transaction Amount</th>
                        <th>Transaction Date</th>
                        <th>Transaction Time</th>
                        <th>Account Number</th>
                        <th>Balance Amount</th>
                    </tr>
<%
                for (BankStatementDetails user : users) {
%>
                    <tr>
                        <td><%= user.getTypeoftransaction() %></td>
                        <td><%= user.getAmount() %></td>
                        <td><%= user.getDateoftransaction() %></td>
                        <td><%= user.getTimeoftransaction() %></td>
                        <td><%= user.getAccountnumber() %></td>
                        <td><%= user.getBalanceamount() %></td>
                    </tr>
<%
                }
            } else {
%>
                <p style="text-align:center; color:red;">No transaction details found for account number: <%= accnumber %></p>
<%
            }
        } catch (NumberFormatException e) {
%>
            <p style="text-align:center; color:red;">Invalid account number format. Please enter a valid number.</p>
<%
        }
    }
%>
</table>
</body>
</html>
