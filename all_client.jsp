<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*,java.io.*,java.util.Date,java.util.*,java.text.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.center {
  margin: auto;
  width: 50%;
  height: 50%;
  padding: 10px;
  position:fixed;
  top:150px;
  left:280px;
}

.position {
 
  position:fixed;
  top:80px;
  left:290px;
}
</style>
<link rel="stylesheet" href="dashboard.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>


<body>
<div class="sidebar">
<img id="logo" src="finalysis.jpg" width=150px;>

   <a href="all_client.jsp"><i class="fa fa-fw fa-user-o"></i> Clients</a>
   <a href="#"><i class="fa fa-fw fa-calendar"></i> Interviews</a>
   <a href="#"><i class="fa fa-fw fa-credit-card"></i> Payment</a>
   <a href="logout.jsp"><i class="fa fa-fw fa-sign-out"></i> Logout</a>
  
</div>
<div class="main">

<div class="md-form active-cyan active-cyan-2 mb-3  position">
  <input class="form-control" type="text" placeholder="Search" aria-label="Search"   onkeyup="myFunction()" id="myInput">
</div>

<div class="container center">
<table class="table table-bordered table-hover " id="myTable" >
<thead class="thead-dark">
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Information</th>
      <th scope="col">Documents</th>
      <th scope="col">Upload</th>
    </tr>
  </thead>
 
  
  <tbody>
<%
	  try {	  	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement ps=con.prepareStatement("select * from customer");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				rs.previous();
				while(rs.next())
				{
%>
			 <tr>
			 		<th scope="row"><%= rs.getString("nm") %> </th>
			 		<th scope="row"><%= rs.getString("email") %> </th>
			 		<th scope="row"><button type="button" class="btn btn-primary" onclick="show1('<%= rs.getInt("cno") %>')">Information </button> </th>
			 		<th scope="row"><button type="button" class="btn btn-primary" onclick="show2('<%= rs.getInt("cno") %>')">Documents </button> </th>
			 		<th scope="row"><button type="button" class="btn btn-primary" onclick="show3('<%= rs.getInt("cno") %>')">Uploads </button> </th>
			 </tr>	
<%
				}// while ends
			}
			else
			{
				out.println("No Clients ");
			}		
	      }
     catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		  }
	catch(ClassNotFoundException e){
			e.printStackTrace();
		  }
%> 		

 </tbody></table></div>
 </div>
 
 <p id="demo" ></p>
 
 
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"  id="title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <p id="bd"></p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
 
 
  <script>
  
  $('#myTable').DataTable();
  
  function show1(a) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("bd").innerHTML = this.responseText;
	    }
	  };
	  xhttp.open("GET", "t.jsp?dt="+a, true);
	  xhttp.send();
	  document.getElementById("title").innerHTML="Client Details";
	  $('#myModal').modal('show')
	}
  
  function show2(a) {
	  var xhttp = new XMLHttpRequest();
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("bd").innerHTML = this.responseText;
	    }
	  };
	 
	  document.getElementById("title").innerHTML="Documents";
	  $('#myModal').modal('show')
	}
 
  function myFunction() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 1; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("th")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
	}
 
 </script>
</body>
</html>