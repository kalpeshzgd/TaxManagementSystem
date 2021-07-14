<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>  
<link rel="stylesheet" href="dashboard.css">
<link rel="stylesheet" href="documents.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
disp()
{
	
	alert("Successfully Submitted");
}


</script>
</head>
  <div class="container">
   
    <div class="sidebar">
<%
		HttpSession ns = request.getSession(false);
        if(ns==null)
        {
%>
  
  <a href="register.jsp"><i class="fa fa-fw fa-user"></i> Register</a>
  <a href="clientlogin.jsp"><i class="fa fa-fw fa-sign-in"></i> Login</a>
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
<h1>Upload Documents</h1>
    <hr>
    <form action="doc_upload_data.jsp"  method="post">

    <label for="form-16"><b>Form-16 (PART A/PART B)</b></label><br>
    <input type="text" placeholder="Upload Form-16" name="form-16" id="form-16" required>
    <input type="file" multiple><br>
    
    <label for="pan"><b>PAN</b></label><br>
    <input type="text" placeholder="Upload PAN Card " name="adhar" id="adhar" required>
	<input type="file" ><br>

    <label for="adhar card"><b>Adhar Card</b></label><br>
    <input type="text" placeholder="Upload Adhar Card " name="adhar" id="adhar" required>
    <input type="file" ><br>
    
    <label for="salary slip"><b>Salary Slip</b></label><br>
    <input type="text" placeholder="Upload Salary Slips" name="adhar" id="adhar" required>
    <input type="file" multiple><br>
    
    <label for="salary slip"><b>Tax-Saving Investment Proofs</b></label><br>
    <input type="text" placeholder="Upload Tax-Saving Investment Proofs" name="adhar" id="adhar" required>
    <input type="file" multiple><br>
    
    <label for="salary slip"><b>Other Investment Proofs</b></label><br>
    <input type="text" placeholder="Upload Other Investment Proofs" name="adhar" id="adhar" required>
    <input type="file" multiple><br>
    
    
    <label for="other doc"><b>Other Documents</b></label><br>
    <input type="text" placeholder="Upload Other Documents" name="adhar" id="adhar" required>
    <input type="file" multiple>
    
    <br><input type="button" value="submit"  onclick="disp()">
    </form>
  </div>
  </div>
</html>