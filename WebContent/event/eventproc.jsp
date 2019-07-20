<%@page import="pack.business.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="guestBean" class="pack.business.GuestBean" />
<jsp:setProperty property="*" name="guestBean" />
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("g_id");
	GuestDto dto = processDao.selectDataPart(id);
	boolean b = processDao.ticketData(guestBean);

if(b){
	response.sendRedirect("event.jsp");
}else{
	response.sendRedirect("fail.jsp");
}
%>