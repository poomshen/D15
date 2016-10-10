<%-- 
	@JSP : petlist.jsp
	@Date : 2016-10-07
	@Author : 박문수
	@Desc : 실종 신고 게시판의 상세 정보를 보여 주는 jsp 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "mdto" value = "${sessionScope.memberdto}"/>
   
<!DOCTYPE html>
<html>
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
</head>

<body>
	게시물 번호  : ${requestScope.dto.mis_no}<br>
	<img src = "../../upload/${requestScope.dto.p_image}"><br>
	회원 ID : ${requestScope.dto.m_id}<br>
	견 종 : ${requestScope.dto.k_kind}<br>
	성 별 :<c:choose>
		<c:when test = "${requestScope.dto.p_gender == 'f'}">
			암컷
		</c:when>
		<c:otherwise>
			수컷
		</c:otherwise>
	</c:choose><br>
	특 징 : ${requestScope.dto.p_feature}<br>
	나 이 : ${requestScope.dto.p_age}살<br>
	체 중 : ${requestScope.dto.p_weight}kg<br>
	실종 날짜 : ${requestScope.dto.mis_date}<br>
	실종 위치 : ${requestScope.dto.mis_loc}<br>
	내 용 : ${requestScope.dto.mis_content}<br>
	
	<input type = "button" id = "list" value = "목록으로" class = "btn btn-primary"
	style = "position: absolute; right: 500px">
	<c:choose>
		<c:when test = "${mdto.m_id == dto.m_id }">
		<span style = "position: absolute; right: 200px">실종 된 애완견을 찾으셨나요 ?</span>
			<input type = "button" value = "찾음" id = "nomiss"
			style = "position: absolute; right: 100px" class = "btn btn-success">
		</c:when>
	</c:choose>
</body>
</html>