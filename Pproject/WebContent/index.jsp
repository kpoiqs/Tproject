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
</style>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$("#check1").click(function(){
			$("ul").empty();
				var li = $("<li>").css("color" , "black").html("<select name = from> <option value='1' selected = 'selected'>ICN</option><option value='2'>NRT</option><option value='3'>FUK</option></select>&nbsp;<select name = to><option value='1' selected = 'selected'>ICN</option><option value='2'>NRT</option><option value='3'>FUK</option></select>&nbsp;<select name = depart><option value='1' selected = 'selected'>29/08/2019</option><option value='2'>30/08/2019</option><option value='3'>31/08/2019</option></select>&nbsp;<select name = return><option value='1' selected = 'selected'>05/09/2019</option><option value='2'>06/09/2019</option><option value='3'>07/09/2019</option></select>");
			
				$("ul").append(li);
			
		});
		$("#check2").click(function(){
			$("ul").empty();
			var li = $("<li>").css("color" , "black").html("<select name = from> <option value='1' selected = 'selected'>ICN</option><option value='2'>NRT</option><option value='3'>FUK</option></select>&nbsp;<select name = to><option value='1' selected = 'selected'>ICN</option><option value='2'>NRT</option><option value='3'>FUK</option></select>&nbsp;<select name = depart><option value='1' selected = 'selected'>29/08/2019</option><option value='2'>30/08/2019</option><option value='3'>31/08/2019</option></select>");
			
			$("ul").append(li);
	});
	});
	</script>
</head>
<body>

<div class="jumbotron">
  <h1>&nbsp;&nbsp;&nbsp;&nbsp;Board</h1>
  <div style="text-align:right">
 	<form action = 'login'>
 	<input type = "submit" value = "login"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 	</form>
 	</div>
  </div>
    
    <form style="text-align: center" action = 'reservation'>
			<input type = "radio" id = "check1" name = "check1" value = "c1" checked = "checked">return
			<input type = "radio" id = "check2" name = "check1" value = "c2">one way
		<br/>
		
		<ul class = "a"><li>
		<select name = from>
			<option value='1' selected = 'selected'>ICN</option>
			<option value='2'>NRT</option>
			<option value='3'>FUK</option>
		</select>
		<select name = to>
			<option value='1' selected = 'selected'>ICN</option>
			<option value='2'>NRT</option>
			<option value='3'>FUK</option>
		</select>
		<select name = depart>
			<option value='1' selected = 'selected'>29/08/2019</option>
			<option value='2'>30/08/2019</option>
			<option value='3'>31/08/2019</option>
		</select>
		<select name = return>
			<option value='1' selected = 'selected'>05/09/2019</option>
			<option value='2'>06/09/2019</option>
			<option value='3'>07/09/2019</option>
		</select>
		</li></ul>
		<input type = "submit" value = "reservation"/>
		</form>
</body>
</html>