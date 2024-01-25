<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
    prefix="sec"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        function showAlertAndGoBack() {
            alert("관리자만 접근 가능한 페이지입니다. 이전 페이지로 이동합니다.");
            window.history.back();
        }
    </script>
</head>
<body onload="showAlertAndGoBack()">
    <!-- 페이지 내용 -->
</body>
</html>
