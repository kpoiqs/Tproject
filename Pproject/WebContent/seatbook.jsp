<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="ko">

	<head>
	<style>
	#h{
		background-image:url("img/airplane7.gif");
		background-repeat:no-repeat;
	}
	</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   
		
	</head>
	<body>
	<form action = "insert_book1" method = "post" >
	<div id = "h" style="text-align:center">
	<br/><br/><br/><br/>
	<c:forEach begin = "1" end = "6" step = "1" var="i">
		 
    <c:forEach begin = "1" end = "25" step = "1" var="j">
     &nbsp;
     <input type="radio" id="${j}${i}" name="seat" value="${j}${i}"/>
    </c:forEach>
  <br/>
  
   </c:forEach>
     <br/>
        
    <c:forEach var = "book" items = "${booklist}">
       <script>
      	for(var i=10;i<257; i++){
      		
      		if(i == "${book.seat}"){
      			$('#'+i).prop('disabled',true);
      		}
      	}
     </script> 

        </c:forEach> 
<br/><br/><br/>
</div>
<br/>
<div id='a' style="text-align:center">
	Depart : ${fromdate} ${plan1.depa} ${plan1.dept}<br> Arrives : ${fromdate} ${plan1.arva} ${plan1.arvt} <br/>
<br>
&nbsp;¡ØFare details
<li>Cancellation</li>
- In general, our flights are non-refundable. If you'd like to try cancelling, visit Manage My Booking and fill in the Refund Application Form. Our Claims Team will get back to you. <br>
- The possible refund amount always depends on the airline's policy. We charge a handling fee of 20 ¢æ per booking for cancellations and/or refunds of any kind.
<li>Change</li>
- All changes must be made at least 48h before departure and are dependent on the airline's policy. Most changes are available via Manage My Booking.
<li>Other</li>
- The airline may charge additional fees for checked baggage or other optional services. <br>
- Flight schedules and terminals are subject to change at any time by the airlines. <br>
- Correct travel documents are required. It is your responsibility to check your documents before you travel.
<br/>
<input type = "hidden" id = 'id' name = 'id' value = "${account.id}">
<input type = "hidden" id = 'fromdate' name = 'fromdate' value = "${fromdate}">
<input type = "hidden" id = 'plan1sno' name = 'plan1sno' value = "${plan1.sno}">
<input type = "hidden" id = 'plan1cost' name = 'plan1cost' value = "${plan1.cost}">
		<p>
			Total price: ${plan1.cost}$ <input type = "submit" class="btn btn-primary"  id = 'book' value = "book">
		</p>
</div>
	</form>
</body>
</html>