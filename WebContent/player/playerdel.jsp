<%@page import="pack.business.PlayerDto"%>
<%@page import="pack.business.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="playerBean" class="pack.business.PlayerFormBean" />
<jsp:setProperty property="*" name="playerBean" />
<jsp:useBean id="playerDao" class="pack.business.PlayerDao" />

<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("p_no");
	
	PlayerDto dto = playerDao.selectplayerDataPart(no);
	boolean b = playerDao.playerdelData(playerBean);

if(b){
%>
	<script>
	window.history.back();
	</script>
<%}else{%>
	response.sendRedirect("player_search.jsp");
<%
}
%>