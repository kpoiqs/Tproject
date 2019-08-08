<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Detail QnA</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
	$("#delete").click(function(){
	var result = confirm("${q.no }번 게시글을 삭제하시겠습니까?");
	if(result){
		location.href = "q_delete?no=${q.no }";
	}
	});
});

$(function(){
	$("#modify").click(function(){
	var result = confirm("${q.no }번 게시글을 수정하시겠습니까?");

	if(result != null){
		location.href = "q_update?no=${q.no }";
	}
	});
});

</script>




</head>
<body>
	<h3>Detail QnA</h3>
	<form action="q_update?no=${q.no }" method="post">
	
	No : ${q.no}<br/>
	Writer : ${q.writer }<br/>
	Subject : ${q.subject }<br/>
	Content : <input type="text" name="content" value="${q.content }">
	<button type="button" id="modify">modify</button>
	</form>
	
	<button type="button" id="delete">delete</button>
	<a href="q_input">write</a>
	<a href="#" onclick="history.back()">back to list</a>

</body>
</html>