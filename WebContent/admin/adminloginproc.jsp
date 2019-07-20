<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="adminBean" class="pack.business.AdminBean" />
<jsp:setProperty property="*" name="adminBean"/>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />


<%
String a_id= request.getParameter("a_Id");
String a_pwd= request.getParameter("a_pwd");

boolean b = processDao.adminloginCheck(adminBean);

if(b) {
	%>
	<script>
	alert("로그인 성공")
	</script>
<%	
	session.setAttribute("adminKey", a_id);
	response.sendRedirect("../adminMain.jsp");
}else{
%>
	<script>
	alert("아이디/비밀번호가 틀렸습니다.");
	location.href = "adminLogin.jsp";
	</script>
<%		
}
%>