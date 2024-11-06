<%@ page import="org.bank.DAO.BankDAO, org.bank.DAO.BankDAOImpl, org.bank.model.BankUserDetails" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AllUserDetails</title>
</head>
<body>
<center>
    <h2>Bank User Details</h2>
    <table style="border:2px solid black">
        <tr style="border:2px solid black">
            <th style="border:2px solid black">Name</th>
            <th style="border:2px solid black">Email ID</th>
            <th style="border:2px solid black">Mobile Number</th>
            <th style="border:2px solid black">Aadhar Number</th>
            <th style="border:2px solid black">Address</th>
            <th style="border:2px solid black">Amount</th>
            <th style="border:2px solid black">Gender</th>
            <th style="border:2px solid black">PAN Number</th>
            <th style="border:2px solid black">Status</th>
        </tr>
        <%
            
            BankDAO dao = new BankDAOImpl();
            List<BankUserDetails> users = dao.getAllUserDetails();

            for (BankUserDetails user : users) {
               
                if (user.getStatus().equals("Pending")) {
        %>
        <tr style="border:2px solid black; border-collapse:collapse">
            <td style="border:2px solid black"><%= user.getName() %></td>
            <td style="border:2px solid black"><%= user.getEmailid() %></td>
            <td style="border:2px solid black"><%= user.getMobilenumber() %></td>
            <td style="border:2px solid black"><%= user.getAadharnumber() %></td>
            <td style="border:2px solid black"><%= user.getAddress() %></td>
            <td style="border:2px solid black"><%= user.getAmount() %></td>
            <td style="border:2px solid black"><%= user.getGender() %></td>
            <td style="border:2px solid black"><%= user.getPannumber() %></td>
           <td style="border:2px solid black">
           <form action="GenerateAccountNumberAndPin" method="post">
           <input value=<%=user.getId() %> hidden="true" name="userid">
           <input type="submit" value="ACCEPT" >
           </form></td>
            </td>  
        </tr>
        <%
                }
            }
        %>
    </table>
</center>
</body>
</html>
