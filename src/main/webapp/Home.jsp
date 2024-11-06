<%@page import="org.bank.model.BankStatementDetails"%>
<%@page import="org.bank.model.BankUserDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<style>
body{
background-color: RosyBrown;
}
#homepage{
  padding: 10px;
  margin: 5px 0;
  width: 120px;
  height:50px; 
  box-sizing: border-box;
  border:1.5px solid mistyrose;
  color:black;
  background-color: mistyRose;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  border-radius:5px;
   }
   #username{
   width: 100vw;
   height:60px;
   background-color:Darkgrey;
   color:black;
   border:2px solid Darkgrey;
   text-align:end;
   
   }
   #homepageContainer{
   width:400px;
   height:200px;
   background-color:AliceBlue;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius:10%;
   }
   #teca62{
   font-family: "Goudy Bookletter 1911", sans-serif;
   color:DarkRed;
   font-style:italic;
   }
   
</style>
<body>
<%BankUserDetails bankuserdetails=(BankUserDetails)session.getAttribute("user"); %>
<%BankStatementDetails bankstatementdetails=(BankStatementDetails)session.getAttribute(""); %>
<h3 id="username">
<big><big><big><i class="fa-solid fa-user"></i>&nbsp;Hello:-<%=bankuserdetails.getName() %></big></big></big></h3>
<br><br>
<center><h2 id="teca62">Wel-Come to Teca62 Bank</h2></center>
<center>
<br>
<div>
<div id="homepageContainer">
<br>
<a href="CreditAmount.jsp"><input id="homepage" type="button" value="Credit" float:left></a>&nbsp;&nbsp;
<a href="CheckBalance.jsp"><input id="homepage" type="button" value="Check Balance"></a>&nbsp;&nbsp;
<br><br>
 <a href="DebitAmount.jsp"><input id="homepage" type="button" value="Debit"></a>&nbsp;&nbsp;
 
 <a href="Statement.jsp"><input id="homepage" type="button" value="Statement"></a>&nbsp;&nbsp;
<br><br>

</div>
</center>

</body>
</html>