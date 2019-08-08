<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 유효성 검사 plug in -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<style type="text/css">
		#singupForm input.error, #singupForm textarea.error{
			 border : 1px dashed red;
		}
	</style>
<script type = "text/javascript">

$(function (){
	$("#singupForm").validate({
		debug : false,
		
		rules:{
			inputid : "required",
				
				inputpassword : {
					required : true,
					minlength : 6,
					maxlength : 15
				},
				repwd : {
					required : true,
					equalTo : "#pwd"
				},
				inputemail : {
					required : true,
					email : true
				}
		},
		messages:{
			inputid : "ID is required.",
			
			inputpassword : {
				required : "password is required",
				minlength :"Passwords minimum of {0}characters long.",
				maxlength :"Passwords maximum of {0}characters long."
			},
			repwd : {
				required : "password check is required",
				equalTo : "please check a repassword"
			},
			inputemail :{
				required : "email is required",
				email : "please check a email"
			}
		}
	});
});
</script>
</head>
<body>

<form method="post" action="join" id="singupForm" name="joinform">

ID<input type="text" placeholder="Input ID" name="inputid">
<input type="button" value="overlap" name="check" onclick="idcheck(this.form)" /><br />
Password<input type="password" placeholder="Input Password" name="inputpassword" id="pwd"><br />
Password check<input type="password" placeholder="Input Password" name="repwd"><br />
Email<input type="email" placeholder="Input Email" name="inputemail">
<input type="submit" value="join" />

</form>

</body>
</html>