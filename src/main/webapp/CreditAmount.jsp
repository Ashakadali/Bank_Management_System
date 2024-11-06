<%@page import="org.bank.DAO.BankStatementDAOImpl"%>
<%@page import="org.bank.DAO.BankStatementDAO"%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.bank.model.BankStatementDetails"%>
<%@page import="org.bank.model.BankUserDetails"%>
<%@page import="org.bank.DAO.BankDAOImpl"%>
<%@page import="org.bank.DAO.BankDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Page</title>
</head>
<body>

<% 
    BankUserDetails userdetails = (BankUserDetails) session.getAttribute("user");
    double amount = (Double) session.getAttribute("useramount");
%>

<center>
<form>
    <div id="amount-section">
        <h3>Amount</h3>
        <input placeholder="Enter Amount" id="uamount">
        <input type="hidden" value="<%= userdetails.getAmount() %>" id="damount">
        <input type="button" value="Submit" onclick="validation()">
    </div>
</form>

<p id="display"></p>

<div id="account-section" style="display:none;">
    <h3>Account Number</h3>
    <form>
        <input type="text" placeholder="Enter the Account Number" name="accountNumber">
        <input id="displayuseramount" hidden="true" name="usramount">
        <input type="submit" value="Proceed">
    </form>
</div>
  	<% String uaccountnumber=request.getParameter("accountNumber");
  	String usramount=request.getParameter("usramount");
  	if(uaccountnumber!=null){
  		
  		int useraccountnumber=Integer.parseInt(uaccountnumber);
  		double useramount=Double.parseDouble(usramount);
  		if(userdetails.getAccountnumber()==useraccountnumber){
  			
  			double balanceamount=userdetails.getAmount()+useramount;
  			BankDAO dao=new BankDAOImpl();
  			int result=dao.updateBalanceAmount(balanceamount, useraccountnumber);
  			if(result!=0){
  				BankStatementDetails bsd=new BankStatementDetails();
  				bsd.setTypeoftransaction("credit");
  				bsd.setAmount(useramount);
  				bsd.setDateoftransaction(LocalDate.now());
  				bsd.setTimeoftransaction(LocalTime.now());
  				bsd.setAccountnumber(useraccountnumber);
  				bsd.setBalanceamount(balanceamount);
  				BankStatementDAO bdao=new BankStatementDAOImpl();
  				if(bdao.updateStatementDetails(bsd)){
  					RequestDispatcher dispatcher=request.getRequestDispatcher("Home.jsp");
  					dispatcher.forward(request,response);
  				}
  			}
  		} 
  	}%>

</center>

<script type="text/javascript">
function validation() {
    var uamount = parseFloat(document.getElementById("uamount").value);
    var useramount= parseInt(uamount);
    var damount = parseFloat(document.getElementById("damount").value);

    console.log("User entered amount: " + uamount);
    console.log("Available balance: " + damount);

    if (useramount >= 0) {
        if (useramount <= damount) {
            document.getElementById("amount-section").style.display = "none";
            document.getElementById("account-section").style.display = "block";
            console.log(uamount);
            document.getElementById("displayuseramount").value=useramount;
            
        } else {
            
        	alert("Insufficient Balance");
        }
    } else {
        
    	alert("Invalid Amount");
   }
}
</script>

</body>
</html>
