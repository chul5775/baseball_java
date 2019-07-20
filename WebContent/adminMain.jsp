<%@page import="pack.business.ProcessDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="processDao" class="pack.business.ProcessDao"></jsp:useBean>
<%
String aid = (String)session.getAttribute("adminKey");
request.setCharacterEncoding("utf-8");

int totG = 0;
int totD = 0;
int totP = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
	<meta charset="utf-8">
	<!--  utf-8 인코딩이고 반응형웹을 쓰겠다 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> 
	<!--  부트스트랩 css 추가하기 -->
	<link rel="stylesheet" href="./src/css3/bootstrap.min.css">
	<!-- 커스텀 css 추가하기 -->
		<link rel="stylesheet" href="./src/css3/custom.css">
</head>
<body>
	<!--  네비게이션 바 부분!!! -->
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
			<a class="nav-item nav-link" href="./player_search.jsp">선수관리</a>
			<a class="nav-item nav-link" href="./director/director.jsp">감독관리</a>
			<a class="nav-item nav-link" href="./event/event.jsp">이벤트&게시판</a>
		</div>
		<div class="navbar-nav mr-sm-2"><!-- 오른쪽 nav정렬 -->
			<a class="nav-item nav-link active" href="./admin/adminLogin.jsp">
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
					<h4><img src="./res/setting.svg"> 관리할 항목<small>을 선택해 주세요.</small></h4>
				</div>
				
				
				<div class="col-sm-3">
				<div class="btn-group float-right">  <!-- 오른쪽 정렬 -->
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				관리 목록▼
				</button>
				<div class="dropdown-menu">
				<a class="dropdown-item active" href="./guest/guest.jsp">회원관리</a>
				<a class="dropdown-item active" href="./player_search.jsp">선수관리</a>
				<a class="dropdown-item active" href="./director/director.jsp">감독관리</a>
				</div>
			</div>
		</div>
			<!--  row 끝!! -->
	 </div>
 </div>
</header>





<div class="container">
	<ol class="breadcrumb">
		<li class="breadcrumb">
		<br>이곳은 KBO 프로야구 관리자 페이지입니다.<br>불법적인 경로로 들어온 사용자는 처벌이 있을 수 있으니 즉시 로그아웃 해주시길 바랍니다.</li>
	</ol>
</div>


<!-- 사이드 네비게이션 추가하기!! -->
<section id ="main">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
			
			    <!-- 사이드 메뉴  -->
				<div class="list-group">
					<a href="./adminMain.jsp" class="list-group-item active">이벤트 및 게시판</a>
					<a href="./event/event.jsp" class="list-group-item">룰렛 이벤트 </a>
					<a href="./board/board.jsp" class="list-group-item">자유 게시판</a> 
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
					<a href="adminMain.jsp" class="list-group-item active">데이터베이스 현황</a>
					<div class="list-group-item">
						<div class="row m-1">

								<div class="col-md-4 text-center bg-light p-5">
								<a href="./guest/guest.jsp"><img src="./res/edit.svg"></a>
								<h3>
								<%
								totG = processDao.totalG();
								%>
								<%=totG %>
								</h3>
								<h5>회원</h5>
								</div>
								<div class="col-md-4 text-center bg-light p-5">
								<a href="./player_search.jsp"><img src="./res/user.svg"></a>
								<h3>
								<%
								totP = processDao.totalP();
								%>
								<%=totP %>
								</h3>
								<h5>선수</h5>
								</div>
								<div class="col-md-4 text-center bg-light p-5">
								<a href="./director/director.jsp"><img src="./res/bar.svg"></a>
								<h3>
								<%
								totD = processDao.totalD();
								%>
								<%=totD %>
								</h3>
								<h5>감독</h5>
								</div>
						</div>
					</div>
				</div>
				<div class="list-group mt-3">
				<!-- 위쪽으로 3만큼 margin -->
				<a href="#" class="list-group-item active">방문자 지수</a>
				<div class="list-group-item">
					<canvas id="lineChart"></canvas>
				</div>
				</div>
			</div>
			
			
			
		
		
			
			</div>				
		</div>
	
</section>



<!--  footer!!!! -->
<footer class="bg-dark mt-4 p-5 text-center" style="color : #FFFFFF;">
<img src="./image/kbo.jpg" width="50p", height="50p">
kbo 프로야구 관리자 시스템	
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TEL:02-471-1124
</footer>



<!--  제이쿼리 자바스크립트 추가하기 -->
<script src="./src/js/jquery.js"></script>
<!-- Popper 자바스크립트 추가하기 -->
<script src="./src/js/popper.js"></script>
<!-- 부트스트랩 자바스크립트 추가하기 -->
<script src="./src/js/bootstrap.js"></script>
<!-- MDB 라이브러리 자바스크립트 추가 -->
<script src="./src/js/mdb.min.js"></script>


<script>
  //line
  var ctxL = document.getElementById("lineChart").getContext('2d');
  var myLineChart = new Chart(ctxL, {
    type: 'line',
    data: {
      labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월"],
      datasets: [{
          label: "유입 방문자",
          data: [530, 5546, 9763, 10230, 19432, 36559, 58665],
          backgroundColor: [
            'rgba(105, 0, 132, .2)',
          ],
          borderColor: [
            'rgba(200, 99, 132, .7)',
          ],
          borderWidth: 2
        },
        {
          label: "무효 방문자",
          data: [37, 159, 400, 1000,1300, 1300, 1400],
          backgroundColor: [
            'rgba(0, 137, 132, .2)',
          ],
          borderColor: [
            'rgba(0, 10, 130, .7)',
          ],
          borderWidth: 2
        }
      ]
    },
    options: {
      responsive: true
    }
  });

</script>





</body>
</html>