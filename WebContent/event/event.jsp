<%@page import="pack.business.ProcessDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.business.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

 <jsp:useBean id="processDao" class="pack.business.ProcessDao" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
	<meta charset="utf-8">
	<!--  utf-8 인코딩이고 반응형웹을 쓰겠다 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
	<!--  부트스트랩 css 추가하기 -->
	<link rel="stylesheet" href="../src/css3/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
		<link rel="stylesheet" href="../src/css3/custom.css">
<script type="text/javascript">

function funcTicket(id, point){
	if(point < 100){
		alert("100p 미만이므로 티켓교환 불가")
	}else{
		alert("티켓교환 완료")
		location.href = "eventproc.jsp?g_id=" + id;
	}
	
}
</script>
</head>
<body>
	<!--  네비게이션 바 부분!!! -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="../adminMain.jsp">관리자 페이지</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span><!-- 짝대기 3개 목록 아이콘을 추가해줌... 지우면 아이콘만 없어짐 삽입되어있는 아이콘을 가져다 쓰는거 크기가 작아저야 나타남. -->
		</button>
		<!--data-target="#navbar" 이름의  collapse : 보여줬다가 안보여줬다게 하는거 -->
		<!--  navbar 네비게이션 시작 부분!!! -->
		<div class="collapse navbar-collapse justify-content-between" id="navbar">
		<!-- 위 data-target="#navbar" 하고 id를 매칭해서 저 버튼이 눌렸을 경우 이부분이 보이게 만드는거임 -->
		
		
		<div class="navbar-nav"><!--왼쪽 nav정렬 -->
			<a class="nav-item nav-link " href="../baseball.html">홈페이지</a>
			<a class="nav-item nav-link" href="../guest/guest.html">회원관리</a>
			<a class="nav-item nav-link " href="../player_search.jsp">선수관리</a>
			<a class="nav-item nav-link" href="../director/director.jsp">감독관리</a>
			<a class="nav-item nav-link active " href="./event.jsp">이벤트&게시판</a>
		</div>
		
		<div class="navbar-nav mr-sm-2"><!-- 오른쪽 nav정렬 -->
			<a class="nav-item nav-link" href="../admin/adminLogin.jsp">
			로그아웃</a>
		</div>
		
		
		<!--  navbar 네비게이션 끝 부분!!! -->
		</div>
		
		
	<!-- 네비게이션 바 마지막 부분!! -->
	</nav>
	<header id="header">
		<div class="container p-3 bg-dark text-white"> <!-- padding 3  배경색 어둡게 글씨채는 하얗게 -->
		 <!--  하나의 행을 여러개의 열로 나눔 row 시작 -->
			<div class="row">
			<!--  최대 12개중에 9개를 쓰겠다 왼쪽 하나의 행을 9개 3개 로 나누는 거임!!! -->
				<div class="col-sm-9 info"> 
					<h4><img src="../res/eventsmall.svg"> 이벤트&게시판<small>&nbsp; 페이지를 관리하세요</small></h4>
				</div>
				
				
				<div class="col-sm-3">
				<div class="btn-group float-right">  <!-- 오른쪽 정렬 -->
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				관리 목록▼
				</button>
				<div class="dropdown-menu">
				<a class="dropdown-item active" href="../event/event.jsp">룰렛이벤트</a>
				<a class="dropdown-item " href="../board/board.jsp">자유 게시판</a>		
				</div>
			</div>
		</div>
			<!--  row 끝!! -->
	 </div>
 </div>
</header>





<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb">웹 사이트에 존재하는 이벤트 & 게시판을 관리하세요</li>
	</ol>
</div>


