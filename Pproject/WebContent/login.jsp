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
		<input type="text" placeholder="ID"><br />
		<input type="password" placeholder="Password">
	<button type="submit">login</button><br />
	</form>
		${message}
		<button>sign up</button>
		<button>find id</button>
</body>
</html>