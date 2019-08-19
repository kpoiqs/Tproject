<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action = "book_delete" method = "post">
	<input type = "hidden" id = "book_1bno" name = 'book_1bno' value = "${book.bno}" />
	<input type = "text" id = "book_bno" value = "${book.bno}" disabled = 'disabled' /><br/>
	<input type = "text" id = "book_id" value = "${book.id}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_day" value = "${book.day}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_pay" value = "${book.pay}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_sno" value = "${book.sno}" disabled = 'disabled'/><br/>
	<input type = "text" id = "book_seat" value = "${book.seat}" disabled = 'disabled'/><br/>
	
	<input type = "submit" id = "submit" value = "Delete"/>
	</form>
</body>
</html>