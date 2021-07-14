<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  session="false"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="dashboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
$( function() {
    $.datepicker.setDefaults({
        onClose:function(date, inst){
            $("#selectedDtaeVal").html(date);
        }
    });

    $( "#datepicker" ).datepicker();
});
</script>

<style>
.timer {
    position:fixed;
     left: 900px;
     top:150px;
    text-align: left;
    margin: 24px 50px 12px;  
    }
.date1 {
    position:fixed;
     left: 600px;
     top:155px;
    text-align: left;
    margin: 24px 50px 12px;
   }
   
  

.vertical-center {
  margin: 0;
  position: absolute;
  top: 450px;
  left:840px;
  -ms-transform: translateY(-50%);
  transform: translateY(-50%);
  }
  
  .button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}

.button4 {background-color: #e7e7e7; color: black;}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  position:fixed;
  top:500px;
  left:750px;
  padding: 20px;
  border: 1px solid #888;
  width: 300px;
  
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
 
</style>
</head>
<body >
<div class="sidebar">
<%
		HttpSession ns = request.getSession(false);
        if(ns==null)
        {
%>
  
  <a href="register.jsp"><i class="fa fa-fw fa-envelope"></i> Register</a>
  <a href="client_form.jsp"><i class="fa fa-fw fa-wrench"></i> Login</a>
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
<div class="date1">
<h2>            Interview Date </h2><br><br><br>
<p>Date: <input type="text" id="datepicker">     <i class="fa fa-calendar"></i></p>
<br/>
<h1 id="selectedDtaeVal" hidden></h1>
</div>
<div   class="timer">
<table> 
<tr><td align="center">
<h2> Time Slots </h2> </td></tr>
<tr><td>
<input type="radio" name="optradio" >12:00 PM - 01:00 PM <br><br></td></tr>
<tr><td>
<input type="radio" name="optradio" >01:00 PM - 02:00 PM <br><br></td></tr>
<tr><td>
<input type="radio" name="optradio" >04:00 PM - 05:00 PM <br><br></td></tr>
<tr><td>
<input type="radio" name="optradio" >05:00 PM - 06:00 PM <br><br></td></tr>
</table>
</div>


  <div class="vertical-center">
    <button class="button button4" onclick="disp()"  id="btn"><b>Submit</b></button>
  </div>

 

<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <p id="display"></p>
  </div>

</div>

</div>
 <script>

function disp()
{
	var a = document.getElementById("selectedDtaeVal").innerHTML;
	document.getElementById("display").innerHTML="<font color='green'>successfully booked on"+a+"</font>";
	
}

var modal = document.getElementById("myModal");

//Get the button that opens the modal
var btn = document.getElementById("btn");

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks the button, open the modal 
btn.onclick = function() {
	var a = document.getElementById("selectedDtaeVal").innerHTML;
	document.getElementById("display").innerHTML="<p style='font-size:20px'><font color='green' >Successfully Booked on  "+a+"</font></p>";
modal.style.display = "block";
}

//When the user clicks on <span> (x), close the modal
span.onclick = function() {
modal.style.display = "none";
}

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
if (event.target == modal) {
 modal.style.display = "none";
}
}
</script>
</body>

</html>