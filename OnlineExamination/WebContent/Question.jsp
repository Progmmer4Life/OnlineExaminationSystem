<!DOCTYPE html>
<html>
<head>
<script src="al.js"></script>
<script>


</script>
<%@page import="java.sql.*"%>

<meta charset="UTF-8">
<title>Instructor</title>
<link rel="stylesheet" href="al.css" />
</head>
<body onload="getname()">

<form action="login.jsp">
    <button class="float-right submit-button" >Logout</button>
</form>



<form action="pushqns.jsp" >
<h1>Question Management</h1>

Statement:<br/> <input type="text" name="statement"/><br/>
Choice1: <br/><input type="text"  name="choice1"/><br/>
Choice2: <br/><input type="text"  name="choice2"/><br/>
Choice3: <br/><input type="text"  name="choice3"/><br/>
Choice4: <br/><input type="text"  name="choice4"/><br/>
Answer: <br/><input type="text" placeholder="Please Enter full answer as in option...." name="answer"><br/>
<input type='submit' name='btn' value='PushQuestion' />
<input type='submit' name='btn' value='PopQuestion' />
<input type='submit' name='btn' value='DisplayQuestion' />
</form>


</body>
</html>