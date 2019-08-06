<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="jumbotron text-center">
  <h1>Board</h1>
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>Login</h3>
      <p><a href="login_input">Login page</a><br/></p>
      <p><c:if test="${member != null}">
		<h1>${member.name} Welcome!</h1>
		<form action = 'logout'>
		<input type = "submit" value = "logout"/>
		</form>
		</c:if></p>
    </div>
    
    <div class="col-sm-4">
      <h3>Board</h3>        
      <p><li><a href = "comment.do">Board insert</a></li></p>
			<p><li><a href = "list2?reqPage=1">Board List</a></li></p>
    </div>
  </div>
</div>

</body>
</html>