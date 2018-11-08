<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>QuestionUpdates</title>
<link rel="stylesheet" href="al.css"/>
</head>
<body>
<%@page import="java.sql.*"%>

<%
	
	String statement = request.getParameter("statement");
	String choice1 = request.getParameter("choice1");
	String choice2 = request.getParameter("choice2");
	String choice3 = request.getParameter("choice3");
	String choice4 = request.getParameter("choice4");
	String answer = request.getParameter("answer");	
	String btn=  request.getParameter("btn");	
	Class.forName("oracle.jdbc.driver.OracleDriver"); //register	
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234"); //connection establish	
	if(btn.equals("PushQuestion"))
	{
			//for insertion of qns
			String sql = "insert into QUESTION values(?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql); //create statement object
			
			st.setString(1,statement);
			st.setString(2,choice1);
			st.setString(3,choice2);
			st.setString(4,choice3);
			st.setString(5,choice4);
			st.setString(6,answer);
			int success=st.executeUpdate();
			if(success>0)
			{
				response.sendRedirect("Question.jsp?msg=Question Database Updated");
			}
			else{out.println("error");}
	}
	else if(btn.equals("PopQuestion")){
		
		Statement st = con.createStatement();	
		String sql = "delete from question where statement='"+statement+"'";
		
		int count = st.executeUpdate(sql);
		if(count>0)
		{
			Statement s = con.createStatement();
			String sq="select * from question";
			ResultSet rs = s.executeQuery(sq);
			out.println("<h1>English Questions</h1>");		
			out.println("<hr><br/>");
			int i=0;
			while(rs.next()){
				out.println("Q No."+i+") ");
				out.println(" "+rs.getString(1)+"<br>A. "+rs.getString(2)+"<br>B. "+rs.getString(3)+"<br>C. "+rs.getString(4)+"<br>D. "+rs.getString(5)+"<br><br>");
				out.println("Answer is  "+rs.getString(6));
				out.println("<br><hr/>");
				i++;
			}
		}
		else
		{
			out.println("Try again...");			
		}

	}
	else{
		Statement st = con.createStatement();
		String sql="select * from question";
		ResultSet rs = st.executeQuery(sql);
		out.println("<h1>English Questions</h1>");		
		out.println("<hr><br/>");
		int i=1;
		while(rs.next()){
			out.println("Q No."+i+")");
			out.println(" "+rs.getString(1)+"<br>A. "+rs.getString(2)+"<br>B. "+rs.getString(3)+"<br>C. "+rs.getString(4)+"<br>D. "+rs.getString(5)+"<br><br>");
			out.println("Answer is  "+rs.getString(6));
			out.println("<br><hr/>");
			i++;
		}
				
	}
	
	con.close();

%>
</body>
</html>