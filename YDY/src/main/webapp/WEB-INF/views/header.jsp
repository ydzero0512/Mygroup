<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="../../resources/logo_favicon.png" type="image/x-icon">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/css.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<meta charset="UTF-8">

</head>

<script type="text/javascript">

function toggleDropdown() {
	  const collapseSale = document.getElementById('collapseSale');
	  collapseSale.classList.toggle('show');
	}
	
function toggleDropdown2() {
	  const collapseSale = document.getElementById('collapseSale2');
	  collapseSale.classList.toggle('show');
	}	

function proDropdown() {
	  const collapseSale = document.getElementById('pro');
	  collapseSale.classList.toggle('show');
	}
	
function foundDropdown() {
	  const collapseSale = document.getElementById('foundation');
	  collapseSale.classList.toggle('show');
	}

function recDropdown(){
	const collapseSale = document.getElementById('rec');
	  collapseSale.classList.toggle('show');
}


document.addEventListener("DOMContentLoaded", function(event) {

	const showNavbar = (toggleId, navId, bodyId, headerId) =>{
	const toggle = document.getElementById(toggleId),
	nav = document.getElementById(navId),
	bodypd = document.getElementById(bodyId),
	headerpd = document.getElementById(headerId)

	// Validate that all variables exist
	if(toggle && nav && bodypd && headerpd){
	toggle.addEventListener('click', ()=>{
	// show navbar
	nav.classList.toggle('show')
	// change icon
	toggle.classList.toggle('bx-x')
	// add padding to body
	bodypd.classList.toggle('body-pd')
	// add padding to header
	headerpd.classList.toggle('body-pd')
	})
	}
	}

	showNavbar('header-toggle','nav-bar','body-pd','header')

	/*===== LINK ACTIVE =====*/
	const linkColor = document.querySelectorAll('.nav_link')

	function colorLink(){
	if(linkColor){
	linkColor.forEach(l=> l.classList.remove('active'))
	this.classList.add('active')
	}
	}
	linkColor.forEach(l=> l.addEventListener('click', colorLink))

	 // Your code to run since DOM is loaded and ready
	});


	
</script>


<!-- 판매목록 drop 기능 -->

<body>

	<header class="header" id="header" style="background-color: white; box-shadow: 0px 2px 7px rgba(0, 0, 0, 0.2); display: flex; align-items: center; justify-content: space-between;">
    <div class="header_toggle">
        <i class='bx bx-menu' id="header-toggle"></i>
    </div>
    <div style="display: flex; align-items: center;">
        <c:if test="${empty login_id }">
            <a style="margin: 10px;" href="/public/login">로그인</a>
            <!-- 0619 추가 -->
        </c:if>
        <c:if test="${!empty login_id }">
            <a style="margin: 10px;" href="/public/logout">로그아웃</a>
            <button class="btn btn-primary" onclick='location.href="/emp/info?employee_id=${login_id}"'>
                사원번호: ${login_id }
            </button>
            <!-- 0620 추가 -->
        </c:if>
    </div>
	</header>
	


	<div class="l-navbar navbar-expand-sm navbar" id="nav-bar" style="color: white ;">

        <nav class="nav">
            <div> <a href="#" class="nav_logo"> <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name" style="font-size: 25px;">MyGroup</span></a>
                <div class="nav_list"> <a href="/public/dashBoard" class="nav_link active"> <i class='bx bxs-bar-chart-square nav_icon'  ></i> <span class="nav_name">HOME</span> </a>
                  <div class="nav_list">
                   <a href="#" class="nav_link" onclick="toggleDropdown()"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">근태관리</span> </a> 
               
					</div>
					
				 <div class="nav_list">
                  <a href="#" class="nav_link" onclick="proDropdown()"> <i class='bx bxs-factory nav_icon'></i> <span class="nav_name">전자결재</span> </a> 
               
				</div>
          
                <div class="nav_list">
                  <a href="#" class="nav_link" onclick="proDropdown()"> <i class='bx bxs-factory nav_icon'></i> <span class="nav_name">캘린더</span> </a> 
               
				</div>
 
                
				<div class="nav_list">
					<a href="#" class="nav_link" onclick="toggleDropdown2()"> <i class="bx bxs-cart-alt nav_icon"></i> <span class="nav_name">예약</span> </a> 
					
				</div>
					<!-- 7/8 추가 -->
                  <div class="nav_list">
                 <div class="nav_link collapse" id="rec">
	
				</div>
                 </div>
				<div>
				 <!-- 0622 -->
                 <a href=" /customer/customerList " class="nav_link"> <i class='bx bxs-briefcase-alt-2 nav_icon'></i> <span class="nav_name">조직도</span></a> 
                 <!-- 0622 -->
				</div>
				<div>
				     <a href="/public/boardList" class="nav_link"> <i class='bx bx-clipboard nav_icon' ></i><span class="nav_name">게시판</span></a> 
				</div>
            </div>
            </div>  
            <div>
            	<a href="/public/chatList" class="nav_link"> <i class='bx bx-message-dots nav_icon' ></i> <span class="nav_name">메신저</span> </a>
            </div> 
        </nav>
    </div>
    
          <!--   <a href="#" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a> -->


</body>
</html>