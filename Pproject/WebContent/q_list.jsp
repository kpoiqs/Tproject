<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AIR Q&A</title>
<style type="text/css">
body{
	width:800px;
	margin: 0 auto;
}

h1 {
	text-align: center;
}
h3{
	text-align: center;	
}

table{
	width:100%;
	margine:0 auto;
	

}

thead{
	background-color: skyblue;
	font-weight: bold;
	text-align: center;	
}


tbody{
	padding: 8px;
	border-bottom: 1px solid #ddd;
	text-align: center;	
}

#write {
	background-color: white;
	font-size: 24px;
	color: skyblue;
	display: inline-block;
	border: 1px solid skyblue;
	padding: 5px;
	cursor: pointer;
	float: right;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
}

#write:hover {
	background-color: skyblue;
	color: white;
}

A:link {text-decoration:none; color:#646464;}
A:visited {text-decoration:none; color:#646464;}
A:active {text-decoration:none; color:#646464;}
A:hover {text-decoration:none; color:#646464;}

#title{
	cursor: pointer underline;
}

a:hover {
  text-decoration: underline;
}

a:active {
  text-decoration: underline;
}
</style>
</head>
<body>

	<h1>AIR Q&A</h1>
	

		<c:if test="${!empty q}">

			<table class="title">
				<colgroup>
				<col style="width:10%">
				<col style="width:50%">
				<col style="width:10%">
				<col style="width:20%">
				<col style="width:10%">
				</colgroup>
				<thead>
				<tr>
					<td scope="col">NO</td>
					<td scope="col">TITLE</td>
					<td scope="col">WRITER</td>
					<td scope="col">DATE</td>
					<td scope="col">VIEW</td>
				</tr>
				</thead>
				
				<c:forEach var="qq" items="${q}">
				<tbody>
					<tr>
						<td>${qq.no}</td>

						<td	 align="left" maxlength="30" class="title"><c:if test="${qq.lvl >0}">
								<c:forEach begin="1" end="${qq.lvl}">
                            &nbsp;&nbsp; RE : <!-- 답변글일경우 글 제목 앞에 공백을 준다. -->
								</c:forEach>
							</c:if> <a href="/q_visited"></a><a href="q_detail?no=${qq.no}">${qq.subject}</a>
						</td>

						<td>${qq.writer}</td>
						<td>${qq.wdate}</td>
						<td>${qq.visited }</td>
					</tr>
					</tbody>
				</c:forEach>
			</table>

		</c:if>

		<!-- 페이지 처리 부분 -->
		<h3>
			<c:if test="${pageGroupResult.beforPage }">
				<a href="q_req_list?reqPage=${pageGroupResult.groupStartNumber-1 }">&#171;</a>
			</c:if>

			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber }"
				end="${pageGroupResult.groupEndNumber }">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumger==index}">
						<a href="q_req_list?reqPage=${index }">[${index }]</a>
					</c:when>

					<c:otherwise>
						<a href="q_req_list?reqPage=${index }">${index }</a>
					</c:otherwise>
				</c:choose>

			</c:forEach>

			<c:if test="${pageGroupResult.afterPage }">
				<a href="q_req_list?reqPage=${pageGroupResult.groupEndNumber+1 }">&#187;</a>

			</c:if>
			<input type="button" id="write" onclick="location.href='q_form.jsp'" value="WRITE">
		</h3>

</body>
</html>