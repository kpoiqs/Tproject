<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		//alert("sfsdf");
		$("#form").validate({
			debug : false,

			rules : {
				content : "required"

			},

			messages : {
				content : "Please enter a content."

			}
		});
	});
</script>

<style type="text/css">
body {
	width: 800px;
	height: 600px;
	margin: 0 auto;
}

.all {
	width: 800px;
	padding: 50px;
	margin: auto;
	width: 50%;
	background-color: WHITE;
	overflow:auto;
}

h1,h2 {
	text-align: center;
}

form input.error, #form textarea.error {
	border: 1px dashed red;
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
		<h2>MODIFY</h2>
	<div class="all">
		<form action="q_update?no=${q.no }" method="post" id="form" name="form">
	<table class="tb">
	
					<tr>
					<th>NO</th>
					<td><input type="text" id="no" name="no" value="${q.no}" readonly/></td>
						
				</tr>
				
				<tr>
					<th>WRITER</th>
					<td><input type="text" id="writer" name="writer" value="${q.writer }"
						maxlength="10" readonly></td>
				</tr>

				<tr>
					<th>SUBJECT</th>

					<td><input type="text" id="subject" name="subject" value="${q.subject }" style="width: 345px" 
						maxlength="40" readonly></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content" value=""
							style="width: 345px; height: 300px">${q.content }</textarea>
							<input type="submit" value="MODIFY" id="modify" > <br /></td>
					</tr>
			</table>
			</form>
	</div>
</body>
</html>