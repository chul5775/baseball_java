<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%String a_id = (String)session.getAttribute("adminKey");%>
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
window.onload = function() {
	document.getElementById("btnAdminlogin").onclick = funcAdminlogin;
	document.getElementById("btnAdminHome").onclick = funcHome;
}

function funcAdminlogin() {
	//입력자료 검사 생략...
	adminForm.submit(); 
	
}
function funcHome() {
	//alert("b");
	location.href = "../index.jsp";
}

function funcA(){
	alert("로그인 후 이용 가능합니다")
}
</script>

</head>
<body>
	<!--  네비게이션 바 부분!!! -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="javascript:funcA();">관리자 페이지</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar" aria-controls="navbar" aria-expanded="false">
		<span class="navbar-toggler-icon"></span><!-- 짝대기 3개 목록 아이콘을 추가해줌... 지우면 아이콘만 없어짐 삽입되어있는 아이콘을 가져다 쓰는거 크기가 작아저야 나타남. -->
		</button>
		<!--data-target="#navbar" 이름의  collapse : 보여줬다가 안보여줬다게 하는거 -->
		<!--  navbar 네비게이션 시작 부분!!! -->
		<div class="collapse navbar-collapse justify-content-between" id="navbar">
		<!-- 위 data-target="#navbar" 하고 id를 매칭해서 저 버튼이 눌렸을 경우 이부분이 보이게 만드는거임 -->
		
		
		<div class="navbar-nav"><!--왼쪽 nav정렬 -->
			<a class="nav-item nav-link" href="javascript:funcA();">홈페이지</a>
			<a class="nav-item nav-link" href="javascript:funcA();">회원관리</a>
			<a class="nav-item nav-link" href="javascript:funcA();">선수관리</a>
			<a class="nav-item nav-link" href="javascript:funcA();">감독관리</a>
			<a class="nav-item nav-link" href="javascript:funcA();">이벤트&게시판</a>
		</div>
		
		<div class="navbar-nav mr-sm-2"><!-- 오른쪽 nav정렬 -->
			<a class="nav-item nav-link active " href="./adminLogin.jsp">로그인</a>


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
					<h4><img src="../res/setting.svg"> 로그인<small>을 합시다</small></h4>
				</div>
				
				
			
			<!--  row 끝!! -->
	 </div>
 </div>
</header>





<div class="container">
	<ol class="breadcrumb">
		<li class="active">로그인 이후 관리자 페이지에 접속하세요</li>
	</ol>
</div>


<!-- 사이드 네비게이션 추가하기!! -->
<section id="main">
	<div class="container" style="max-width:560px;">
		<form action="adminloginproc.jsp" name="adminForm" method="post">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="a_id" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password"  name="a_pwd" class="form-control">
			</div>
			<!-- 
			<button type="submit" class="btn btn-primary" id="btnAdminlogin">로그인</button>
			<button class="btn btn-primary" id="btnAdminlogin">홈으로</button>
			 -->
			<input type="button" class="btn btn-primary" value="관리자 로그인" id="btnAdminlogin">
			<!-- 
			<input type="button" class="btn btn-primary" value="홈페이지로 이동" id="btnAdminHome">
			 -->
		</form>
		
	
	</div>
</section>



<!--  footer!!!! -->
<footer class="bg-dark mt-4 p-5 text-center" style="color : #FFFFFF;">
<img src="../image/kbo.jpg" width="50p", height="50p">
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
</body>
</html>