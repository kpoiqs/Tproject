<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">

$(function(){
	//alert("sfsdf");
	$("#form1").validate({
		debug : false,
		
		rules:{
			content : "required"
		
			},
			
		messages:{
			content : "required"
					
		}	
	});
});
</script>
</head>
<body>
<form action="q_update?no=${q.no }" method="post" id="form1" name="form1">
	
	No : ${q.no}<br/>
	Writer : ${q.writer }<br/>
	Subject : ${q.subject }<br/>
	Content : <input type="text" name="content" value="${q.content }">
<input type="submit" value="modify" id="modify" values="${q.no}">
${q.no} 번째 글입니다.
</body>
</html>