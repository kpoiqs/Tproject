<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
</head>
<body>
	<form action="login" method ="post">
		<input type="text" placeholder="ID" name="id" id="idcheck"><br />
		<input type="password" placeholder="Password" name="password" id="passwordcheck">
		<input type="submit" id="check" value="login"><br />
	</form>
	${message}
	<br />
	<button onclick="location.href='signup.jsp'">sign up</button>
	<button onclick="location.href='find.jsp'">find id</button>
	<button onclick="location.href='findpwd.jsp'">find password</button>
</body>
</html>