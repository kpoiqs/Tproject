<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type = "text/javascript">

</script>
</head>
<body>
	<form action="login" method ="post">
		<input type="text" placeholder="ID" name="id" id="idcheck"><br />
		<input type="password" placeholder="Password" name="password" id="passwordcheck">
		<input type="submit" id="check" value="login"><br />
	</form>
	<ul>${account}</ul>
	
	<br />
	<button onclick="location.href='signup.jsp'">sign up</button>
	<button onclick="location.href='find.jsp'">find id</button>
</body>
</html>