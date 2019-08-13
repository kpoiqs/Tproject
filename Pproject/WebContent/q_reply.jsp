<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8">
<title>답변게시판</title>
</head>
<body>
	<h1>리플작성</h1>
	<form action="q_reply" method="post">
	<input type="hidden" value="${qq.writer}" name="writer"/>
	<input type="hidden" value="${grp}" name="grp"/>
	작성자 : ${qq.writer }<br/>
	그룹 : ${grp }<br/>
	제목 	<input type="text" name="subject"><br/>
	내용<textarea rows="5" cols="25" name="content"></textarea><br/>
	
	<input type="submit" value="등록">
	
	</form>
	
</body>
</html>