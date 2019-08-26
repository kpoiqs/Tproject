<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>AIR Q&A</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- ��ȿ�� �˻� plugin -->
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
			messages:{
				writer  : "Please enter a valid name.",
				subject : "Please enter a subject.",
				content : "Please enter a content."
			}
			function noSpaceForm(obj) {
			    var str_space = /\s/;
			    if(str_space.exec(obj.value)) {
			        alert("Spaces cannot be used.\n\nSpaces are automatically deleted.");
			        obj.focus();
			        obj.value = obj.value.replace(' ','');
			        return false;
			    }
			}
		})
	});
	
</script>


<style type="text/css">

h1 {
	text-align: center;
}

form input.error, #form textarea.error {
	border: 1px dashed red;
}

#write {
	background-color: skyblue;
	font-size: 24px;
	color: white;
	display: inline-block;
	border: 1px solid white;
	padding: 5px;
	cursor: pointer;
	float: right;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

body {
	width: 1200px;
	height: 800px;
	margin: 0 auto;
	border: 1px solid;
}

.all {
	width: 1200px;

	margin: auto;
	width: 50%;
	background-color: WHITE;
	overflow:auto;
}
.tb{
}

td{
	 float: left;
}ul.a{
	list-style-type : none;
}
li{
	list-style-type : none;
	display:inline;
	
}
p{
text-align:right;
display:inline;
}
#a{
  font-size: 150%;
}
#ab {
  border: 1px solid black;
  padding-top: 10px;
  padding-right: 10px;
  padding-bottom: 30px;
  padding-left: 10px;
  width: 90%;
  margin-left: 100px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;
}

#abbd{display:inline;
text-align:right;
align:right;
}
#abbd{text-align:right}
img{display:inline}

</style>


</head>

<body>
<div id = "a" >
  <a href='index.jsp'><img id="b" src="img/airlogo.jpg"></a>
  
  	<c:choose>
  		<c:when test="${account !=null || admin != null}">
			
			
			
			<p style="text-align:right" id = 'abbd' >Welcome ${account.id}</p>
			
			<form action="mybook" style="float: right" method = "post" id = 'abbd'>
			<input type = 'hidden' id = 'accountid' name = 'accountid' value = "${account.id}" />
			<input type = "submit" style="float: right" id = 'mybook' class="btn btn-primary" value = "Mybook"/>
			</form>
			<div style="text-align:right" id = 'abbd' >
			<input type = "button" style="float: right" onclick="location.href='Withdrawalcheck.jsp'" class="btn btn-primary" value = "detail"/>
			</div>
			<button type="button" style="float: right" class="btn btn-primary" onclick="location.href='q_req_list.do?reqPage=1'">QnA</button>
			<form action="logout" style="float:right" method = "post" id='abbd'>
			<input type = 'submit' style="float: right" class='btn btn-primary' value = 'logout'>
			</form>
			
  		</c:when>
  		
  		<c:otherwise>
  			<form action = 'login_input' id = 'abbd'>
 			<input type = "submit" class="btn btn-primary" value = "login" style="float: right"/>
 			</form>
  		</c:otherwise>
  	</c:choose>
  	<c:if test = "${account !=null && admin != null}">
  	<form action = 'adminbooklist.admin' id = 'abbd'>
 			<input type = "submit" class="btn btn-primary" value = "admin" style="float: right"/>
 			</form>
  	</c:if>
  </div>
  
	<div class="all">
		<h1>AIR Q&A</h1>
		<form id="form" method="post" action="q_save">
			<table class="tb">

				<tr>
					<th>WRITER</th>
					<td><input type="text" id="id" name="id" value="${account.id}"
						 readonly></td>
				</tr>
					
					<tr>
					<th></th>
					<td>
					<label class="error" for="writer" generated="true" style="display:none;"></label></td>
					</td>
					</tr>
				<tr>
					<th>SUBJECT</th>

					<td><input type="text" id="subject" name="subject" style="width: 345px"
						maxlength="40"></td>
						
				</tr>
				<tr>
					<th></th>
					<td>
					<label class="error" for="subject" generated="true" style="display:none;"></label></td>
					</td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content"
							style="width: 345px; height: 300px"></textarea> <br /></td>
				</tr>
				<tr>
					<th></th>
					<td>
					<label class="error" for="content" generated="true" style="display:none;"></label></td>
					</td>
				</tr>
			</table>
			<input type="submit" id="write" value="WRITE">
		</form>
	</div>

</body>
</html>