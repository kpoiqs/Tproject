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
		<c:forEach var="planlist" items = "${plans}">
		<c:forEach var="planlists" items = "${plan2}">
					<tr>
						<td>${planlist.depa}</td>
						<td>${planlist.arva}</td>
						<td>${planlists.depa}</td>
						<td>${planlists.arva}</td>
							<hr/>
						
					</tr>
		</c:forEach>
		</c:forEach>
</body>
</html>