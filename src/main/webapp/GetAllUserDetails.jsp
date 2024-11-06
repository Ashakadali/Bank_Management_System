<%@page import="org.apache.catalina.User"%>
<%@ page import="org.bank.DAO.BankDAO, org.bank.DAO.BankDAOImpl, org.bank.model.BankUserDetails" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>AllUserDetails</title>
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
 <%!List<BankUserDetails> list; %>
<%
List<BankUserDetails> allUserlist=(List<BankUserDetails>)session.getAttribute("users");
if(allUserlist==null){
	BankDAO dao = new BankDAOImpl();
   list = dao.getAllUserDetails();
}
else{
	list=allUserlist;
}
%>
<center>
    <h2>Bank User Details</h2>

    <!-- Search Form -->
    <form action="searchUser" method="post">
        <input name="searchTerm" placeholder="Enter search term..."><input type="submit" value="SEARCH">
    </form>
    
    <br>
    
    
    <table style="border:2px solid black">
        <tr  style="border:2px solid black">
            <th  style>Name</th>
            <th  style>Email ID</th>
            <th  style>Mobile Number</th>
            <th  style>Aadhar Number</th>
            <th  style>Address</th>
            <th  style>Amount</th>
            <th  style>Gender</th>
            <th  style>PAN Number</th>
        </tr>
        <%
      
            for (BankUserDetails user : list) {
        %>
        <tr  style>
            <td  style><%= user.getName() %></td>
            <td  style><%= user.getEmailid() %></td>
            <td  style><%= user.getMobilenumber() %></td>
            <td  style><%= user.getAadharnumber() %></td>
            <td  style><%= user.getAddress() %></td>
            <td  style><%= user.getAmount() %></td>
            <td  style><%= user.getGender() %></td>
            <td  style><%= user.getPannumber() %></td>
        </tr>
        <%
            }
        %>
    </table>
    </center>
</body>
</html>
