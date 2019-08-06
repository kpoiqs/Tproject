<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Detail QnA</title>
</head>
<body>
	<h3>Detail QnA</h3>
	<form action="q_update" method="post">
	
	Writer : ${q.writer }<br/>
	Subject : ${q.subject }<br/>
	Content : ${q.content }
	
	</form>
	
	<a href="q_list">back to list</a>

</body>
</html>