<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA</title>
</head>
<body>
<h3>AIR Q&A</h3>
		
		<c:if test="${!empty q}">
			<table>
				<tr>
					<td>NO</td>
					<td>Subject</td>
					<td>Writer</td>
					<td>date</td>
					<!-- <td>상세보기</td> -->
					
				</tr>
			<c:forEach var="qq" items="${q}">
					<tr>
						<td>${qq.no}</td>
						<td><a href="q_detail?no=${qq.no}">${qq.subject}</td>
						<td>${qq.writer}</td>
						<td>${qq.wdate}</td>
						<!-- <td><a href="memo_detail?memoid=${memo.memoid}">상세보기</a></td> -->
					</tr>
			</c:forEach>
			</table> 
				
			</c:if>
			
				<!-- 페이지 처리 부분 -->
			<c:if test="${pageGroupResult.beforPage }">	
				<a href="q_req_list?reqPage=${pageGroupResult.groupStartNumber-1 }">&#171;</a>
			</c:if>
			
			<c:forEach var="index" begin="${pageGroupResult.groupStartNumber }" end="${pageGroupResult.groupEndNumber }">
				<c:choose>
					<c:when test="${pageGroupResult.selectPageNumger==index}">			
					<span id="select"><a href="q_req_list?reqPage=${index }">${index }</a></span>
					</c:when>
			
					<c:otherwise>
					<a href="q_req_list?reqPage=${index }">${index }</a>
					</c:otherwise>
				</c:choose>
			
			</c:forEach>
			
			<c:if test="${pageGroupResult.afterPage }">
			<a href="q_req_list?reqPage=${pageGroupResult.groupEndNumber+1 }">&#187;</a>
			
			</c:if>
			<a href="q_form.jsp">write</a>
</body>
</html>