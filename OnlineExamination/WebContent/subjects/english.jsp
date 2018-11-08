<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="al.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>English</title>
<link rel="stylesheet" href="al.css" />

<script type="text/javascript">
    setTimeout(function(){ document.getElementById('s').click(); }, 60000); // 60 seconds
   
</script>
</head>
<body>
<%@page import="java.sql.*" %>

Time is Running Hurry Up!<iframe src="newTimer.jsp" height="35" width="30" style="border:none;"></iframe>
<% 
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234"); 
	Statement st = con.createStatement();
	String sql = "select * from question";	
	
	ResultSet rs=st.executeQuery(sql);  
	
	 	int i=1;
		while(rs.next()){ %>
			<form action='result.jsp' method="post">			
			<br><br>
			<%
			String a=rs.getString(2);
			String b=rs.getString(3);
			String c=rs.getString(4);
			String d=rs.getString(5);
			
			
			 out.println("Q No."+i+") ");
			%>
			
			<h3><%out.println(rs.getString(1)); %><br/></h3>
			<input type="radio" name=choice<%=i%> value="<%= a%>"><%out.println(rs.getString(2)); %>
			<input type="radio" name=choice<%=i%> value="<%= b%>"><%out.println(rs.getString(3)); %>
			<input type="radio" name=choice<%=i%> value="<%= c%>"><%out.println(rs.getString(4)); %>
			<input type="radio" name=choice<%=i%> value="<%= d%>"><%out.println(rs.getString(5)); %>
			<br/><br/>
			<hr/>
			
		<%i++;}%>
		<br/><br/>
		<input type='submit' value='Submit' id='s'>
		</form>
		<%
		
	con.close();  
	
%>

</body>
</html>