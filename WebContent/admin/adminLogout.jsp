
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
session.removeAttribute("adminKey");
%>
<script>
alert("로그아웃 성공");
location.href = "adminLogin.jsp";
</script>
</body>
</html>