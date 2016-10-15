<%-- 
   @JSP : petlist.jsp
   @Date : 2016-10-11
   @Author : 박문수, 김지율
   @Desc : 실종 신고 게시판의 이미지 목록을 보여주는 jsp 페이지, 수정
--%>
<%@page import="com.d15.DTO.Member_DTO"%>
<<<<<<< HEAD
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>실종신고ㅠ.ㅠ</title>

    <!-- Bootstrap Core CSS 원본-->
    <!-- <link href="boot2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->
 	<!-- Bootstrap Core CSS 수정본 [지율주석] 실제사용할것-->
    <link href="../../css/team01_bootstrap_core.css" rel="stylesheet">
    
    <!-- Theme CSS 원본 -->
    <!-- <link href="boot2/css/freelancer.min.css" rel="stylesheet"> -->    
    <!-- Theme CSS 수정본 [지율주석] 실제사용할것 -->
    <link href="../../css/team01_theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <!-- <link href="boot2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"> -->
    <link href="../../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


<script type="text/javascript">
   $(function(){
      $("#button").click(function(){
         location.href = "BoardWrite.missing";
      });
   });
   function detail(list){
      location.href = "ListDetail.missing?cp=${cpage}&ps=${pagesize}&mis_no="+list;
   };
</script>

<body id="page-top" class="index">

<!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <!-- <a class="navbar-brand" href="#page-top">Start Bootstrap</a> -->
            <a class="navbar-brand" href="/TeamProject3_D15/index.jsp"><img style="margin-top:-20px" src="/TeamProject3_D15/images/logo.gif"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top">Home</a>
                </li>
                <li class="page-scroll">
                    <a href="#about">소개</a>
                </li>
                <!-- [지율주석] 공지사항~게시판 추가 시작 -->
                <li class="page-scroll">
                    <a href="#notice">공지사항</a>
                </li>
                <li class="page-scroll">
                    <a href="#cur_situ">현황</a>
                </li>
                <li class="page-scroll">
                	<a href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.keyurl">분양/임시보호</a>
                    <!-- <a href="#parcelout">분양/임시보호</a> -->
                </li>
                <li class="page-scroll">
                	<a href="/TeamProject3_D15/D15/Missing/BoardList.missing">실종</a>
                    <!-- <a href="#cur_situ">실종</a> -->
                </li>
                <li class="page-scroll">
                    <a href="#board">게시판</a>
                </li>
                <!-- [지율주석] 공지사항~게시판 추가 끝 -->
                <!-- [지율주석] 버튼 스타일 먹이기 도전 시작 -->
                <!-- <li class="page-scroll">
                    <a><input type="button" value="로그인"></a>
                </li>
                <li class="page-scroll">
                    <a><input type="button" value="회원가입" id="reg"></a>
                </li>
                [지율주석] 버튼 스타일 먹이기 도전 끝  -->                   
                <li class="">
                	<a> 
                	<%
					String str = "";
				 	Member_DTO memberdto = (Member_DTO) session.getAttribute("memberdto");
				 	if (memberdto != null) {
				 		str += memberdto.getM_id() + "님 로그인 ";
				 		out.print("<form action='/TeamProject3_D15/D15/Login/Logout.login' method='post'>");
				 		out.print(str
				 				+ "<input type='submit' value='로그아웃'>&nbsp&nbsp<a href='/TeamProject3_D15/D15/Login/Mypage.login'>[마이페이지]</a>");
				
				 		out.print("</form>");
				 	} else {
				 		out.print("<form action='/TeamProject3_D15/D15/Login/Login.login' method='post'>");
				 		out.print("<input type='submit' value='로그인'>");
				 		out.print("<input type='button' value='회원가입' id = 'reg'>");
				 		out.print("</form>");
				 	}									
					%>
					</a>
				</li>                
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

   <c:set var="cpage" value = "${requestScope.cpage}" />
   <c:set var="pagesize" value = "${requestScope.pagesize}" />
   <c:set var="pagecount" value = "${requestScope.pagecount}" />
   <c:set var="totalcount" value = "${requestScope.totalcount}" />
   <c:set var="list" value="${requestScope.list}" />
   <%
      int i = 1;
      String uploadpath = request.getRealPath("upload");
   %>
   <team01content>   
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>실종신고</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>잃어버린 견공들을 찾습니다.</p>
                </div>
                <div class="col-lg-4">
                    <p>너는 지금 어디있니</p>
                </div>
                <div class="col-lg-8 col-lg-offset-2 text-center">
					<c:forEach var="list" items="${list}">
						<a href="../../upload/${list.p_image}" class="image-popup"> 
						<img src="../../upload/${list.p_image}" alt="Image" class="img-responsive"></a>
						<span>게시물 번호 : ${list.mis_no} <input type="button"
							id="detail<%=i++%>" value="상세보기" class="btn btn-info"
							style="position: absolute; right: 10px"
							onclick="detail(${list.mis_no})"></span>
						<h2>회원 ID : ${list.m_id}</h2>
						<span>실종 날짜 : ${list.mis_date} <br> 실종 위치 :
							${list.mis_loc}
						</span>
						<br>
						<span>내용 : ${list.mis_content}</span>&nbsp;&nbsp;
								<c:choose>
							<c:when test="${list.mis_pro == 'N'}">
								<font color="red" style="position: absolute; right: 10px">실종</font>
							</c:when>
							<c:otherwise>
								<font color="green" style="position: absolute; right: 10px">찾음</font>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<table align="center">
							<tr>
								<td colspan="3" align="center">
									<!--이전 링크 --> <c:if test="${cpage>1}">
										<a href="BoardList.missing?cp=${cpage-1}&ps=${pagesize}">이전</a>
										<!--페이지 리스트 구현  -->
									</c:if> <c:forEach var="i" begin="1" end="${pagecount}" step="1">
										<c:choose>
											<c:when test="${cpage==i}">
												<font color='red'>[${i}]</font>
											</c:when>
											<c:otherwise>
												<a href="BoardList.missing?cp=${i}&ps=${pagesize}">[${i}]</a>
											</c:otherwise>
										</c:choose>
									</c:forEach> <!--다음 링크 --> <c:if test="${cpage<pagecount}">
										<a href="BoardList.missing?cp=${cpage+1}&ps=${pagesize}">다음</a>
									</c:if>
								</td>
								<%-- <td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;총 게시물
									수 : ${totalcount}</td>
								<td> --%>
								<td>총 게시물 수 : ${totalcount}<br><input type="button" value="실종신고" id="button"
									class="btn btn-lg btn-outline">
								</td>
								<!-- <td>
									<a href="#" class="btn btn-lg btn-outline">
                        				<i class="fa fa-download"></i>
                    				</a>
								</td> -->								
							</tr>
						</table>
                </div>
            </div>
		</div> 
