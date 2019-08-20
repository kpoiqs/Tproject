<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>find pwd</title>
<style type="text/css">
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
			height:30px;
			width:50px;
		}
		#find:hover{
			background-color: skyblue;
			color:white;
		}
		body {
  			text-align: center;
		}
	
</style>
</head>
<body>
<h1>FIND YOUR PASSWORD</h1>
<form method="post" action="findpwd">
id<input type="text" name="id" style="width:295px; height:30px;" /> <br /> <br />
Email <input type="text" name="email" style="width:295px; height:30px;" />
<input type="submit" value="find" id="find" /><br /><br />
</form>
${account.pwd}
</body>
</html>