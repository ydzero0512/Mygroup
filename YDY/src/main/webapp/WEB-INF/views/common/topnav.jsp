 <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   
 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 <meta charset="utf-8">
      <nav class="topnav navbar navbar-light">
        <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
          <i class="fe fe-menu navbar-toggler-icon"></i>
        </button>
        <form class="form-inline mr-auto searchform text-muted">
          <input class="form-control mr-sm-2 bg-transparent border-0 pl-4 text-muted" type="search" placeholder="Type something..." aria-label="Search">
        </form>
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="light">
              <i class="fe fe-sun fe-16"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-shortcut">
              <span class="fe fe-grid fe-16"></span>
            </a>
          </li>
          <li class="nav-item nav-notif">
            <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-notif">
              <span class="fe fe-bell fe-16"></span>
              <span class="dot dot-md bg-success"></span>
            </a>
          </li>
        
          	<!-- 토큰값 없음 --> 
            <sec:authorize access="isAnonymous()">
            <li class="nav-item">
                <a class="nav-link text-muted my-2" href="#">로그인</a>
            </li>    
            </sec:authorize>
            
            <!-- 토큰값 있음 --> 
            <sec:authorize access="isAuthenticated()">
           	<li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-muted pr-0" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <span class="avatar avatar-sm mt-2">
                <img src="/resources/assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle">
              </span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
            <sec:authentication property="principal.member" var="member" />
            ${member.name}
              <a class="dropdown-item" href="#">Profile</a>
              <a class="dropdown-item" href="#">Settings</a>
              <a class="dropdown-item" href="#">Activities</a>
            </div>
         	</li>
         
		    <form action="/logout" method="post">
		        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		        <button type="submit">로그아웃</button>
		    </form>
		  
            </sec:authorize>
        
        </ul>

      </nav>
      	