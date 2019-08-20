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
  			text-align: center;
		}
		#font {font-size: 70px;}
</style>
</head>
<body>
<p id="font">FIND PASSWORD</P>
<form method="post" action="findpwd">
<input type="text" name="id" style="width:345px; height:45px;" placeholder="ID"/><br /><br />
<input type="text" name="email" style="width:345px; height:45px;" placeholder="Email" /><br /><br />
<input type="submit" value="find" id="find" style="height:50px; width:350px;" /><br /><br />
</form>
${account.pwd}
</body>
</html>