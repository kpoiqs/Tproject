<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link rel="stylesheet" type="text/css" media="all" href='css/jquery_air.css' />
<script type="text/javascript" src="preset.js"></script>
<script type="text/javascript" src="global.js"></script>


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
  		
  	</script>
  	<style>
  	input[type="radio"] {
  /* remove standard background appearance */
 
  /* create custom radiobutton appearance */
  display: inline-block;
  width: 25px;
  height: 25px;
  padding: 6px;
  
  background-clip: content-box;
  border: 2px solid #bbbbbb;
  background-color: #e7e6e7;
  border-radius: 50%;
}

input[type="radio"]:checked {
  background-color: #93e026;
}
  	
  	</style>
<title>Air</title>
</head>
<body>
	<form action = "insert_book1" method = "post">
<div id="container" >

	<ul id="airplane" class="radio-wrap">
	<c:forEach var="book" items="${booklist}">
		<c:if test = "${book.seat ne '1A'}">
	 <li class="seat_01 A"><p><input type="radio" id="seat" name = "seat" value='1A' >01A</p></li>
		 </c:if>
  		<c:if test = "${book.seat eq '1A'}">
  		<li class="seat_01 A"><p><input type="radio" id="seat" name="seat" value='1A' disabled=true>01A</p></li>
  		</c:if>
  	</c:forEach> 
  	
  	<li class="seat_01 B"><p><input type="radio" id="seat" name = "seat" value='1B' >01B</p></li>
	<c:forEach var="book" items="${booklist}">
  		<c:if test = "${book.seat eq '1B'}">
  		<li class="seat_01 B"><p><input type="radio" id="seat" name="seat" value='1B' disabled='true'>01B</p></li>
  		</c:if>
  	</c:forEach> 
  	
  
		
		
		
		
		<li class="seat_01 C"><p><input type="radio" name="seat" value='1C'></p></li>
		<li class="seat_01 D"><p><input type="radio" name="seat" value='1D'></p></li>
		<li class="seat_01 E"><p><input type="radio" name="seat" value='1E'></p></li>
		<li class="seat_01 F"><p><input type="radio" name="seat" value='1F'></p></li>

		<li class="seat_02 A"><p><input type="radio" name="seat" value='2A'></p></li>
		<li class="seat_02 B"><p><input type="radio" name="seat" value='2B'></p></li>
		<li class="seat_02 C"><p><input type="radio" name="seat" value='2C'></p></li>
		<li class="seat_02 D"><p><input type="radio" name="seat" value='2D'></p></li>
		<li class="seat_02 E"><p><input type="radio" name="seat" value='2E'></p></li>
		<li class="seat_02 F"><p><input type="radio" name="seat" value='2F'></p></li>

		<li class="seat_03 A"><p><input type="radio" name="seat" value='3A'></p></li>
		<li class="seat_03 B"><p><input type="radio" name="seat" value='3B'></p></li>
		<li class="seat_03 C"><p><input type="radio" name="seat" value='3C'></p></li>
		<li class="seat_03 D"><p><input type="radio" name="seat" value='3D'></p></li>
		<li class="seat_03 E"><p><input type="radio" name="seat" value='3E'></p></li>
		<li class="seat_03 F"><p><input type="radio" name="seat" value='3F'></p></li>

		<li class="seat_04 A"><p><input type="radio" name="seat" value='4A'></p></li>
		<li class="seat_04 B"><p><input type="radio" name="seat" value='4B'></p></li>
		<li class="seat_04 C"><p><input type="radio" name="seat" value='4C'></p></li>
		<li class="seat_04 D"><p><input type="radio" name="seat" value='4D'></p></li>
		<li class="seat_04 E"><p><input type="radio" name="seat" value='4E'></p></li>
		<li class="seat_04 F"><p><input type="radio" name="seat" value='4F'></p></li>

		<li class="seat_05 A"><p><input type="radio" name="seat" value='5A'></p></li>
		<li class="seat_05 B"><p><input type="radio" name="seat" value='5B'></p></li>
		<li class="seat_05 C"><p><input type="radio" name="seat" value='5C'></p></li>
		<li class="seat_05 D"><p><input type="radio" name="seat" value='5D'></p></li>
		<li class="seat_05 E"><p><input type="radio" name="seat" value='5E'></p></li>
		<li class="seat_05 F"><p><input type="radio" name="seat" value='5F'></p></li>

		<li class="seat_06 A"><p><input type="radio" name="seat" value='6A'></p></li>
		<li class="seat_06 B"><p><input type="radio" name="seat" value='6B'></p></li>
		<li class="seat_06 C"><p><input type="radio" name="seat" value='6C'></p></li>
		<li class="seat_06 D"><p><input type="radio" name="seat" value='6D'></p></li>
		<li class="seat_06 E"><p><input type="radio" name="seat" value='6E'></p></li>
		<li class="seat_06 F"><p><input type="radio" name="seat" value='6F'></p></li>

		<li class="seat_07 A"><p><input type="radio" name="seat" value='7A'></p></li>
		<li class="seat_07 B"><p><input type="radio" name="seat" value='7B'></p></li>
		<li class="seat_07 C"><p><input type="radio" name="seat" value='7C'></p></li>
		<li class="seat_07 D"><p><input type="radio" name="seat" value='7D'></p></li>
		<li class="seat_07 E"><p><input type="radio" name="seat" value='7E'></p></li>
		<li class="seat_07 F"><p><input type="radio" name="seat" value='7F'></p></li>

		<li class="seat_08 A"><p><input type="radio" name="seat" value='8A'></p></li>
		<li class="seat_08 B"><p><input type="radio" name="seat" value='8B'></p></li>
		<li class="seat_08 C"><p><input type="radio" name="seat" value='8C'></p></li>
		<li class="seat_08 D"><p><input type="radio" name="seat" value='8D'></p></li>
		<li class="seat_08 E"><p><input type="radio" name="seat" value='8E'></p></li>
		<li class="seat_08 F"><p><input type="radio" name="seat" value='8F'></p></li>

		<li class="seat_09 A"><p><input type="radio" name="seat" value='9A'></p></li>
		<li class="seat_09 B"><p><input type="radio" name="seat" value='9B'></p></li>
		<li class="seat_09 C"><p><input type="radio" name="seat" value='9C'></p></li>
		<li class="seat_09 D"><p><input type="radio" name="seat" value='9D'></p></li>
		<li class="seat_09 E"><p><input type="radio" name="seat" value='9E'></p></li>
		<li class="seat_09 F"><p><input type="radio" name="seat" value='9F'></p></li>

		<li class="seat_10 A"><p><input type="radio" name="seat" value='10A'></p></li>
		<li class="seat_10 B"><p><input type="radio" name="seat" value='10B'></p></li>
		<li class="seat_10 C"><p><input type="radio" name="seat" value='10C'></p></li>
		<li class="seat_10 D"><p><input type="radio" name="seat" value='10D'></p></li>
		<li class="seat_10 E"><p><input type="radio" name="seat" value='10E'></p></li>
		<li class="seat_10 F"><p><input type="radio" name="seat" value='10F'></p></li>

		<li class="seat_11 A"><p><input type="radio" name="seat" value='11A'></p></li>
		<li class="seat_11 B"><p><input type="radio" name="seat" value='11B'></p></li>
		<li class="seat_11 C"><p><input type="radio" name="seat" value='11C'></p></li>
		<li class="seat_11 D"><p><input type="radio" name="seat" value='11D'></p></li>
		<li class="seat_11 E"><p><input type="radio" name="seat" value='11E'></p></li>
		<li class="seat_11 F"><p><input type="radio" name="seat" value='11F'></p></li>

		<li class="seat_12 A"><p><input type="radio" name="seat" value='12A'></p></li>
		<li class="seat_12 B"><p><input type="radio" name="seat" value='12B'></p></li>
		<li class="seat_12 C"><p><input type="radio" name="seat" value='12C'></p></li>
		<li class="seat_12 D"><p><input type="radio" name="seat" value='12D'></p></li>
		<li class="seat_12 E"><p><input type="radio" name="seat" value='12E'></p></li>
		<li class="seat_12 F"><p><input type="radio" name="seat" value='12F'></p></li>

		<li class="seat_13 A"><p><input type="radio" name="seat" value='13A'></p></li>
		<li class="seat_13 B"><p><input type="radio" name="seat" value='13B'></p></li>
		<li class="seat_13 C"><p><input type="radio" name="seat" value='13C'></p></li>
		<li class="seat_13 D"><p><input type="radio" name="seat" value='13D'></p></li>
		<li class="seat_13 E"><p><input type="radio" name="seat" value='13E'></p></li>
		<li class="seat_13 F"><p><input type="radio" name="seat" value='13F'></p></li>

		<li class="seat_14 A"><p><input type="radio" name="seat" value='14A'></p></li>
		<li class="seat_14 B"><p><input type="radio" name="seat" value='14B'></p></li>
		<li class="seat_14 C"><p><input type="radio" name="seat" value='14C'></p></li>
		<li class="seat_14 D"><p><input type="radio" name="seat" value='14D'></p></li>
		<li class="seat_14 E"><p><input type="radio" name="seat" value='14E'></p></li>
		<li class="seat_14 F"><p><input type="radio" name="seat" value='14F'></p></li>

		<li class="seat_15 A"><p><input type="radio" name="seat" value='15A'></p></li>
		<li class="seat_15 B"><p><input type="radio" name="seat" value='15B'></p></li>
		<li class="seat_15 C"><p><input type="radio" name="seat" value='15C'></p></li>
		<li class="seat_15 D"><p><input type="radio" name="seat" value='15D'></p></li>
		<li class="seat_15 E"><p><input type="radio" name="seat" value='15E'></p></li>
		<li class="seat_15 F"><p><input type="radio" name="seat" value='15F'></p></li>

		<li class="seat_16 A"><p><input type="radio" name="seat" value='16A'></p></li>
		<li class="seat_16 B"><p><input type="radio" name="seat" value='16B'></p></li>
		<li class="seat_16 C"><p><input type="radio" name="seat" value='16C'></p></li>
		<li class="seat_16 D"><p><input type="radio" name="seat" value='16D'></p></li>
		<li class="seat_16 E"><p><input type="radio" name="seat" value='16E'></p></li>
		<li class="seat_16 F"><p><input type="radio" name="seat" value='16F'></p></li>

		<li class="seat_17 A"><p><input type="radio" name="seat" value='17A'></p></li>
		<li class="seat_17 B"><p><input type="radio" name="seat" value='17B'></p></li>
		<li class="seat_17 C"><p><input type="radio" name="seat" value='17C'></p></li>
		<li class="seat_17 D"><p><input type="radio" name="seat" value='17D'></p></li>
		<li class="seat_17 E"><p><input type="radio" name="seat" value='17E'></p></li>
		<li class="seat_17 F"><p><input type="radio" name="seat" value='17F'></p></li>

		<li class="seat_18 A"><p><input type="radio" name="seat" value='18A'></p></li>
		<li class="seat_18 B"><p><input type="radio" name="seat" value='18B'></p></li>
		<li class="seat_18 C"><p><input type="radio" name="seat" value='18C'></p></li>
		<li class="seat_18 D"><p><input type="radio" name="seat" value='18D'></p></li>
		<li class="seat_18 E"><p><input type="radio" name="seat" value='18E'></p></li>
		<li class="seat_18 F"><p><input type="radio" name="seat" value='18F'></p></li>

		<li class="seat_19 A"><p><input type="radio" name="seat" value='19A'></p></li>
		<li class="seat_19 B"><p><input type="radio" name="seat" value='19B'></p></li>
		<li class="seat_19 C"><p><input type="radio" name="seat" value='19C'></p></li>
		<li class="seat_19 D"><p><input type="radio" name="seat" value='19D'></p></li>
		<li class="seat_19 E"><p><input type="radio" name="seat" value='19E'></p></li>
		<li class="seat_19 F"><p><input type="radio" name="seat" value='19F'></p></li>

		<li class="seat_20 A"><p><input type="radio" name="seat" value='20A'></p></li>
		<li class="seat_20 B"><p><input type="radio" name="seat" value='20B'></p></li>
		<li class="seat_20 C"><p><input type="radio" name="seat" value='20C'></p></li>
		<li class="seat_20 D"><p><input type="radio" name="seat" value='20D'></p></li>
		<li class="seat_20 E"><p><input type="radio" name="seat" value='20E'></p></li>
		<li class="seat_20 F"><p><input type="radio" name="seat" value='20F'></p></li>

		<li class="seat_21 A"><p><input type="radio" name="seat" value='21A'></p></li>
		<li class="seat_21 B"><p><input type="radio" name="seat" value='21B'></p></li>
		<li class="seat_21 C"><p><input type="radio" name="seat" value='21C'></p></li>
		<li class="seat_21 D"><p><input type="radio" name="seat" value='21D'></p></li>
		<li class="seat_21 E"><p><input type="radio" name="seat" value='21E'></p></li>
		<li class="seat_21 F"><p><input type="radio" name="seat" value='21F'></p></li>

		<li class="seat_22 A"><p><input type="radio" name="seat" value='22A'></p></li>
		<li class="seat_22 B"><p><input type="radio" name="seat" value='22B'></p></li>
		<li class="seat_22 C"><p><input type="radio" name="seat" value='22C'></p></li>
		<li class="seat_22 D"><p><input type="radio" name="seat" value='22D'></p></li>
		<li class="seat_22 E"><p><input type="radio" name="seat" value='22E'></p></li>
		<li class="seat_22 F"><p><input type="radio" name="seat" value='22F'></p></li>

		<li class="seat_23 A"><p><input type="radio" name="seat" value='23A'></p></li>
		<li class="seat_23 B"><p><input type="radio" name="seat" value='23B'></p></li>
		<li class="seat_23 C"><p><input type="radio" name="seat" value='23C'></p></li>
		<li class="seat_23 D"><p><input type="radio" name="seat" value='23D'></p></li>
		<li class="seat_23 E"><p><input type="radio" name="seat" value='23E'></p></li>
		<li class="seat_23 F"><p><input type="radio" name="seat" value='23F'></p></li>

		<li class="seat_24 A"><p><input type="radio" name="seat" value='24A'></p></li>
		<li class="seat_24 B"><p><input type="radio" name="seat" value='24B'></p></li>
		<li class="seat_24 C"><p><input type="radio" name="seat" value='24C'></p></li>
		<li class="seat_24 D"><p><input type="radio" name="seat" value='24D'></p></li>
		<li class="seat_24 E"><p><input type="radio" name="seat" value='24E'></p></li>
		<li class="seat_24 F"><p><input type="radio" name="seat" value='24F'></p></li>

		<li class="seat_25 A"><p><input type="radio" name="seat" value='25A'></p></li>
		<li class="seat_25 B"><p><input type="radio" name="seat" value='25B'></p></li>
		<li class="seat_25 C"><p><input type="radio" name="seat" value='25C'></p></li>
		<li class="seat_25 D"><p><input type="radio" name="seat" value='25D'></p></li>
		<li class="seat_25 E"><p><input type="radio" name="seat" value='25E'></p></li>
		<li class="seat_25 F"><p><input type="radio" name="seat" value='25F'></p></li>
	</ul>
			</div>

<div id='a'>
	Depart ${fromdate} ${plan1.depa} ${plan1.dept} ${fromdate} ${plan1.arva} ${plan1.arvt} <br/>
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
${plan1.cost} 


		<p>
			<input type = "submit" class="btn btn-primary"  id = 'book' value = "book">
		</p>
</div>
	</form>

<!-- end #container -->
</body>
</html>