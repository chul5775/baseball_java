<%@page import="pack.business.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="guestBean" class="pack.business.GuestBean" />
<jsp:setProperty property="*" name="guestBean" />
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%

boolean b = processDao.upData(guestBean);

System.out.println(guestBean.getG_id());
if(b){
	response.sendRedirect("guest.jsp");
}else{
	response.sendRedirect("fail.jsp");
}
%>