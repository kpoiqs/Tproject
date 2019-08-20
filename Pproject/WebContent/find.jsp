<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>find id</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

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
<script type = "text/javascript">
$(function(){
	$("#find").click(function(){	
		var input_val = $("#mailcheck").val();
		
	if(!input_val){
		alert("Please enter your Eamil.");
		return false;
	}
	var url = "find";
	$.get(url, {"email":input_val},function(xml){
		var result = $(xml).find("result").text();
		var count = $(xml).find("count").text();
		$(".console").html(result);
		if(count>0){
			idck = 0;
			idck1 = document.getElementById("id").value;
			return false;
		}else{
			idck=1;
			idck1 = document.getElementById("id").value;
			return true;
		}
		});	

	});
});
</script>
</head>
<body>
<p id="font">FIND ID</P>
<form method="post" action="find">
<input type="text" id="mailcheck" name="email" style="width:345px; height:45px;" placeholder="Email"/><br /><br />
<input type="submit" value="find" id="find" style="height:50px; width:350px;" /><br />
</form><br />
${account.id}
</body>
</html>