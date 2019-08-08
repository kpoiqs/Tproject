<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${plans != null}">
	여기로써지나
		<c:forEach var="planlist" items = "${plans}">
					<tr>
						<td>${planlist.depa}</td>
						<td>${planlist.arva}</td>
						<td>${planlist.cost}</td>
					</tr>
		</c:forEach>
	</c:if>
</body>
</html>