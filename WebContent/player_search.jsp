<%@page import="java.util.HashMap"%>
<%@page import="pack.business.PlayerDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="playerDto" class="pack.business.PlayerDto" />
<jsp:useBean id="playerDao" class="pack.business.PlayerDao" />


<%
	request.setCharacterEncoding("utf-8");
	int pageSu, spage = 1;
%>


<!DOCTYPE html>
<html>
<script type="text/javascript">
function funcdel(no){
	var message = confirm("정말 삭제하시겠습니까?");
	if(message = true){
		location.href = "./player/playerdel.jsp?p_no=" + no;
		alert("정상적으로 삭제되었습니다");
		alert("F5(새로고침)을 눌러주세요");
	}else{
		alert("죄송하게도 삭제가 안됬네요")		
	}
}

function funcup(p_no,t_no,p_name,p_birth,weight,height,type,pos,b_num,pay){
	   location.href = "player/playerUp.jsp?p_no=" + p_no +
       "&t_no=" + t_no +
       "&p_name=" + p_name +
       "&p_birth=" + p_birth +
       "&weight=" + weight +
       "&height=" + height +
       "&type=" + type +
       "&pos=" + pos +
       "&b_num=" + b_num +
       "&pay=" + pay       
	
}
</script>
<head>
<meta charset="UTF-8">
<title>선수 조회</title>
<meta charset="utf-8">
	<!--  utf-8 인코딩이고 반응형웹을 쓰겠다 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
	<!--  부트스트랩 css 추가하기 -->
	<link rel="stylesheet" href="./src/css3/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
		<link rel="stylesheet" href="./src/css3/custom.css">

