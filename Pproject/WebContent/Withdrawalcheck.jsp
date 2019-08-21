<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>detail check</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<style type="text/css">
#check{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: white;
            padding: 5px;
            background-color: skyblue;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#checker{font-size : 25px;}
		body{
			text-align : center;
		}
		#detail{font-size : 70px;}
		#pwderror{font-size : 25px;}
</style>
<script type = "text/javascript">
$(function (){
	$("#detailchecker").validate({
		debug : false,		
		rules:{
			checkpassword : "required"
		},
		messages:{
			checkpassword : "Password is required."			
		}
	});
});
</script>
</head>
<body>
<form method="post" action="Withdrawal" id="detailchecker">
<input type="hidden" value="${account.id}" name="checkid" />
<p id="detail">DETAIL CHECK</p>
<p id="checker">your id is : ${account.id}</p>
<input type="password" name="checkpassword" placeholder="Input Password" style="width:345px; height:45px;" id="pwd"><br />
<label class="error" for="pwd" generated="true" style="display:none;" id="pwderror"></label><br />
<input type="submit" value="check" style="height:50px; width:350px;" id="check"/><br />
</form>
<p id="checker">${message}</p>
</body>
</html>