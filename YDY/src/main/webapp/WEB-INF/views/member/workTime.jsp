<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
navigator.geolocation.getCurrentPosition((position) => {
	console.log(position);
	$('#workStart').click(function(){
		var latitude = position.coords.latitude;
		if(latitude>=35 && latitude<36 ){
			alert("출근성공 ");
			var startTime = new Date().toTimeString().split(' ')[0];
			$('#workStartTime').val(startTime);
		}else{
			alert("사무실 위치에서 출근해주세요!");
		}
	}); // 출근버튼 
	
	$('#workEnd').click(function(){
		var latitude = position.coords.latitude;
		if(latitude>=35 && latitude<36 ){
			alert("퇴근성공 ");
			var endTime = new Date().toTimeString().split(' ')[0];
			$('#workEndTime').val(endTime);
		}else{
			alert("사무실 위치에서 퇴근 해주세요!");
		}
	}); // 퇴근버튼 
});

});
</script>
</head>
<body id="body-pd">
	
 	<!-- header && sidebar include -->
    <jsp:include page="../header.jsp"></jsp:include>
	<!-- header && sidebar include --> 
<h1>근태관리</h1>
<button id="workStart"> 출근 </button>
<input type="text" id="workStartTime" readonly="readonly">

<button id="workEnd"> 퇴근 </button>
<input type="text" id="workEndTime" readonly="readonly">
</body>
</html>