<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Withdrawal check</title>
</head>
<body>
<form method="post" action="Withdrawal">
<input type="hidden" value="${account.id}" name="checkid" />
your id is : ${account.id}<br />
Password<input type="password" name="checkpassword"><br />
<input type="submit" value="check"/><br />
</form>
${message}
</body>
</html>