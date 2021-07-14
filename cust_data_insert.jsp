<%@ page language="java" import="java.sql.*,java.io.*,java.util.Date,java.util.*,java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!  long phno;
int j;
	
%>
<%
	  try {	  	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement ps=con.prepareStatement("insert into customer(nm,email,phno,uid,psw) value(?,?,?,?,?) ");
		    ps.setString(1,request.getParameter("nm"));
		    ps.setString(2,request.getParameter("email"));
		    phno=Long.parseLong(request.getParameter("phno"));
		    ps.setLong(3,phno);
		    ps.setString(4,request.getParameter("unm"));
		    ps.setString(5,request.getParameter("psw"));
		    j=ps.executeUpdate();
			if(j>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("client_form.jsp");
    			rd.forward(request,response);
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