<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <style>
ul.a{
	list-style-type : none;
}
li{
	list-style-type : none;
}
#a{
  font-size: 150%;
}
</style>
  <meta charset="utf-8">
  
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script

	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script

	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script

	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

	<script type="text/javascript">
	$(function(){
		$("#datepicker1, #datepicker2").datepicker({

            dateFormat: 'yy.mm.dd'

        });
		$("#check1").click(function(){
			$("ul").empty();
				var li = $("<li>").css("color" , "black").html("<select name = from> <option value='icn' selected = 'selected'>ICN</option><option value='nrt'>NRT</option><option value='kix'>KIX</option></select>&nbsp;<select name = to><option value='icn' selected = 'selected'>ICN</option><option value='nrt'>NRT</option><option value='kix'>KIX</option></select>&nbsp;<input type='text' id='datepicker1'> ~ <input type='text' id='datepicker2'>");
			
				$("ul").append(li);
				$("#datepicker1, #datepicker2").datepicker({

		            dateFormat: 'yy.mm.dd'

		        });
		});
		$("#check2").click(function(){
			$("ul").empty();
			var li = $("<li>").css("color" , "black").html("<select name = from> <option value='1' selected = 'selected'>ICN</option><option value='2'>NRT</option><option value='3'>FUK</option></select>&nbsp;<select name = to><option value='1' selected = 'selected'>ICN</option><option value='2'>NRT</option><option value='3'>FUK</option></select>&nbsp; <input type='text' id='datepicker1'>");
			
			$("ul").append(li);
			$("#datepicker1, #datepicker2").datepicker({

	            dateFormat: 'yy.mm.dd'

	        });
	});
		 
	});
	</script>
</head>
<body>

<div id = "a" >
  <h2>&nbsp;&nbsp;&nbsp;Board</h2>
  
 	<form action = 'login' style="text-align:right">
 	<input type = "submit" class="btn btn-primary" value = "login"/>&nbsp;&nbsp;&nbsp;
 	</form>
  </div>
    
    <form style="text-align: center" action = 'reservation' method = "post" >
			<input type = "radio" id = "check1" name = "check1" value = "c1" checked = "checked">return
			<input type = "radio" id = "check2" name = "check1" value = "c2">one way
		<br/>
		
		<ul class = "a"><li>
		<select name = from >
			<option value='icn' selected = 'selected'>ICN</option>
			<option value='nrt'>NRT</option>
			<option value='kix'>KIX</option>
		</select>
		<select name = to>
			<option value='icn' selected = 'selected'>ICN</option>
			<option value='nrt'>NRT</option>
			<option value='kix'>KIX</option>
		</select>
		 <input type="text" id="datepicker1"> ~ <input type="text" id="datepicker2">
		</li></ul>
		<input type = "submit" class="btn btn-primary" value = "reservation"/>
		</form>

	
		
</body>
</html>