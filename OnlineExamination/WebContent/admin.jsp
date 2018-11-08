<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
<link rel="stylesheet" href="al.css" />
<script src="md5.js"></script>
		<script>
		function convert(){
			var password=document.getElementById("password").value;
			var npassword=md5(password);
			//alert(npassword);
			document.getElementById("password").value=npassword;
		}
		
		
		</script>
</head>
<body >

<script src="al.js"></script>
<a target="_blank" href="login.jsp" style="position:absolute;right:0">To Login Page</a>
<table><tr><td style="width:50%">

<h1>User Management</h1>

<form action="insert.jsp" onsubmit="convert()">
ID: <br/><input type="text" id="id" name="regid" autocomplete="off"/><br/>
Password:<br/> <input type="password" id='password' name="password" autocomplete="off"/><br/>
Name:<br/> <input type="text" id="name" name="name" autocomplete="off"/><br/>
Type:<br/><select id="type" name="type">
<option id="student" value="student">Student </option>
<option id="instructor" value="instructor">Instructor </option>
</select><br/>
<input type='submit' name="btn" value='PushUser'/>
<input type='submit' name="btn" value='PopUser' /> 
<input type='submit' name="btn" value='ViewUser' /> 

</form>
<hr/></td></tr></table>


</body>
</html>
