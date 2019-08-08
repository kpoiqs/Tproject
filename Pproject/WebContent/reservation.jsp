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
Depart air <hr/>
		<c:forEach var="planlist" items = "${plans}">
		
					<tr>
						<td>${planlist.depa}</td>
						<td>${planlist.dept}</td>
						<td>${planlist.arva}</td>
						<td>${planlist.arvt}</td>
						<td>${planlist.cost}</td>
						<td>${planlist.sno}</td>
				
							<hr/>
						
					</tr>
					</c:forEach><br><br><br>Arrive air<hr/>
					
					<c:forEach var="planlists" items = "${plan2}">
						<tr>						
						<td>${planlists.depa}</td>
						<td>${planlists.dept}</td>
						<td>${planlists.arva}</td>
						<td>${planlists.arvt}</td>
						<td>${planlists.cost}</td>
						<td>${planlists.sno}</td>
						<hr/>
							</tr>
		
		</c:forEach>
</body>
</html>