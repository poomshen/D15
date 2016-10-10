<%--
 * @Class : mypage.jsp
 * @Date : 2016.10.8
 * @Author : 길한종
 * @Desc : 회원정보 보기 폼
 --%>


<%@page import="com.d15.DTO.MemberJoin_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		form > input {
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
							<h1 class="to-animate">회원 정보</h1>
							<h2 class="to-animate">내가 바로...!</h2>
						</div>
					</div>
					<div>
						<c:set var="dto" value="${requestScope.memberjoindto}" />
						ID: ${dto.m_id}<br>
						최종방문일: ${dto.m_lastdate}<br>
						이름: ${dto.m_name}<br>
						연락처: ${dto.m_phone}<br>
						생년월일: ${dto.m_birth}<br>
						Email: ${dto.m_email}<br>
						거주정보: ${dto.m_addr}<br>
						입양경험: ${dto.m_petok}<br>
						정보수정일: ${dto.m_update}<br>
						회원가입일: ${dto.m_regdate}
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
		});
	</script>
	<!-- End demo purposes only -->

	</body>
</html>