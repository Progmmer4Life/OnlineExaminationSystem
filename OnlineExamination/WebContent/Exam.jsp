<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam</title>
<link rel="stylesheet" href="al.css" />
</head>
<body>
<script src="al.js"></script>
<form action="login.jsp">
    <button class="float-right submit-button" >Logout</button>
</form>
<%out.println("Welcome "+request.getParameter("name")); %>
<br/><br/>
<form action="subjects/english.jsp">
<input type="submit" value="English"  />
</form>

<form action="subjects/math.jsp">
<input type="submit" value="Mathematics"  />
</form>

</body>
</html>