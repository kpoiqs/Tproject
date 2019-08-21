<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>AIR Q&A</title>

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
	$("#form").validate({
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


<style type="text/css">

h1,h2 {
	text-align: center;
}

#write {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#write:hover{
	background-color: skyblue;
	color: white;
}

#delete {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#delete:hover{
	background-color: skyblue;
	color: white;
}
#reply {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#reply:hover{
	background-color: skyblue;
	color: white;
}

#modify {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#modify:hover{
	background-color: skyblue;
	color: white;
}

#bl {
  background-color: white;
  font-size: 24px;
  color: skyblue;
  display: inline-block;
  border: 1px solid skyblue;
  padding: 5px;
  cursor: pointer;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;

}
#bl:hover{
	background-color: skyblue;
	color: white;
}

tr.sub{
	font-weight: bold;
	background-color: skyblue;
	
}

body {
	width: 800px;
	margin: 0 auto;
	border: 1px;
}

.tb{
 width: 500px;
  margin: auto;
}

td{
	 float: left;
}


</style>

</head>
<body>


	
	
	<h1>AIR Q&A</h1>
	<h2>DETAIL</h2>
	<div class="all">
	
	<form action="q_modify?no=${q.no }" method="post" id="form" name="form">
	<table class="tb">
	
					<tr>
					<th>NO</th>
					<td><input type="text" id="no" name="no" value="${q.no}" readonly></td>
						
				</tr>
				
				<tr>
					<th>WRITER</th>
					<td><input type="text" id="writer" name="writer" value="${q.writer}" maxlength="100" readonly></td>
				</tr>

				<tr>
					<th>SUBJECT</th>

					<td><input type="text" id="subject" name="subject" value="${q.subject}" style="width: 345px" 
						maxlength="40"></td>
				</tr>
				
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content" style="width: 345px; height: 300px">${q.content }</textarea>
							<input type="submit" value="MODIFY" id="modify" > <br /></td>
					</tr>
			</table>
		</form>	
		
	<c:if test="${q.lvl == 0}">
	<input type="button" onclick="location.href='q_reply_page?grp=${q.grp }'" id="reply" value="REPLY">
	</c:if>
	<input type="button" id="delete" value="DELETE">
	<input type="button" id="write" value="WRITE">	<button type="button" onclick="history.back()" id="bl">BACK TO LIST</button>
	
	</div>
	
</body>
</html>