<%--
 * @Class : login.jsp
 * @Date : 2016.10.7
 * @Author : 길한종, 김지율 css 수정중
 * @Desc : 로그인 폼
 --%>
<%@page import="com.d15.DTO.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>로그인</title>
    
 	<!-- Bootstrap Core CSS [지율주석] 실제사용할것-->
    <link href="../../css/team01_bootstrap_core.css" rel="stylesheet">
           
    <!-- Theme CSS [지율주석] 실제사용할것 -->
    <link href="../../css/team01_theme.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
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

<team01content>
	<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h2>로그인</h2>
						<p>들어가십쇼...<p>
						<hr class="star-light">
					</div>
					<div class="col-md-8 col-md-offset-2">
						<form action="LoginOk.login" method="post" class="lgform">							
								<div class="form-group">
									<label for="m_id">ID</label>
									<input
										type="text" name="m_id" id="m_id"
										placeholder="아이디 입력" class="form-control">
									<br>																
									<label for="m_pwd">비밀번호</label>
									<input
										type="password" name="m_pwd" id="m_pwd"
										placeholder="비밀번호 입력" class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" value="로그인" class="btn btn-lg btn-outline">
=======
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>살아나개 사랑할개</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#wrap03{
margin-top: 100px;
}
</style>

<script type="text/javascript">
	$(function(){
		$("#button").click(function(){ //회원가입 버튼 클릭시 이벤트
			location.href = "RegisterPer.login";
		});
		
		$("#button2").click(function(){
			location.href = "IdpwSearch.login";
		});
	});
</script>
</head>

<body>
<header>
		<jsp:include page="../../include/header.jsp"/>  	
</header>

	<div id="wrap03">

	<!--로그인 폼-->
	<div class="container text-center">
	
	<form class="form-horizontal" action="LoginOk.login" method="post">		
		
		<div class="row">
		
			<div class="col-sm-4"></div>
		
			<h1>로그인</h1>
			
		</div>
		<br/><br/>
		
	
	
		<div class="row">
		
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">		
			
			
						
					<div class="form-group">
					      <label class="control-label col-sm-4" for="m_id">아이디 :</label>
					      <div class="col-sm-5">
					        <input type="text" class="form-control" name="m_id" id="m_id" placeholder="아이디 입력">
					      </div>
					 </div>
			</div>
		</div>
		<div class="row">	
		
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">	
				
					<div class="form-group">
						<label  class="control-label col-sm-4" for="m_pwd">비밀번호</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="m_pwd" id="m_pwd" placeholder="비밀번호 입력">
							</div>	
					</div>
			</div>
		</div>	
		<div class="row">	
		
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">	
				
					<div class="form-group">
							<div class="row">
							
								<div class="col-sm-4"></div>
								<div class="col-sm-5">
								<input type="submit" value="로그인" class = "btn btn-default">
							
								<input type = "button" value ="회원가입" class = "btn btn-default" id = "button">
							
								<input type = "button" value = "ID/PW 찾기" class = "btn btn-default" id = "button2">
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
								</div>
								<div class="col-sm-3"></div>
							</div>
						
					</div>
				
				
			
			</div>
			
			</div>
<<<<<<< HEAD

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

<script>
	$(function() {
		//fadeinout();
		$('#colour-variations ul').styleSwitcher({
			defaultThemeId : 'theme-switch',
			hasPreview : false,
			cookie : {
				expires : 30,
				isManagingLoad : true
			}
		});
		$('.option-toggle').click(function() {
			$('#colour-variations').toggleClass('sleep');
		});
	});
</script>


=======
		</div>
	
	</form>
	
</div>
	
	
<footer>
		<jsp:include page="../../include/footer.jsp"/>  	
</footer>
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
</body>
</html>