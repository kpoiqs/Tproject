<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8">
<title>답변게시판</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 유효성 검사 plugin -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<script type="text/javascript">
	$(function() {
		//alert("sfsdf");
		$("#form").validate({
			debug : false,

			rules : {
				writer : "required",
				subject : "required",
				content : "required"
			},

			messages : {
				writer : "Please enter a valid first name.",
				subject : "Please enter a subject.",
				content : "Please enter a content."
			}
		});
	});
</script>

<style type="text/css">
body{
	width:800px;
	height:600px;
	margin: 0 auto;
	border: 1px solid #000;
}

h1 {
	text-align: center;
}
</style>
</head>
<body>
	<h1>AIR Q&A</h1>

	<form id="form" action="q_reply" method="post">

	WRITER : <input type="text" name="writer"><br/>
	TITLE : <input type="text" name="subject"><br/>
	CONTENT : <textarea rows="5" cols="25" name="content"></textarea><br/>
	
	<input type="submit" value="등록">
	
	</form>
	
</body>
</html>