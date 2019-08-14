<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Withdrawal</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">


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
<input type="hidden" value="${account.id}" />
The name of the ID leaving is : ${account.id} It is.
<button type="button" id="delete">delete</button>
</body>
</html>