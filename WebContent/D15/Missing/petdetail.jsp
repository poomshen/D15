<%-- 
	@JSP : petlist.jsp
	@Date : 2016-10-11 미완료
	@Author : 박문수, 김지율
	@Desc : 실종 신고 게시판의 상세 정보를 보여 주는 jsp 페이지, css 수정
--%>
<%@page import="com.d15.DTO.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>실종신고게시판 상세보기</title>

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
<link href="../../vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#nomiss").click(function(){
			location.href = "update.missing?cp=${param.cp}&ps=${param.ps}&mis_no=${param.mis_no}";
		});
		
		$("#list").click(function(){
			location.href = "BoardList.missing?cp=${param.cp}&ps=${param.ps}"
		});
	});
</script>

<body id="page-top" class="index">

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<!-- <a class="navbar-brand" href="#page-top">Start Bootstrap</a> -->
				<a class="navbar-brand" href="/TeamProject3_D15/index.jsp"><img
					style="margin-top: -20px" src="/TeamProject3_D15/images/logo.gif"></a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden"><a href="#page-top">Home</a></li>
					<li class="page-scroll"><a href="#about">소개</a></li>
					<!-- [지율주석] 공지사항~게시판 추가 시작 -->
					<li class="page-scroll"><a href="#notice">공지사항</a></li>
					<li class="page-scroll"><a href="#cur_situ">현황</a></li>
					<li class="page-scroll"><a
						href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.keyurl">분양/임시보호</a>
						<!-- <a href="#parcelout">분양/임시보호</a> --></li>
					<li class="page-scroll"><a
						href="/TeamProject3_D15/D15/Missing/BoardList.missing">실종</a> <!-- <a href="#cur_situ">실종</a> -->
					</li>
					<li class="page-scroll"><a href="#board">게시판</a></li>
					<!-- [지율주석] 공지사항~게시판 추가 끝 -->
					<!-- [지율주석] 버튼 스타일 먹이기 도전 시작 -->
					<!-- <li class="page-scroll">
                    <a><input type="button" value="로그인"></a>
                </li>
                <li class="page-scroll">
                    <a><input type="button" value="회원가입" id="reg"></a>
                </li>
                [지율주석] 버튼 스타일 먹이기 도전 끝  -->
					<li class=""><a> <%
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
					</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<c:set var="mdto" value="${sessionScope.memberdto}" />

	<team01content>
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>실종신고 상세</h2>
				<hr class="star-light">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<div class="form-group">
					<label>게시물 번호 :</label>${requestScope.dto.mis_no}<br> <img
						src="../../upload/${requestScope.dto.p_image}"> <label>회원
						ID : ${requestScope.dto.m_id}</label><br> <label>견 종 :
						${requestScope.dto.k_kind}</label><br> <label>성 별 : <c:choose>
							<c:when test="${requestScope.dto.p_gender == 'f'}">암컷</c:when>
							<c:otherwise>수컷	</c:otherwise>
						</c:choose></label><br> <label>특 징 : ${requestScope.dto.p_feature}</label><br>
					<label>나 이 : ${requestScope.dto.p_age}살</label><br> <label>체
						중 : ${requestScope.dto.p_weight}kg</label><br> <label>실종 날짜 :
						${requestScope.dto.mis_date}</label><br> <label>실종 위치 :
						${requestScope.dto.mis_loc}</label><br> <label>내 용 :
						${requestScope.dto.mis_content}</label><br> <input type="button"
						id="list" value="목록으로" class="btn btn-lg btn-outline">
					<c:choose>
						<c:when test="${mdto.m_id == dto.m_id }">
							<span>실종 된 애완견을 찾으셨나요?</span>
							<input type="button" id="nomiss" value="찾음"
								class="btn btn-lg btn-outline">
							<!-- <input type="button" value="찾음" id="nomiss"
								style="position: absolute; right: 100px" class="btn btn-success"> -->
						</c:when>
					</c:choose>
					<br>
				</div>
			</div>
		</div>
	</div>
	</team01content>
	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">2016 &copy; KOSTA 129th. All Rights
						Reserved.</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div
		class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>

	<!-- jQuery -->
	<script src="../../jquery/team01_jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../../js/team01_bootstrap.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="../../js/team01_jqBootstrapValidation.js"></script>
	<script src="../../js/team01_contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="../../js/team01_freelancer.js"></script>
</body>

</html>