<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("btnSearch").onclick = function() {
			frm.submit();
			document.clear;
		}
	}
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="adminMain.jsp">관리자 페이지</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span><!-- 짝대기 3개 목록 아이콘을 추가해줌... 지우면 아이콘만 없어짐 삽입되어있는 아이콘을 가져다 쓰는거 크기가 작아저야 나타남. -->
		</button>
		<!--data-target="#navbar" 이름의  collapse : 보여줬다가 안보여줬다게 하는거 -->
		<!--  navbar 네비게이션 시작 부분!!! -->
		<div class="collapse navbar-collapse justify-content-between" id="navbar">
		<!-- 위 data-target="#navbar" 하고 id를 매칭해서 저 버튼이 눌렸을 경우 이부분이 보이게 만드는거임 -->
		
		
		<div class="navbar-nav"><!--왼쪽 nav정렬 -->
			<a class="nav-item nav-link" href="./index.html">홈페이지</a>
			<a class="nav-item nav-link" href="./guest/guest.jsp">회원관리</a>
			<a class="nav-item nav-link active" href="./player_search.jsp">선수관리</a>
			<a class="nav-item nav-link" href="./director/director.jsp">감독관리</a>
			<a class="nav-item nav-link" href="./event/event.jsp">이벤트&게시판</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		
		<div class="navbar-nav mr-sm-2"><!-- 오른쪽 nav정렬 -->
			<a class="nav-item nav-link active" href="./admin/adminLogout.jsp">
			로그아웃</a>
		</div>
		
		
		<!--  navbar 네비게이션 끝 부분!!! -->
		</div>
		
		
	<!-- 네비게이션 바 마지막 부분!! -->
	</nav>

	<h1>선수조회</h1>
	<br>
	<form name="frm" method="post" action="player_search.jsp">
		<table class="table table-hover">
			<tr style="background-color: #FFFFCC">

				<td><select name=t_no class="form-control">
						<option value="0">팀 선택</option>
						<option value="999">SK</option>
						<option value="100">두산</option>
						<option value="200">한화</option>
						<option value="400">키움</option>
						<option value="300">KIA</option>
						<option value="800">삼성</option>
						<option value="600">롯데</option>
						<option value="900">LG</option>
						<option value="500">KT</option>
						<option value="700">NC</option>
				</select></td>

				<td><select name=pos class="form-control">
						<option value="0">포지션 선택</option>
						<option value="포수">포수</option>
						<option value="내야수">내야수</option>
						<option value="외야수">외야수</option>
						<option value="투수">투수</option>
				</select> <input type="hidden" name="pos"></td>
				<td><input type="text" name="p_name" class="form-control"></td>
				<td><input type="submit" value="검색" id="btnSearch"
					class="btn btn-default">
			</tr>

			<tr >
				<th style="text-align: center;">선수 사진</th>
				<th style="text-align: center;">등번호</th>
				<th style="text-align: center;">선수명</th>
				<th style="text-align: center;">팀명</th>
				<th style="text-align: center;">포지션</th>
				<th style="text-align: center;">생년월일</th>
				<th style="text-align: center;">수정/삭제</th>
			</tr>
			
			<%
				ArrayList<PlayerDto> list = null;
				
				try {
					spage = Integer.parseInt(request.getParameter("page"));
				} catch (Exception e) {
					spage = 1;
				}
				if (spage <= 0)
					spage = 1;

				String pos = request.getParameter("pos");
				String p_name = request.getParameter("p_name");
				String t_no = request.getParameter("t_no");	

				pageSu = playerDao.PagesuPart(t_no, pos, p_name);
				list = (ArrayList<PlayerDto>) playerDao.getDataPart(spage, t_no, pos, p_name);
			%>

			<c:forEach var="list" items="<%=list%>">
			<input type="hidden" value="${list.p_no }">
				<tr >
					<td style="text-align: center; font-size: 20px; font-style: inherit;"><img src ="./player_image/${list.p_image}"></td>
					<td style="text-align: center; font-size: 20px; font-style: inherit;">${list.b_num}</td>
					<td style="text-align: center; font-size: 20px; font-style: inherit;">${list.p_name}</td>
					<td style="text-align: center; font-size: 20px; font-style: inherit;"><c:choose>
							<c:when test="${list.t_no == '999'}">SK</c:when>
							<c:when test="${list.t_no == '100'}">두산</c:when>
							<c:when test="${list.t_no == '200'}">한화</c:when>
							<c:when test="${list.t_no == '400'}">키움</c:when>
							<c:when test="${list.t_no == '300'}">KIA</c:when>
							<c:when test="${list.t_no == '800'}">삼성</c:when>
							<c:when test="${list.t_no == '600'}">롯데</c:when>
							<c:when test="${list.t_no == '900'}">LG</c:when>
							<c:when test="${list.t_no == '500'}">KT</c:when>
							<c:when test="${list.t_no == '700'}">NC</c:when>
						</c:choose></td>
					<td style="text-align: center; font-size: 20px; font-style: inherit;">${list.pos}</td>
					<td style="text-align: center; font-size: 20px; font-style: inherit;">${list.p_birth}</td>
					<td style="text-align: center; font-size: 20px; font-style: inherit;">
					
					
					<input type="button" value="수정" class="btn btn-primary" onclick="javascript:funcup('${list.p_no}','${list.t_no}','${list.p_name}','${list.p_birth}','${list.weight}','${list.height}','${list.type}','${list.pos}','${list.b_num}','${list.pay}')"> /  
					<input type="button" value="삭제" class="btn btn-secondary" onclick="javascript:funcdel('${list.p_no}')"> 					
					
					
					</td>					
				</tr>
			</c:forEach>
		</table>
	</form>
	<!--  페이지 번호 -->
	<table class="table table-hover">
		<tr>
			<td style="text-align: center; ">
				<%
					for (int i = 1; i <= pageSu; i++) {
						if (i == spage) {
							out.print("<b style='font-size:14px; color:red;'>" + "[" + i + "] </b>");
						} else {
							if (pos == null && p_name == null && t_no == null)
								out.print("<a href='player_search.jsp?page=" + i + "'> [" + i + "] </a>");
							else
								out.print("<a href='player_search.jsp?page=" + i + "&&t_no=" + t_no +"&&pos=" + pos + "&&p_name=" + p_name
										+ "'> [" + i + "] </a>");
						}
					}
				%>
			</td>
		</tr>
	</table>
	<script
		src=https//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js></script>
	<script type="text/javacript" src="js/bootstrap.js"></script>
	
	
<!--  footer!!!! -->
<footer class="bg-dark mt-4 p-5 text-center" style="color : #FFFFFF;">
<img src="./image/kbo.jpg" width="50p", height="50p">
kbo 프로야구 관리자 시스템	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TEL:02-471-1124
</footer>


</body>
</html>