</team01content>


<!-- Footer -->
<footer class="text-center">        
    <div class="footer-below">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    2016 &copy; KOSTA 129th. All Rights Reserved.
                </div>
            </div>
        </div>
    </div>
</footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
<!-- jQuery -->
<script src="../../jquery/team01_jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../../js/team01_bootstrap.js"></script>

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="../../js/team01_jqBootstrapValidation.js"></script>
<script src="../../js/team01_contact_me.js"></script>

<!-- Theme JavaScript -->
<script src="../../js/team01_freelancer.min.js"></script>
</body>

</html>
=======
<%@page import="com.d15.DTO.MemberJoin_DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>실종신고게시판</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">

      $(function(){
         $("#button").click(function(){
            location.href = "BoardWrite.missing";
         });
      });
      function detail(list){
         location.href = "ListDetail.missing?cp=${cpage}&ps=${pagesize}&mis_no="+list;
      };
   </script>
<style>
#wrap03 {
	margin-top: 100px;
	margin-bottom: 40px;
}
</style>

</head>


<!-- 
<style>
.navbar-custom {
	background: #ffffff;
}

.navbar-custom .navbar-nav li a, header {
	color: #3f95ea;
}

header .container {
	padding-top: 10px;
	padding-bottom: 10px;
}

#fh5co-home .text-inner h1, #fh5co-home .text-inner h2, #fh5co-home .text-inner h3
	{
	/* font-size: 50px; */
	color: #3f95ea;
	margin: 0 0 20px 0;
}

#fh5co-home {
	background-color: transparent;
	background-size: cover;
	background-attachment: fixed;
	position: relative;
	width: 100%;
	background-color: #fff;
	color: #fff;
	overflow: hidden;
}
</style>
 -->
<%-- <% 
			pageContext.include("../../include/header.jsp");
		%> --%>
<body>
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
	<div id="wrap03">

		<c:set var="cpage" value="${requestScope.cpage}" />
		<c:set var="pagesize" value="${requestScope.pagesize}" />
		<c:set var="pagecount" value="${requestScope.pagecount}" />
		<c:set var="totalcount" value="${requestScope.totalcount}" />
		<c:set var="list" value="${requestScope.list}" />
		<%
			int i = 1;
			String uploadpath = request.getRealPath("upload");
		%>


		<h1 style="text-align: center">실종신고 게시판</h1>

		<div class="container">
			<div class="row">

				<c:forEach var="list" items="${list}">

					<div class="col-sm-4" style="margin-top: 20px">
						<span>게시물 번호 : ${list.mis_no}</span>

						 <img src="../../upload/${list.p_image}"
							alt="Cinque Terre" width="304" height="236" class="img-rounded">


						<h2>회원 ID : ${list.m_id}</h2>
						<span> 실종 날짜 : ${list.mis_date} <!-- 회원/비회원 처리 -->
						  <c:set
								var="dto" value="${sessionScope.memberdto}" /> 
								<c:if test="${dto.m_id!=null}">
								
								<input type="button" id="detail<%=i++%>" value="상세보기"
									class="btn btn-info" onclick="detail(${list.mis_no})">
							
							</c:if>
							<br> 실종 위치 : ${list.mis_loc}
						</span><br> <span> 내용 : ${list.mis_content} </span>
						<div>
							<c:choose>
								<c:when test="${list.mis_pro == 'N'}">
									<font color="red" size="5">실종</font>
								</c:when>
								<c:otherwise>
									<font color="green" size="5">찾음</font>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

				</c:forEach>

			</div>

		</div>

		<div style="clear: both">
			<table class="table">

				<tr>
					<td colspan="3" align="center">
						<ul class="pagination">
							<c:if test="${cpage>1}">
								<li class="previous"><a
									href="BoardList.missing?cp=${cpage-1}&ps=${pagesize}">이전</a></li>
							</c:if>
							<li><c:forEach var="i" begin="1" end="${pagecount}" step="1">
									<li><a href="BoardList.missing?cp=${i}&ps=${pagesize}">${i}</a></li>
								</c:forEach></li>
							<c:if test="${cpage<pagecount}">
								<li class="next"><a
									href="BoardList.missing?cp=${cpage+1}&ps=${pagesize}">다음</a></li>
							</c:if>
							<c:if test="${dto.m_id!=null}">
								<li>&nbsp;&nbsp; <input type="button" value="실종신고"
									id="button" class="btn btn-danger"></li>
							</c:if>
						</ul>
					</td>
				</tr>
			</table>
		</div>

		<footer>
			<jsp:include page="../../include/footer.jsp" />
		</footer>

	</div>

</body>
</html>
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
