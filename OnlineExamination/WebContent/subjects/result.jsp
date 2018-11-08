<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="al.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Result</title>
<link rel="stylesheet" href="al.css" />
</head>
<body>
<%@page import="java.io.*"%>
<%@page import="java.sql.*" %>
<%@page import="java.net.*"%>

<%

	String[] choice = new String[20];
	String[] dbchoice = new String[20];
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234"); 
	Statement st = con.createStatement();
	String sql = "select * from question";	
	
	ResultSet rs=st.executeQuery(sql);  
	
	 	int i=1,score=0,count=0;
		while(rs.next()){			
			dbchoice[i++]=rs.getString(6);
			count++;
		}
		for(int ij=1;ij<=count;ij++)
		{
			choice[ij]=request.getParameter("choice"+ij);		
		}			
		for(int j=1;j<=count;j++)
		{%>
		<%
		if(dbchoice[j].equals(choice[j])){
			score++;
		}else{
			if((choice[j])!=null)
				out.println("Wrong Choice made<br><hr> "+choice[j]+"<hr>");
			out.println("<br>");
		}
		out.println();
		%>
	<%}
	
	out.println(" Your Score is "+score);
	out.println("<br>");
%>


</body>
</html>