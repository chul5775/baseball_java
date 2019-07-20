<%@page import="pack.business.ProcessDao"%>
<%@page import="pack.business.DirectorRDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<%
String no = request.getParameter("d_no");
String team = request.getParameter("t_name");
String name = request.getParameter("d_name");
String pwd = request.getParameter("d_pwd");
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
   <link rel="stylesheet" href="../src/css3/bootstrap.min.css">
   <!-- 커스텀 css 추가하기 -->
      <link rel="stylesheet" href="../src/css3/custom.css">
<script type="text/javascript">


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
         <a class="nav-item nav-link" href="../baseball.html">홈페이지</a>
         <a class="nav-item nav-link active" href="../guest/guest.jsp">회원관리</a>
         <a class="nav-item nav-link" href="../player_search.jsp">선수관리</a>
         <a class="nav-item nav-link" href="../director/director.jsp">감독관리</a>
         <a class="nav-item nav-link" href="../event/event.jsp">이벤트&게시판</a>
      </div>
      
      <div class="navbar-nav mr-sm-2"><!-- 오른쪽 nav정렬 -->
         <a class="nav-item nav-link active" href="../admin/adminLogout.jsp">
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
               <h4><img src="../res/setting.svg"> 관리할 항목<small>을 선택해 주세요.</small></h4>
            </div>
            
            
            <div class="col-sm-3">
            <div class="btn-group float-right">  <!-- 오른쪽 정렬 -->
            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            관리 목록▼
            </button>
            <div class="dropdown-menu">
            <a class="dropdown-item active" href="../guest/guest.jsp">회원관리</a>
            <a class="dropdown-item active" href="../event/event.jsp">선수관리</a>
            <a class="dropdown-item active" href="../director/director.jsp">감독관리</a>
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
                  <a href="#" class="list-group-item active">회원 정보 수정</a>
                  <div class="list-group-item">
                     <form method="post" action="directorupproc.jsp">
                        <!-- 아이디-->
                        <div class="form-group">
                           <label>감독번호</label><br>
                           <%=no %>
                           <input type="hidden" name="d_no" value="<%=no %>">
                        </div> 
                        <div class="form-group">
                           <label>팀이름</label><br>
                           <%=team%>

                        </div> 
                        <!-- 비밀번호-->
                        <div class="form-group">
                           <label>감독 이름</label>
                           <input type="text" name="d_name" class="form-control" value="<%=name %>">
                        </div>                                                 
                        <div class="form-group">
                           <label>비밀번호</label>
                           <input type="password" name="d_pwd" class="form-control" value="<%=pwd %>">
                        </div>

      
                        <input type="submit" class="btn btn-primary" value="수정하기">
                         &nbsp;&nbsp; 
                         <input   type="button" class="btn btn-primary" value="수정취소" id="btnUpdateCancelGuest">
                         &nbsp;&nbsp;
                        
                     </form>
                  </div>
               </div>
            </div>
         
         <!-- ------------------------------------------------------------------------------------------------------------------------------------ -->
         
      
      
         
         </div>            
      </div>
</section>



<!--  footer!!!! -->
<footer class="bg-dark mt-4 p-5 text-center" style="color : #FFFFFF;">
<img src="../image/kbo.jpg" width="50p", height="50p">
kbo 프로야구 관리자 시스템   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
TEL:02-471-1124
</footer>





</body>
</html>