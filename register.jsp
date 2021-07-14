<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    
    <style>
      html, body {
      display: flex;
      justify-content: center;
      font-family: Roboto, Arial, sans-serif;
      font-size: 15px;
      }
      form {
      border: 5px solid #f1f1f1;
      }
      input[type=text], input[type=password], input[type=email] , input[type=number]{
      width: 100%;
      padding: 16px 8px;
      margin: 8px 0;
      display: inline-block;
      border: 1px solid #ccc;
      box-sizing: border-box;
      }
      button {
      background-color: #8ebf42;
      color: white;
      padding: 14px 0;
      margin: 10px 0;
      border: none;
      cursor: grabbing;
      width: 100%;
      }
      h1 {
      text-align:center;
      fone-size:18;
      }
      button:hover {
      opacity: 0.8;
      }
      .formcontainer {
      text-align: left;
      margin: 24px 50px 12px;
      width: 500px;
      }
      .container {
      padding: 16px 0;
      text-align:left;
      }
      span.psw {
      float: right;
      padding-top: 0;
      padding-right: 15px;
      }
      /* Change styles for span on extra small screens */
      @media screen and (max-width: 300px) {
      span.psw {
      display: block;
      float: none;
      }
    </style>
  </head>
  <body>
    <form action="cust_data_insert.jsp">
      <h1>Registration Form</h1>
      <div class="formcontainer" >
      <hr/>
      <div class="container">
       <label for="nm"><strong>Name</strong></label>
        <input type="text" placeholder="Enter Name" name="nm" pattern="[A-Za-z- ]*" title="No Numbers & Special Char allowed" required>
        <label for="email"><strong>Email</strong></label>
        <input type="email" placeholder="Enter Email ID" name="email" required>
        <label for="phno"><strong>Contact Number</strong></label>
        <input type="text" placeholder="Enter contact number" name="phno" required>        
        <label for="uname"><strong>Username</strong></label>
        <input type="text" placeholder="Enter Username" name="unm" required onblur="check(this.value)">
        <p id="err"></p>
        <label for="psw"><strong>Password</strong></label>
        <input type="password" placeholder="Enter Password" name="psw" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
     	
      </div>
      <button type="submit">Register</button>
     
      </div>
    </form>
    
    <script>
    
    function check(a)
    {
    	var xmlhttp;
        var url="check_user.jsp?dt="+a;
        if (window.XMLHttpRequest)
        {
            xmlhttp=new XMLHttpRequest();
        }
        else
        {
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange=function()
        {
            if (xmlhttp.readyState==4 && xmlhttp.status==200)
            {
                document.getElementById("err").innerHTML=xmlhttp.responseText;
            }
        }

        xmlhttp.open("GET", url, true);
        xmlhttp.send();	
    }
    
    
    </script>
  </body>
</html>