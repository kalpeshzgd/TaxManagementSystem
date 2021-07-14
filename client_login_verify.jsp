<%@ page language="java" import="java.sql.*,java.io.*,java.util.Date,java.util.*,java.text.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! int i; %>
<%
     String unm=request.getParameter("unm");
     String psw=request.getParameter("psw");
      if(unm.equals("admin") && psw.equals("admin"))
      {
    	    RequestDispatcher rd1=request.getRequestDispatcher("admin.jsp");
			rd1.forward(request,response);
      }
%>
<%
	  try {	  	
		    Class.forName("com.mysql.jdbc.Driver");
			Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
			PreparedStatement ps=con.prepareStatement("select * from customer where uid= ? ");
			ps.setString(1,request.getParameter("unm"));
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
			   
			    String s=rs.getString("psw");
			    i=rs.getInt("cno");
			    if(s.equals(request.getParameter("psw")))
			    {
			    			RequestDispatcher rd=request.getRequestDispatcher("dashboard.jsp");
			    			rd.forward(request,response);
			    }
			    else
			    {
			    	out.println("Invalid Credentials");
			    }
			    
			}
			else
			{
				out.println("Does not Exist. Please Register");
			}		
		  }
	 catch(SQLException e) {
	    	out.println("SQLException caught: " +e.getMessage());
	      }
	 catch(ClassNotFoundException e){
			e.printStackTrace();
	      }
	
%>
<%
		session.setAttribute("cno", i);
%>
</body>
</html>