<!-- 사이드 네비게이션 추가하기!! -->
<section id ="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			
			    <!-- 사이드 메뉴  -->
				<div class="list-group">
					<a href="../adminMain.jsp" class="list-group-item active">이벤트 및 게시판</a>
					<a href="../event/event.jsp" class="list-group-item">룰렛 이벤트 </a>
					<a href="../board/board.jsp" class="list-group-item">자유 게시판</a> 
				</div>
				
				
				<!--  cpu등 메모리 관리 그래프 -->
				<div class="p-2 my-2"> <!-- padding 2만큼 margin 위아래로 2만큼 -->
					<h5 class="mt-2">cpu점유율</h5>
					<div class="progress" style="height:20px; background:color:#f2f2f2">
						<div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" style="width:10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div>
				
					<h5 class="mt-2">메모리 점유율</h5>
					<div class="progress" style="height:20px; background:color:#f2f2f2">
						<div class="progress-bar progress-bar-striped bg-primary progress-bar-animated" role="progressbar" style="width:40%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div>
					
					<h5 class="mt-2">디스크 점유율</h5>
					<div class="progress" style="height:20px; background:color:#f2f2f2">
						<div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" style="width:60%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div>
					
					<h5 class="mt-2">트래픽</h5>
					<div class="progress" style="height:20px; background:color:#f2f2f2">
						<div class="progress-bar progress-bar-striped bg-warning progress-bar-animated" role="progressbar" style="width:50%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100">
						</div>
					</div>
				</div>
				
				
				<!--  외부 사이트 연결 -->
				<div class="p-2 my-2">
					<div class="card text-center pt-2 bg-light">
						<h5 class="pt-2 pb-2">외부사이트</h5>
						<ul class="list-group">
							<li class="list-group-item"><a href="http://www.naver.com">네이버</a></li>
							<li class="list-group-item"><a href="http://www.daum.net">다음</a></li>
							<li class="list-group-item"><a href="http://www.facebook.com">페이스북</a></li>
							<li class="list-group-item"><a href="http://www.youtube.com">유튜브</a></li>
						</ul>
					</div>
				</div>
				</div>
				
				
				
				<!-- 가운데 메인페이지 시작!!!!! -->
				<div class="col-md-9">
				<div class="list-group">
					<a href="#" class="list-group-item active">룰렛이벤트</a>
					<div class="list-group-item">
						<div class="list-group">
							<table class="table">
								<tbody>
									<tr>
										<th class="mobile"style="width:80px; text-align: center;">회원명</th>
										<th class="mobile"style="width:80px; text-align: center;">포인트점수</th>
										<th class="mobile"style="width:120px; text-align: center;">티켓수</th>
										<th class="mobile"style="width:120px; text-align: center;">관람티켓발송</th>
									</tr>
									<%
										ArrayList list = (ArrayList<GuestDto>)processDao.selectDataAll();
									%>
									<c:set var="list" value="<%=list%>" />
							
									<c:if test="${empty list}">
										<tr>
											<td colspan="4">자료 없음</td>
										</tr>
									</c:if>
									
									<c:forEach var="m" items="<%=list%>">
										<tr>
											<td class="mobile"style="width:80px; text-align: center;">${m.g_name}</td>
											<td class="mobile"style="width:120px; text-align: center;">${m.g_point} P</td>
											<!-- #나중에 달력 만들때 원하는 일 수만큼 잘라서 쓰기.# -->
											<td class="mobile"style="width:120px; text-align: center;">${m.g_ticket}</td>
											<td class="mobile"style="width:120px; text-align: center;">
											
											<c:if test="${m.g_point < 100 }">											
											<input type="button" value="티켓교환" class="btn btn-secondary" onclick="funcTicket('${m.g_id }',${m.g_point})"></td>											
											</c:if>
											<c:if test="${m.g_point >= 100 }">
											<input type="button" value="티켓교환" class="btn btn-primary" onclick="funcTicket('${m.g_id }',${m.g_point})"></td>											
											</c:if>

										</tr>
									</c:forEach>

									<!-- 
									<tr>
										<td class="mobile"style="width:60px; text-align: center;">3</td>
										<td style="text-align: center;">
											룰렛 이벤트 입니다
										</td>
										<td class="mobile"style="width:80px; text-align: center;">운영자</td>
										<td class="mobile"style="width:120px; text-align: center;">작성일</td>
									</tr>
									
										<tr>
										<td class="mobile"style="width:60px;">2</td>
										<td class="mobile"style="text-align: center;">
											룰렛 이벤트 입니다
										</td>
										<td class="mobile"style="width:80px; text-align: center;">운영자</td>
										<td class="mobile"style="width:120px; text-align: center;">작성일</td>
										</tr>
										
										<tr>
										<td class="mobile"style="width:60px;">1</td>
										<td class="mobile" style="text-align: center;">
											룰렛 이벤트 입니다
										</td>
										<td class="mobile"style="width:80px; text-align: center;">운영자</td>
										<td class="mobile"style="width:120px; text-align: center;">작성일</td>
										</tr>
										<tr>
											<td colspan="4"><button class="btn btn-success" data-toggle="modal" data-target="#modal">이벤트 추가</button></td>
										</tr>
								-->
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="list-group mt-3">
				<!-- 위쪽으로 3만큼 margin -->
				<a href="#" class="list-group-item active">룰렛 포인트 회원별 분포도</a>
				<div class="list-group-item">
					<canvas id="pieChart"></canvas>
				</div>
				</div>
			</div>
			
			
			
		
		
			
			</div>				
		</div>
	
</section>
<div class="modal fade" id="modal"  tabindex="-1" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">이벤트 추가</h5>
				<button type="button" class="close" data-dismiss="modal"> <!-- 모달을 닫아주는 역활 -->
					<span aria-hidden="true">&times;</span> <!-- x표시의 아이콘을 넣어줌! -->
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control">
					</div>
					<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" style="height:180px;"></textarea>
					</div>
					<div class="form-group">
					<label>해시 태크</label>
					<input type="text" class="form-control">
					</div>
					<div class="form-group">
					<label>종료 날짜</label>
					<input type="datetime-local" class="form-control" value="2018-01-01">
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" data-miss="modal">추가하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>


<!--  footer!!!! -->
<footer class="bg-dark mt-4 p-5 text-center" style="color : #FFFFFF;">
<img src="../image/kbo.jpg" width="50p", height="50p">
kbo 프로야구 관리자 시스템	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TEL:02-471-1124
</footer>



<!--  제이쿼리 자바스크립트 추가하기 -->
<script src="../src/js/jquery.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="../src/js/popper.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="../src/js/bootstrap.js"></script>
<!-- MDB 라이브러리 자바스크립트 추가 -->
<script src="../src/js/mdb.min.js"></script>

<c:set var="list" value="<%=list%>" />

<!-- 

 -->

	

<c:forEach var="m" items="<%=list%>">
<tr>
	<td class="mobile"style="width:80px; text-align: center;">${m.g_name}</td>
	<td class="mobile"style="width:120px; text-align: center;">${m.g_point}</td>
	<!-- #나중에 달력 만들때 원하는 일 수만큼 잘라서 쓰기.# -->
	<td class="mobile"style="width:120px; text-align: center;">${m.g_ticket}</td>
	<td class="mobile"style="width:120px; text-align: center;">발송</td>
</tr>
</c:forEach>
<script>
  //pie

  
  var ctxP = document.getElementById("pieChart").getContext('2d');
  var myPieChart = new Chart(ctxP, {
    type: 'pie',
    data: {
      labels: ["123", "aaa", "kbs", "mbc", "vvv"],
      datasets: [{
        data: [50, 350, 300, 500, 80],
        backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
        hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
      }]
    },
    options: {
      responsive: true
    }
  });

</script>




</body>
</html>