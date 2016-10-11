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
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <style>
   .navbar-custom{
       background: #ffffff;
   }
   
   .navbar-custom .navbar-nav li a, header {
    color: #3f95ea;
   
   </style>   
 
	
	<style>
		form > input {
			color: black;
		}
	</style>
	</head>
	
	<%
		pageContext.include("../../include/header.jsp");
	%>
	<c:set var = "memberdto" value = "${sessionScope.memberdto}"/>
	
	<c:choose>
	<c:when test="${memberdto.m_id == 'admin' }">
			
		<h1 class="to-animate">관리자 페이지</h1>
		<h2 class="to-animate">내가 관리자다</h2>
					
		</c:when>
	<c:otherwise>
	
		<h1 class="to-animate">회원 정보</h1>
		<h2 class="to-animate">내가 바로...!</h2>
						
		<div>
			<c:set var="dto" value="${requestScope.memberjoindto}" />
			ID: ${dto.m_id}<br>
		         최종방문일: ${dto.m_lastdate}<br> 
			이름: ${dto.m_name}<br>
			연락처: ${dto.m_phone}<br>
			생년월일: ${dto.m_birth}<br> 
			Email: ${dto.m_email}<br> 
			우편주소: ${dto.m_addr}<br>
			상세주소: ${dto.m_daddr}<br>
			입양경험: ${dto.m_petok}<br>
			정보수정일: ${dto.m_update}<br>
			회원가입일: ${dto.m_regdate}<br>
		</div>
				
			
	</c:otherwise>
</c:choose>

	<%
		pageContext.include("../../include/footer.jsp");
	%>
	</body>
</html>