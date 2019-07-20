<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />
<jsp:useBean id="dto" class="pack.board.BoardDto" />
<%
	String num = request.getParameter("num");
	String spage = request.getParameter("page");
	//out.println(num + " " + spage);
	System.out.print(num);
	System.out.print(spage);	
	
	processDao.updateReadcnt(num); //조회수 늘리기
	dto = processDao.getData(num); //자료 읽기

	String name = dto.getName();
	String mail = dto.getMail();
	String title = dto.getTitle();

	String cont = dto.getCont();
	String bdate = dto.getBdate();
	int readcnt = dto.getReadcnt();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8">
	<!--  utf-8 인코딩이고 반응형웹을 쓰겠다 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
	<!--  부트스트랩 css 추가하기 -->
	<link rel="stylesheet" href="../src/css3/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
		<link rel="stylesheet" href="../src/css3/custom.css">
</head>
<body>
	<table class="table table-striped">
		<tr>
			<td colspan="3" >작성자 : <%=name%></a>
			</td>
		</tr>
		<tr>
			<td>제목 : <%=title%>
			</td>
			<td>작성일 :<%=bdate%>
			</td>
			<td>조회수 :<%=readcnt%>
			</td>
		</tr>
		
		<tr>
			<td colspan="3"><textarea rows="10" style="width: 99%" readonly="readonly"><%=cont%></textarea>
			</td>
		</tr>
		
		<tr>
		<td colspan="3" style="text-align: center">
		<a href="javascript:window.close()" onclick="check()">창닫기</a></td>
		</tr>
	</table>
	

<!--  제이쿼리 자바스크립트 추가하기 -->
<script src="../src/js/jquery.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="../src/js/popper.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="../src/js/bootstrap.js"></script>
<!-- MDB 라이브러리 자바스크립트 추가 -->
<script src="../src/js/mdb.min.js"></script>
</body>
</html>