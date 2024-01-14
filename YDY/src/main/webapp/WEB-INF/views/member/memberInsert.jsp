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
	
	$('#btnC').click(function(){
		alert('사원입력  버튼 클릭!!');
		var obj = {
				"memberId":$('#memberId').val(),
				"name":$('#name').val(),
				"email":$('#email').val(),
				"grade":$('#grade').val(),
				"department":$('#department').val(),
				"phone":$('#phone').val(),
				"birthDay":$('#birthDay').val()
		};// var obj end
		// 		console.log(obj);
		// REST컨트롤러로 이동해서 데이터 처리 !!
		$.ajax({
			url:"/mygroup/member/memberInsert",
			type:"POST",
			contentType:"application/json",
			data : JSON.stringify(obj),
			success:function(data){
				alert(data);
				$('#memberId').val("");
				$('#name').val("");
				$('#email').val(""); //해당 칸 비워줌
				$('#grade').val(""); //해당 칸 비워줌
				$('#department').val(""); //해당 칸 비워줌
				$('#phone').val(""); //해당 칸 비워줌
				$('#birthDay').val(""); //해당 칸 비워줌
				
			},// success end
			error:function(){
				alert('error');
			}// error end
			
		});// ajax end
		
	});// click end
	
		});//js end
		
</script>
</head>

<body id="body-pd" style="font-family: 'TheJamsil5';">

	
 	<!-- header && sidebar include -->
    <jsp:include page="../header.jsp"></jsp:include>
	<!-- header && sidebar include -->  

	사원번호(자동부여): <input type="text" id="memberId"><br>
	이름 : <input type="text" id="name"><br>
	이메일 : <input type="text" id="email"><br>
	직급 : <input type="text" id="grade"><br>
	부서  : <input type="text" id="department"><br>
	휴대폰 : <input type="text" id="phone"><br>
	생년월일 : <input type="date" id="birthDay"><br>
	
	<input type="button" id="btnC" value="사원입력">
</body>
</html>