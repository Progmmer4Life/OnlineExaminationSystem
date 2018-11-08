<html>
	<head>
		<title>Login Page</title>
		<script src="md5.js"> </script>
		<script>
		function convert(){
			var password=document.getElementById("password").value;
			var npassword=md5(password);
			//alert(npassword);
			document.getElementById("password").value=npassword;
		}
		
		
		</script>
		<link rel="stylesheet" href="al.css" />
	</head>
	<body>
	
	<h2>Sign In</h2>
	<%
		String msg = request.getParameter("msg");
		if(msg!=null)
		{
			out.println(msg);
		}
	%>
	<form action="check_user.jsp" method="post" onsubmit="convert()">
	<table>
		<tr>
			<td>Login Id</td>
			<td><input type="text" name="regid" autocomplete="off"/></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="password" name="password" autocomplete="off" id="password"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="Sign In"/>
				<input type="reset" value="Cancel"/>
				
			</td>
		</tr>
			
	</table>
	</form>
	<form action="admin.jsp" method="post">
		<input type="submit" value="Add another user" />
	</form>
	
	</body>
</html>