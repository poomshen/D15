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
	<%
		pageContext.include("../../include/head.jsp");
	%>
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