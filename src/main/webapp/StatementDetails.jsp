<%@page import="org.bank.DAO.BankStatementDAOImpl"%>
<%@page import="org.bank.DAO.BankStatementDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.bank.model.BankStatementDetails"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bank Statement</title>
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

<h2 style="text-align: center;">Bank Statement</h2>

<form>
<input >
</form>

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
        // Retrieve account number from request parameter or session attribute
        String accountNumber = request.getParameter("accountNumber");
        if (accountNumber == null) {
            accountNumber = (String) session.getAttribute("accountNumber");
        }

        // Check if account number is available
        if (accountNumber != null) {
        	int accnum=Integer.parseInt(accountNumber);
            BankStatementDAO dao = new BankStatementDAOImpl();
            List<BankStatementDetails> users = dao.getStatementByAccountNumber(accnum);

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
    <tr>
        <td colspan="6" style="color: red; text-align: center;">Account number is not provided</td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
