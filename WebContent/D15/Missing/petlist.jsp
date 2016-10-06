<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<c:set var="list" value="${requestScope.list}" />
<table border="1">
<c:forEach var="list" items="${list}">
	<!-- 회원아이디, 실종날짜, 실종위치, 내용, 펫이미지, 게시물번호, 상태 출력 -->
	<tr><td>${list.m_id}</td><td>${list.mis_date}</td>
		<td>${list.mis_loc}</td><td>${list.mis_content}</td>
		<td>${list.p_image}</td><td>${list.mis_no}</td>
		<td>${list.mis_pro}</td></tr>
</c:forEach>
</table>




<!-- 

<!DOCTYPE html>
<html class="no-js">
	<head>
	<%
		pageContext.include("include/head.jsp");
	%>
	</head>
	<body>
	<%
		pageContext.include("include/header.jsp");
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
				
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<div class="fh5co-project-item to-animate">
						<a href="http://cfile4.uf.tistory.com/image/264A1334556EC4570F6828" class="image-popup">
							<img src="http://www.jobnjoy.com/files/editor/1467714364062_1.png" alt="Image" class="img-responsive">
						</a>
						<div class="fh5co-text">
							<h2>견공1</h2>
							<span>잘생김</span>
						</div>
					</div>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="images/work_3.jpg" class="fh5co-project-item image-popup to-animate">
						<img src="http://cfile4.uf.tistory.com/image/264A1334556EC4570F6828" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>Project 3</h2>
						<span>Web</span>
						</div>
					</a>
				</div>
								
				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="images/work_5.jpg" class="fh5co-project-item image-popup to-animate">
						<img src="images/work_5.jpg" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>Project 1</h2>
						<span>Photography</span>
						</div>
					</a>
				</div>
							
			</div>
			<div class="row">
				<div class="col-md-12 text-center to-animate">
					<p>* Demo images from <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
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

	<!-- Main JS (Do not remove) -->
	<script src="js/main.js"></script>

	</body>
</html>

 -->
 
 
 
</body>
</html>