<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>find id</title>
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
<script type = "text/javascript">
/* $(function(){	
	$("#find").click(function(){		
		var input_val = $("#mailcheck").val();
		var url = "find";
	$.get(url, {"email":input_val},function(xml){
		var result = $(xml).find("result").text();
		alert(result);
		if(!result){
			alert(result);
			
		}else{
			retry;
		}
		});
	});		
}); */
</script>
</head>
<body>
<h1>FIND YOUR ID</h1>
<form method="post" action="find">
Email <input type="text" id="mailcheck" name="email" style="width:295px; height:30px;"/>
<input type="submit" value="find" id="find" /><br />
</form><br />
${account.id}
</body>
</html>