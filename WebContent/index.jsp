<%@page import="com.d15.DTO.Member_DTO"%>
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
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,600,400italic,700'
	rel='stylesheet' type='text/css'>

<!-- Animate.css -->
<link rel="stylesheet"
	href="http://kosta129.esy.es/elate/css/animate.css">
<!-- Icomoon Icon Fonts -->
<link rel="stylesheet"
	href="http://kosta129.esy.es/elate/css/icomoon.css">
<!-- Simple Line Icons -->
<link rel="stylesheet"
	href="http://kosta129.esy.es/elate/css/simple-line-icons.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="http://kosta129.esy.es/elate/css/magnific-popup.css">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://kosta129.esy.es/elate/css/bootstrap.css">

<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/style.css">
<link rel="stylesheet" id="theme-switch"
	href="http://kosta129.esy.es/elate/css/style.css">
<link rel="stylesheet" href="http://kosta129.esy.es/elate/css/demo.css">

<!-- Modernizr JS -->
<script src="http://kosta129.esy.es/elate/js/modernizr-2.6.2.min.js"></script>

<!-- 10월 5일 지율 추가 시작  -->
<!-- Bootstrap Core CSS -->
<link href="boot2/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="boot2/css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="boot2/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">
</head>

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

#fh5co-home .text-inner h1, #fh5co-home .text-inner h2, #fh5co-home .text-inner h3,
	#fh5co-home .text-inner h2 a {
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
</head>
<% 
	pageContext.include("include/header.jsp");
%>


<section id="fh5co-home" data-stellar-background-ratio="0.5">
	<div class="container">
		<div class="text-wrap">
			<div class="text-inner">
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="to-animate">입양하세요. 사랑하세요.</h1>
						<h2 class="to-animate">
							집에가고시ㅍ다 <a
								href="http://freehtml5.co/" target="_blank"
								title="Free HTML5 Bootstrap Templates">술먹고시ㅠ프다</a>ㅋ.ㅋ졸령
							헤헤 <a href="http://creativecommons.org/licenses/by/3.0/"
								target="_blank">우리뮤 귀여웡♥.♥</a>
						</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%
	pageContext.include("include/footer.jsp");
%>

<%
   	pageContext.include("include/script.jsp");
   %>



</body>
</html>