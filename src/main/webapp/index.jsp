<!DOCTYPE html>
<%@page import="org.bank.model.BankUserDetails"%>
<%@page import="org.bank.DAO.BankDAOImpl"%>
<%@page import="org.bank.DAO.BankDAO"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank Management System</title>
</head>
<body style="display: flex;justify-content: center;align-items: center; color:crimson">
    <div class="container" style=" background-color:#f0ffff; border:5px solid #f0ffff;text-align: center; padding: 20px;border-radius: 10px; width: 700px;  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
        <h2 style="color: Darkblue;">Bank Management System</h2>
        <div style=" border:2px solid Lavender;box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);border-radius:10px; display: flex;justify-content: space-between; background-color:Lavender;">
            <div style="padding: 20px; width: 45%;">
                <h3 style="color: blue;">User Login</h3>
                <form>
                    <input type="email" placeholder="Enter Your Email" name="useremailid" style="padding: 10px;margin: 5px 0; width: 100%; box-sizing: border-box;border:1.5px solid grey;color:black;background-color:white; border-radius:5px;">
                    <br><br>
                    <input type="password" placeholder="Enter Your Password" name="userpassword" style="padding: 10px;margin: 5px 0; width: 100%; box-sizing: border-box; border:1.5px solid grey;color:black;background-color:white; border-radius:5px;">
                    <br>
                    <br>
                    <input type="submit" value="Log in" style="padding: 10px;margin: 5px 0; width: 100%; box-sizing: border-box;border:1.5px solid grey;color:black;background-color:white; border-radius:5px;">
                </form>
                <a style=" color: blue;" href="UserRegistration.jsp">New Account?</a> &nbsp; &nbsp;
                <a style=" color: blue;" href="#">Forgot Password?</a>
            </div>&nbsp;
            <div style=" padding: 20px; width: 45%;">
                <h3 style="color: blue;">Admin Login</h3>
                <form>
                    <input type="email" placeholder="Enter Your Email"name="adminemailid" style="padding: 10px;margin: 5px 0; width: 100%; box-sizing: border-box;border:1.5px solid grey;color:black;background-color:white; border-radius:5px;">
                    <br><br>
                    <input type="password" placeholder="Enter Your Password" name="adminpassword" style="padding: 10px;margin: 5px 0; width: 100%; box-sizing: border-box;border:1.5px solid grey;color:black;background-color:white; border-radius:5px;">
                    <br>
                    <br>
                    <input type="submit" value="Log in" style="padding: 10px;margin: 5px 0; width: 100%; box-sizing: border-box;border:1.5px solid grey;color:black;background-color:white; border-radius:5px;">
                </form>
                 <center> <%!String msg; %>
            <%if(msg!=null)
            %>
            <%=msg%>
            <% %></center>
            </div>
            <%@ page import="org.bank.DAO.AdminDAO" %>
            <%@ page import="org.bank.DAO.AdminDAOImpli" %>
           
            
            <%
            String adminemailid=request.getParameter("adminemailid");
            String password=request.getParameter("adminpassword");
            if(adminemailid!=null&&password!=null){
            AdminDAO adminDAO=new AdminDAOImpli();
            if(adminDAO.adminLogin(adminemailid,password)){
            	RequestDispatcher dispatcher=request.getRequestDispatcher("AdminFunctionality.html");
            	dispatcher.forward(request, response);
            	}
            else{
            	msg="Invalid Data";
            }
            }
           %>
            	<%= adminemailid %>
                <%= password %>
           
           <% 
           String useremailid=request.getParameter("useremailid");
           String userpassword=request.getParameter("userpassword");
           if(useremailid!=null&&userpassword!=null){
        		   int pin=Integer.parseInt(userpassword);
        		   BankDAO dao=new BankDAOImpl();
        		   BankUserDetails userdetails=dao.userLogin(useremailid, pin);
        		   if(userdetails!=null){
        			   session.setAttribute("user", userdetails);
        			   RequestDispatcher dispatcher=request.getRequestDispatcher("Home.jsp");
            		   dispatcher.forward(request, response);
        		   }
        	   else{
        		   msg="Invalid Data";
        	   }        	   %>
        	   <%=useremailid %>
        	   <%=userpassword %>
           <% }%>
            
        </div>
    </div>
</body>
</html>
