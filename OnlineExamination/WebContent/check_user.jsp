<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<% 
	String regid = request.getParameter("regid");
	String password = request.getParameter("password");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234"); 
	
	String sql = "select * from users where regid=? and password=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1,regid);
	ps.setString(2,password);
	
	ResultSet rs=ps.executeQuery(); 
	
	
	if(rs.next())
	{
		out.println("Valid User...");
		
				String type=rs.getString(4);				
				if(type.equals("student"))
				{			
					response.sendRedirect("Exam.jsp");				
				}
				else
				{					
					response.sendRedirect("Question.jsp");
				}
	
	}
	else
	{
		response.sendRedirect("login.jsp?msg=Invalid Login Id/ Password");
	}
	
%>