<%--
 * @Class : register_per.jsp
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 회원가입 폼
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>살아나개 사랑할개</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700' rel='stylesheet' type='text/css'>
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/icomoon.css">
	<!-- Simple Line Icons -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/simple-line-icons.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/bootstrap.css">

	<!-- 
	Default Theme Style 
	You can change the style.css (default color purple) to one of these styles
	
	1. pink.css
	2. blue.css
	3. turquoise.css
	4. orange.css
	5. lightblue.css
	6. brown.css
	7. green.css

	-->
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/style.css">
	<link rel="stylesheet" id="theme-switch" href="http://kosta129.esy.es/elate/css/style.css">
	<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/demo.css"><!-- 없는듯 -->

	<!-- Modernizr JS -->
	<script src="http://kosta129.esy.es/elate/js/modernizr-2.6.2.min.js"></script><!-- 없는듯 -->
	
	 <!-- 10월 5일 지율 추가 시작  -->
   <!-- Bootstrap Core CSS -->
    <link href="boot2/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="boot2/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="boot2/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
   
   
   <style>
   .navbar-custom{
       background: #ffffff;
   }
   
   .navbar-custom .navbar-nav li a, header {
    color: #3f95ea;
   
   </style>   
   <!-- 10.05 지율 추가  끝 -->
	
	
	<style>
		form > input, option, select {
			color: black;
		}
	</style>
	</head>
	
	<%
		pageContext.include("../../include/header.jsp");
	%>
	
	<section id="fh5co-home" data-section="home" style="background-image: url(images/full_image_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate">회원 가입</h1>
							<h2 class="to-animate">좀 도와주십쇼</h2>
						</div>
					</div>
					<div>
						가입 유형 <input name="radio" id="p" type="radio" value="person">개인 <input name="radio" id="g" type="radio" value="group">보호소<br>
					</div>
					
					<div id="person">
						<form action="RegisterPerOk.login" method="post">
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							아이디 <input type="text" name="m_id"><br>
							패스워드 <input type="password" name="m_pwd" id="m_pwd"><br>
							패스워드 다시 입력 <input type="password" id="re_pwd"><br><!-- js로 유효성 검사 해야됨 -->
							<!-- 최종방문일 <input type="text" name="m_lastdate"><br> 자동입력 -->	
							<!-- 권한코드 <input type="text" name="c_code"><br> 자동입력 -->
							<!-- 회원번호 <input type="text" name="m_no"><br> 자동 입력 -->
							이름 <input type="text" name="m_name"><br>
							연락처 <input type="text" name="m_phone"><br>
							생년월일 <input type="text" name="m_birth"><br>
							Email <input type="text" name="m_email"><br>
							거주정보 <input type="text" name="m_addr"><br>
							입양 경험 여부 <select name="m_petok">
								<option value="N">없음</option>
								<option value="Y">있음</option>
							</select>
							<!-- 파일 업로드 <input type="text" name="m_birth"><br> 개인은 필요없음-->
							<!-- 정보수정일 update 실행시에 자동 입력 -->
							<!-- 회원가입일 insert 실행시에 자동 입력 -->
							<input type="submit" value="가입하기">
						</form>
					</div>
					
					<div id="group">
						<form action="RegisterGrpOk.login" method="post">
							<!-- 보호소번호 자동입력-->
							보호소명 <input type="text" name="st_name"><br>
							전화번호 <input type="text" name="st_phone"><br>
							위치 <input type="text" name="st_loc"><br>
							담당자명 <input type="text" name="st_mgr"><br>
							담당자 연락처 <input type="text" name="mgrphone"><br>
							<input type="submit" value="가입하기">
						</form>
					</div>	
						
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>
	
	
	
	
	<%
		pageContext.include("../../include/footer.jsp");
	%>
	
	
	<%
		pageContext.include("../../include/script.jsp");
	%>
	
	<script>
		$(function(){
			//fadeinout();
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
			
			$('#group').hide();
			$('#person').hide();
			
			//회원가입 유형선택
			$('#p').click(function(){
				$('#group').hide();
				$('#person').show();
			});
			$('#g').click(function(){
				$('#person').hide();
				$('#group').show();
			});
		});
	</script>
	

	</body>
</html>