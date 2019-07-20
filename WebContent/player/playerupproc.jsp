<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="playerFromBean" class="pack.business.PlayerFormBean" />
<jsp:setProperty property="*" name="playerFromBean" />
<jsp:useBean id="playerDao" class="pack.business.PlayerDao" />

<%
boolean b = playerDao.playerupData(playerFromBean);
System.out.print(playerFromBean.getP_no());
if(b){
   response.sendRedirect("../player_search.jsp");
}else{
   response.sendRedirect("fail.jsp");
}
%>