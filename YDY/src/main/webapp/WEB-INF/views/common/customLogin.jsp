<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
    font-family: 'Giants-Inline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Giants-Inline.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
h1{text-align: center;font-family: Giants-Inline;margin-bottom: 50px !important;}
.form-control{margin-bottom: 10px; border-color:#009999 !important; }
.d-grid{width: 100%;}
.btn{background-color: #009999 !important;border-color:#009999 !important;}
</style>
</head>
<body>
	<!-- header && sidebar include -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header && sidebar include -->
	<%-- 	<h2>
		<c:out value="${error}" />
	</h2>
	<h2>
		<c:out value="${logout}" />
	</h2> --%>
	<div class="container" id="login-con">
		<div class="form-group" id="log-form">
		<h1>Mygroup</h1>
			<form method="post" action="/login">
				<div>
					<input type="text" class="form-control" name="username" placeholder="이메일">
				</div>
				<div>
					<input type="password" class="form-control" name="password" placeholder="비밀번호">
				</div>
				<div class="d-grid">
				
					<input type="submit" class="btn btn-success btn-block" value="로그인">
				</div>
				<div>
				
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				</div>
			</form>
		</div>
	</div>

</body>
</html>

