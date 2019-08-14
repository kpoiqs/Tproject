<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>find pwd</title>
</head>
<body>
<form method="post" action="findpwd">
id<input type="text" name="id">
Email <input type="text" name="email" />
<input type="submit" value="find" /><br />
</form>
your password is : ${account.pwd}
</body>
</html>