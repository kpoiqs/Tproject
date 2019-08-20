<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>id detail</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script type = "text/javascript">
$(function (){
	$("#detailForm").validate({
		debug : false,
		
		rules:{
				inputpassword : {
					minlength : 6,
					maxlength : 15
				},
				repwd : {
					equalTo : "#pwd"
				},
				inputemail : {
					email : true
				}
		},
		messages:{
				inputpassword : {
				minlength :"Passwords minimum of {0}characters long.",
				maxlength :"Passwords maximum of {0}characters long."
			},
				repwd : {
				equalTo : "please check a repassword"
			},
			inputemail :{
				email : "please check a email"
			}
		}
	});
});
var emailck=0
$(function(){	
	$("#checkemail").click(function(){		
		var input_val = $("#email").val();
	if(!input_val){
		alert("Please enter e-mail.");
		return false;
	}
	var url = "emailcheck";
	$.get(url, {"inputemail":input_val},function(xml){
		var result = $(xml).find("result").text();
		var count = $(xml).find("count").text();
		$(".console1").html(result);
		if(count>0){
			emailck = 0;
			return false;
		}else{
			emailck=1;
			return true;
		}
		});
	});		
});

$(function(){
	$("#jointest").click(function(){
	var result = confirm("Would you like change?");
	if( result == true ){
		if(emailck ==0 ){
			alert("please double-check the Email");
	        return false;
		}
		
		else if (emailck ==1 ){
			 alert("Change on your 정보.");
		}
	   }else if( result == false ){

	      alert("취소선택!");
		return false;
	   }
	
	});
});


$(function(){
	$("#delete").click(function(){
	var result = confirm("Are you sure you're leaving?");
	if(result){
		location.href = "delete?id=${account.id}";
	}else{
		return;
	}
	
	
	});
});
</script>
</head>
<body>

<form method="post" action="detail" id="detailForm">
<input type="hidden" value="${account.id}" name="id"/>
ID : ${account.id}<br />
Password<input type="password" placeholder="Input Password" name="inputpassword" id="pwd" value="${account.pwd}"><br />
Password check<input type="password" placeholder="Input Password" name="repwd" value="${account.pwd}"><br />
Email<input type="email" placeholder="Input Email" name="inputemail" id="email" value="${account.email}">
<input type="button" id="checkemail" value="Email Check" /><br />
<div class="console1"></div>
<input type="submit" value="submit" id="jointest"/>
<input type="hidden" value="${account.id}" />
<br /><br /><br />
The name of the ID leaving is : ${account.id}<br />
Would you like to leave?
<button type="button" id="delete">delete</button>
</form>
</body>
</html>