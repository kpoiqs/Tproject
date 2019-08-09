<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 유효성 검사 plugin -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
	form input.error, #form textarea.error{
		border : 1px dashed red;
	}


</style>
<script type="text/javascript">
	$(function(){
		//alert("sfsdf");
		$("#form").validate({
			debug : false,
			
			rules:{
				writer : "required",
				subject : "required",
				content : "required"
			},
			
			
			messages:{
				writer : "이름은 필수 항목 입니다.",
				subject : "제목은 필수 항목 입니다.",
				content : "내용은 필수 항목 입니다."
			}			
			
		});
	});
	</script>
</head>
<body>
	<form id="form" method="post" action="q_save">
	
	Writer<input type="text" name="writer" id="writer"><br />
	
	Subject<input type="text" name="subject" id="subject"><br />
	<textarea rows="10" cols="50" name="content" id="content"></textarea><br/>
	<input type="submit">
	</form>
	
</body>
</html>