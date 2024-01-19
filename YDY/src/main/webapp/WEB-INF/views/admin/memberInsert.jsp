<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>	
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById('btnC').addEventListener('click', function () {
            alert('사원입력  버튼 클릭!!');
            var csrfToken = document.querySelector("meta[name='_csrf']").content; //security에서는 해당값을 추가줘야함!
            var csrfHeader = document.querySelector("meta[name='_csrf_header']").content;
 
            var obj = {
               
                "name": document.getElementById('name').value,
                "email": document.getElementById('email').value,
                "grade": document.getElementById('grade').value,
                "department": document.getElementById('department').value,
                "phone": document.getElementById('phone').value,
                "birthDay": document.getElementById('birthDay').value,
                "password": document.getElementById('password').value
            }; // var obj end

            axios.post('/mygroup/member/memberInsert', obj, {
                headers: {
                    'Content-Type': 'application/json',
                    [csrfHeader]: csrfToken,

                    	
                }
            })
            .then(function (response) {
                alert(response.data);
               
                document.getElementById('name').value = "";
                document.getElementById('email').value = "";
                document.getElementById('grade').value = "";
                document.getElementById('department').value = "";
                document.getElementById('phone').value = "";
                document.getElementById('birthDay').value = "";
                
            })
            .catch(function (error) {
                alert('error');
            });

        }); // click end
    }); // DOMContentLoaded end
</script>
</head>
<body id="body-pd">
	
 	<!-- header && sidebar include -->
    <jsp:include page="../header.jsp"></jsp:include>
	<!-- header && sidebar include --> 

    <input type="hidden" id="password" value="1234"><br> <!-- 비밀번호 초기값 세팅 : 1234 -->
    이름 :  
    <input type="text" id="name"><br>
    이메일 : 
    <input type="text" id="email"><br>
    직급 :   
    <select id="grade">
           	 <option value="사원">사원</option>
           	 <option value="팀장">팀장</option>
    </select><br>
    부서  : 	
    <select id="department">
           	 <option value="경영관리">경영관리</option>
           	 <option value="마케팅">마케팅</option>
           	 <option value="디자인">디자인</option>
           	 
    </select><br>
    휴대폰 : 
    <input type="text" id="phone"><br>
    생년월일 : 
    <input type="date" id="birthDay"><br>
    

    <input type="button" id="btnC" value="사원입력">
</body>
</html>
