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
<html>
	<head>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>살아나개 사랑할개</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$("#button1").click(function(){
				location.href = "MypageUpdate.login";
			});
		});
	</script>
   
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
	<body>
	<%
		pageContext.include("../../include/header.jsp");
	%>
	
	<ul class="nav nav-tabs">
  		<li role="presentation" class="active"><a href="/TeamProject3_D15/D15/Login/Mypage.login">회원정보</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus.login">분양</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus2.login">임시보호</a></li>
	</ul>
	
	<c:set var = "memberdto" value = "${sessionScope.memberdto}"/>
	
	<c:choose>
		<c:when test="${memberdto.m_id == 'admin' }">
	
		<script type="text/javascript">
			 location.href = "/TeamProject3_D15/D15/Manger/MemberSearch.Manger"; 
		</script>
					
		</c:when>
	<c:otherwise>
		<div class = "col-sm-3"></div>				
		<div class = "col-sm-6">
			<c:set var="dto" value="${sessionScope.memberjoindto}" />
			<%-- <h1 style = "text-align:center">${dto.m_id}님의 정보</h1> --%>
			<table class="table table-hover">
				<tr><td>ID </td><td>${dto.m_id}</td></tr>
		        <tr><td>최종방문일  </td><td>${dto.m_lastdate}</td></tr>
				<tr><td>이름 </td><td>${dto.m_name}</td></tr>
				<tr><td>연락처 </td><td>${dto.m_phone}</td></tr>
				<tr><td>생년월일 </td><td>${dto.m_birth}</td></tr>
				<tr><td>Email </td><td>${dto.m_email}</td></tr> 
				<tr><td>우편주소 </td><td>${dto.m_addr}</td></tr>
				<tr><td>상세주소 </td><td>${dto.m_daddr}</td></tr>
				<tr><td>입양경험 </td><td>
				
	<%
	 	MemberJoin_DTO dto = (MemberJoin_DTO)session.getAttribute("memberjoindto");
		String petok = dto.getM_petok().trim();
	%>
		 	<%
					if(petok.equals("N")){
				%>
				없음
				<%}else{ %>
				있음
				<%} %>
				</td></tr>
				
				<tr><td>정보수정일 </td><td>${dto.m_update}</td></tr>
				<tr><td>회원가입일 </td><td>${dto.m_regdate}</td></tr>
			</table>
			<div style = "text-align : center">
			<input type = "button" id = "button1" value = "수정하기" class = "btn btn-default">
			</div>
		</div>
		<div class = "col-sm-3"></div>	
			
	</c:otherwise>
</c:choose>

	<footer>
		<jsp:include page="../../include/footer.jsp"></jsp:include>
	</footer>
	</body>
</html>