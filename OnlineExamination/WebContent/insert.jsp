<html>
<head>
<link rel="stylesheet" href="al.css" />
</head>
<body>

<%@page import="java.sql.*" %>
<%@page import="java.sql.ResultSet" %>
<%
try{
	String regid = request.getParameter("regid");
	String password = request.getParameter("password");
	String name = request.getParameter("name");	
	String type = request.getParameter("type");
	String btn=  request.getParameter("btn");
	
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); //register
	
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234"); //connection establish 
	
	
	if(btn.equals("PushUser")){
			String sql = "insert into USERS values(?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql); //create statement object
			st.setString(1,regid);
			st.setString(2,password);
			st.setString(3,name);
			st.setString(4,type);
			int success=st.executeUpdate();
			if(success>0)
			{
				response.sendRedirect("login.jsp?msg=Registered Successfully");
			}
			else
			{
				response.sendRedirect("admin.jsp?msg=Try Again..");
			}
	}
	else if(btn.equals("PopUser"))
	{
			String sql="delete from users where regid=?";
			PreparedStatement st = con.prepareStatement(sql); //create statement object
			st.setString(1,regid);
			int success=st.executeUpdate();
			if(success>0)
			{
				Statement s = con.createStatement();
				String sq="select * from users";
				ResultSet rs = s.executeQuery(sq);
				out.println("PoP Successful ! User with Regid "+regid+" is Removed");
				out.println("<h1>Users</h1><br/>");
				out.println(" <b><u>RegId</u>"+" &nbsp;&nbsp;&nbsp;&nbsp;"+"<u>name</u></b>");
				out.println("<hr>");
				while(rs.next()){
					out.println(" "+rs.getString(1)+"&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString(3));
					out.println("<br>");
				}
				out.println("<hr>");	
			}
			else
			{
				response.sendRedirect("admin.jsp?msg=Try Again..");
			}
	}else{
		Statement st = con.createStatement();
		String sql="select * from users";
		ResultSet rs = st.executeQuery(sql);
		out.println("<h1>Users</h1><br/>");
		out.println(" <b><u>RegId</u>"+" &nbsp;&nbsp;&nbsp;&nbsp;"+"<u>name</u></b>");
		out.println("<hr>");
		while(rs.next()){
			out.println(" "+rs.getString(1)+"&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString(3));
			out.println("<br>");
		}
		out.println("<hr>");
	}
	
	
	con.close();
}catch(Exception e)
{
	System.out.println(e);
}

	%>
	<form action="admin.jsp">
	Click To Go to Admin page..
	<input type="submit" value="AdminPage"/></form>
	</body>
	</html>