<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="directorRBean" class="pack.business.DirectorRBean" />
<jsp:setProperty property="*" name="directorRBean" />
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
boolean b = processDao.direcotorupData(directorRBean);

if(b){
   response.sendRedirect("director.jsp");
}else{
   response.sendRedirect("fail.jsp");
}
%>