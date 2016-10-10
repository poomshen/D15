<%-- 
	@JSP : petlist.jsp
	@Date : 2016-10-07
	@Author : 박문수
	@Desc : 실종 신고 게시판의 이미지 목록을 보여주는 jsp 페이지
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
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
	
	
	</head>
	
	<%
		pageContext.include("../../include/header.jsp");
	%>
	<c:set var="cpage" value = "${requestScope.cpage}" />
	<c:set var="pagesize" value = "${requestScope.pagesize}" />
	<c:set var="pagecount" value = "${requestScope.pagecount}" />
	<c:set var="totalcount" value = "${requestScope.totalcount}" />
	<c:set var="list" value="${requestScope.list}" />
	<%
		int i = 1;
		String uploadpath = request.getRealPath("upload");
	%>
	
	<section id="fh5co-work" data-section="work">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">실종신고</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>잃어버린 견공들을 찾습니다.</h3>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row row-bottom-padded-sm">
				<c:forEach var="list" items="${list}">
				
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<div class="fh5co-project-item to-animate">
					
						<a href="../../upload/${list.p_image}" class="image-popup">
							<img src= "../../upload/${list.p_image}" alt="Image" class="img-responsive">
						</a>
						<div class="fh5co-text">
							<span>게시물 번호 : ${list.mis_no} <input type = "button" id = "detail<%=i++%>"  value = "상세보기" class = "btn btn-info"
							style = "position: absolute; right: 10px" onclick ="detail(${list.mis_no})"></span>
							<h2>회원 ID : ${list.m_id}</h2>
							<span>실종 날짜 : ${list.mis_date} <br>
								    실종 위치 : ${list.mis_loc}</span><br>
							<span>내용 : ${list.mis_content}</span>&nbsp;&nbsp;
							<c:choose>
								<c:when test = "${list.mis_pro == 'N'}">
									<font color = "red" style = "position: absolute; right: 10px">실종</font>
								</c:when>
								<c:otherwise>
									<font color = "green" style = "position: absolute; right: 10px">찾음</font>
								</c:otherwise>
							</c:choose> 
						</div>
					</div>
				</div>
				</c:forEach>
				<div class="clearfix visible-sm-block"></div>
				
			</div>
			<div>
			<table align = "center">
			<tr>
					<td colspan="3" align="center">
						<!--이전 링크 --> 
						<c:if test="${cpage>1}">
							<a href="BoardList.missing?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!--페이지 리스트 구현  -->
						</c:if> 
						<c:forEach var="i" begin="1" end="${pagecount}" step="1">
							<c:choose>
								<c:when test="${cpage==i}">
									<font color='red'>[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="BoardList.missing?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<!--다음 링크 --> 
						<c:if test="${cpage<pagecount}">
							<a href="BoardList.missing?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>
					</td>
					<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;총 게시물 수 : ${totalcount}
				
					</td>
					<td>
					<input type = "button" value = "실종신고" id = "button" 
					style = "position: absolute; right: 100px" class = "btn btn-danger">
					</td>
				</tr>
			</table>
			
			</div>
		</div>
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


 
 
