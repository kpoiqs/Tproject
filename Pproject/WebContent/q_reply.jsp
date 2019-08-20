<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>AIR Q&A</title>

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
/* body {
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
} */

h1 {
	text-align: center;
}

form input.error, #form textarea.error {
	border: 1px dashed red;
}

#write {
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

body {
	width: 800px;
	margin: 0 auto;

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


	<div class="all">
		<h1>AIR Q&A</h1>
		
		<form id="form" method="post" action="q_reply">
			<table class="tb">

				<tr>
					<th>WRITER</th>
					<td><input type="text" id="writer" name="writer" value=""
						maxlength="10"></td>
				</tr>

				<tr>
					<th>SUBJECT</th>

					<td><input type="text" id="subject" name="subject" style="width: 345px"
						maxlength="40"></td>
				</tr>
				<tr>
					<th>CONTENT</th>
					<td><textarea id="content" name="content"
							style="width: 345px; height: 300px"></textarea> <br /></td>
				</tr>
			</table>
			<input type="hidden" value="${grp}" id="grp" name="grp">
			<input type="submit" id="write" value="WRITE">
		</form>
	</div>
</body>
</html>