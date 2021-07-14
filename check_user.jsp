<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*,java.io.*,java.util.Date,java.util.*,java.text.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! String a;  %>
<%
	  try {	  	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement ps=con.prepareStatement("select * from customer");
			a=request.getParameter("dt");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			   
			   
			    if(a.equals(request.getParameter("uid")))
			    {
			    	out.println(" Username is already taken ");		
			    }
			  
			    
			}
			
		  }
	 catch(SQLException e) {
	    	out.println("SQLException caught: " +e.getMessage());
	      }
	 catch(ClassNotFoundException e){
			e.printStackTrace();
	      }
	
%>
</body>
</html>