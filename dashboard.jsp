<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  session="false"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="dashboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
  
  background-color: #666;
  backgroung-image:url("tax.png");
  padding: 30px;
  text-align: center;
  font-size: 35px;
  color: white;
}

</style>
</head>
<body >
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<header>

<h2 style="font-size:60px"><center> WELCOME TO FINALYSIS</center></h2>
  
 </header>
<div class="sidebar">
<img id="logo" src="finalysis.jpg" width=150px;>


<%
		HttpSession ns = request.getSession(false);
        if(ns==null)
        {
%>
  
  <a href="register.jsp"><i class="fa fa-fw fa-user"></i> Register</a>
  <a href="client_form.jsp"><i class="fa fa-fw fa-sign-in"></i> Login</a>
  <a href="client_form.jsp"><i class="fa fa-fw fa-user"></i> Admin</a>
  
  <%
      }
      else
     {
    	  
      
  %>                    
   <a href="dashboard.jsp"><i class="fa fa-fw fa-home"></i> Home</a>
   <a href="documents.jsp"><i class="fa fa-fw fa-file"></i> Documents</a>
   <a href="schedule_interview.jsp"><i class="fa fa-fw fa-calendar"></i> Schedule Interview</a>
   <a href="#summary"><i class="fa fa-fw fa-envelope"></i> Tax Summary</a>
   <a href="payment.jsp"><i class="fa fa-fw fa-envelope"></i> Payment</a>
   <a href="logout.jsp"><i class="fa fa-fw fa-sign-out"></i> Logout</a>
  <% } %>
</div>

<div class="main">
  
  <p style="font-size:25px">Tax management means, the management of finances, for the purpose of paying tax.The objective of Tax Management is to comply with the provisions of Income Tax Law and its allied rules.Tax Management deals with filing of Return in time, getting the accounts audited, deducting tax at source etc</p>
  <p style="font-size:25px">Tax planning is the analysis of a financial situation or plan from a tax perspective. The purpose of tax planning is to ensure tax efficiency. Through tax planning, all elements of the financial plan work together in the most tax-efficient manner possible.</p>
</div>

</body>

<body>

</body>
</html>