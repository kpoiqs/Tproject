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

.all {
  width: 800px;
  padding: 50px;
  margin: auto;
  width: 50%;
  background-color:WHITE;
  
}

h1 {
	text-align: center;
}

#modify {
	background-color: white;
	font-size: 24px;
	color: skyblue;
	display: inline-block;
	border: 1px solid skyblue;
	padding: 5px;
	cursor: pointer;
	float: right;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#write:hover {
	background-color: skyblue;
	color: white;
}

</style>
</head>
<body>
	<h1>AIR Q&A</h1>
	<div class="all">
<form action="q_update?no=${q.no }" method="post" id="form1" name="form1">
	<tr>
	<td>No : ${q.no}</td><br/>
	<td>Writer : ${q.writer }</td><br/>
	<td>Subject : ${q.subject }</td><br/>
	<td>Content : <input type="text" name="content" value="${q.content }"></td>
	</tr>
	<input type="submit" value="MODIFY" id="modify" values="${q.no}">
	</form>
</div>
</body>
</html>