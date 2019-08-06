<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>
</head>
<body>
	<form method="post" action="q_save">
	
	Writer<input type="text" name="writer"><br />
	Subject<input type="text" name="subject"><br />
	<textarea rows="10" cols="50" name="content"></textarea><br/>
	<input type="submit">
	</form>
	
</body>
</html>