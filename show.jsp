<%@ page language="java" import="java.sql.*,java.io.*,java.util.Date,java.util.*,java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! int j; %>
<%
	  try {	  	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement ps=con.prepareStatement("insert into appointment values(?,?,?) ");
			int b=Integer.parseInt(session.getAttribute("cno"));
			ps.setInt(1,b);
			String dt = request.getParameter("dt"); 
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); 
			Date dt1 = sdf.parse(dt); 
			java.sql.Date dt2 = new java.sql.Date(dt1.getTime());   
			ps.setDate(2,dt2);
			  j=ps.executeUpdate();
				if(j>0)
				{
					String a=request.getParameter("dt");
					out.println("success"+a);
	
				}
				else
					out.println("error");
		      
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