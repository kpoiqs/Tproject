<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
		});
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
	width: 800px;
	height: 600px;
	margin: 0 auto;
	border: 1px solid;
}

.all {
	width: 800px;

	margin: auto;
	width: 50%;
	background-color: WHITE;
	overflow:auto;
}
.tb{
	margin: 0 auto;
}

td{
	 float: left;
}

</style>


</head>

<body>

	<div class="all">
		<h1>AIR Q&A</h1>
		<form id="form" method="post" action="q_save">
			<table class="tb">

				<tr>
					<th>WRITER</th>
					<td><input type="text" id="writer" name="writer" value="${account.id}"
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