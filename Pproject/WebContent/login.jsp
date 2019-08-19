<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<style type="text/css">
		#sign{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#sign:hover{
			background-color: skyblue;
			color:white;
		}
		#find{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#find:hover{
			background-color: skyblue;
			color:white;
		}
		#findpwd{
			border: 1px solid skyblue;
			background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
            cursor:pointer;
            border-top-left-radius : 5px;
			border-bottom-left-radius : 5px;
			border-top-right-radius : 5px;
			border-bottom-right-radius : 5px;
		}
		#findpwd:hover{
			background-color: skyblue;
			color:white;
		}
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
		
		body {
  			background-color: rgb(240,240,240);
		}	
	</style>
<script type = "text/javascript">
$(function(){	
	$("#check").click(function(){		
		var input_val = $("#idcheck").val();
		var input = $("#passwordcheck").val();
		var url = "login";
	$.get(url, {"id":input_val, "password":input},function(xml){
		var result = $(xml).find("result").text();
		if(!result){		
		}else{
			alert("login fail");
			location.href = "login.jsp";
		}
		});
	});		
});
</script>
</head>
<body>
text
	<form action="login" method ="post">
		<input type="text" placeholder="ID" name="id" id="idcheck"><br />
		<input type="password" placeholder="Password" name="password" id="passwordcheck"><br /><br />
		<input type="submit" id="check" value="login"><br />
	</form>
	
	<br />
	<button onclick="location.href='signup.jsp'" id="sign">sign up</button>
	<button onclick="location.href='find.jsp'" id="find">find id</button>
	<button onclick="location.href='findpwd.jsp'" id="findpwd">find password</button>
</body>
</html>