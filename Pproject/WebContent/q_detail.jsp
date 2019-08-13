<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Detail QnA</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">


$(function(){
	$("#delete").click(function(){
	var result = confirm("${q.no }번 게시글을 삭제하시겠습니까?");
	if(result){
		location.href = "q_delete?no=${q.no }";
	}else{
		return;
	}
	
	
	});
});

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

 $(function(){
	$("#modify").click(function(){
	var result = confirm("${q.no }번 게시글을 수정하시겠습니까?");
	var con = document.form1.content;
	
	if(result){
		
	}else{
		return false;
	}/* ,
	
	if(con==null){
		alert("입력 부탁");
		return false;
	} */
	
	});
}); 
	
 /* $(function(){
		$("#modify").click(function(){
		var con = document.modify;
		
		if(con == null){
			alert("입력 부탁");
			return false;
		}
		});
	});  */
 
 $(function(){
		$("#write").click(function(){
			location.href = "q_form.jsp";
		});
	});

</script>




</head>
<body>
	<h3>Detail QnA</h3>
	<form action="q_update?no=${q.no }" method="post" id="form1" name="form1">

	
	No : ${q.no}<br/>
	Writer : ${q.writer }<br/>
	Subject : ${q.subject }<br/>
	Content : <input type="text" name="content" value="${q.content }">
	<!-- <button type="button" id="modify">modify</button> -->
	<input type="submit" value="modify" id="modify">
	
	</form>
	
	<a href="q_reply_page?grp=${q.grp }">리플달기^^</a>
	<button type="button" id="delete">delete</button>
	<button type="button" id="write">write</button>	<button type="button" onclick="history.back()">back to list</button>

</body>
</html>