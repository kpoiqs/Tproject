<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta charset="utf-8">
  
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script

	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script

	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script

	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(function(){      
			$("#book").click(function(){
			
				var retVal = confirm("예약하시겠습니까?");

				   if( retVal == true ){

				      alert("확인선택!");
					return true;
				   }else if( retVal == false ){

				      alert("취소선택!");
					return false;
				   }

			});
	});
</script>
</head>
<body>
	<form action = "insert_book" method = "post">
	Depart ${fromdate} ${plan1.depa} ${plan1.dept} ${fromdate} ${plan1.arva} ${plan1.arvt} <br/>
	Return ${todate}${plan2.depa} ${plan2.dept} ${todate} ${plan2.arva} ${plan2.arvt}<br/>
<br>
&nbsp;※Fare details
<li>Cancellation</li>
- In general, our flights are non-refundable. If you'd like to try cancelling, visit Manage My Booking and fill in the Refund Application Form. Our Claims Team will get back to you. <br>
- The possible refund amount always depends on the airline's policy. We charge a handling fee of 20 € per booking for cancellations and/or refunds of any kind.
<li>Change</li>
- All changes must be made at least 48h before departure and are dependent on the airline's policy. Most changes are available via Manage My Booking.
<li>Other</li>
- The airline may charge additional fees for checked baggage or other optional services. <br>
- Flight schedules and terminals are subject to change at any time by the airlines. <br>
- Correct travel documents are required. It is your responsibility to check your documents before you travel.
<br/>
<input type = "hidden" id = 'id' name = 'id' value = "${account.id}">
<input type = "hidden" id = 'fromdate' name = 'fromdate' value = "${fromdate}">
<input type = "hidden" id = 'todate' name = 'todate' value = "${todate}">
<input type = "hidden" id = 'plan1sno' name = 'plan1sno' value = "${plan1.sno}">
<input type = "hidden" id = 'plan2sno' name = 'plan2sno' value = "${plan2.sno}">
<input type = "hidden" id = 'plan1cost' name = 'plan1cost' value = "${plan1.cost}">
<input type = "hidden" id = 'plan2cost' name = 'plan2cost' value = "${plan2.cost}">
${pluscost} 
<input type = "submit" id = 'book' value = "book">
</form> 
</body>
</html>