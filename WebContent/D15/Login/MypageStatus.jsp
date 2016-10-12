<%--
 * @Class : MypageStatus.jsp
 * @Date : 2016.10.12
 * @Author : 길한종
 * @Desc : 분양 신청정보 보기 view
 --%>

<%@page import="java.util.Date"%>
<%@page import="com.d15.DTO.Parcel_DTO"%>
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
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
	<c:set var="dtolist" value="${requestScope.dtolist}" />
	
	<ul class="nav nav-tabs">
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/Mypage.login">회원정보</a></li>
  		<li role="presentation" class="active"><a href="/TeamProject3_D15/D15/Login/MypageStatus.login">분양</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus2.login">임시보호</a></li>
	</ul>
	
	<div class = "col-sm-2"></div>
	<div class = "col-sm-8">
		<!-- <h1 style = "text-align:center">분양 신청 내역</h1> -->
		<table class="table table-hover">
			<tr>
				<th>분양번호</th>
				<th>회원번호</th>
				<th>유기견번호</th>
				<th>승인신청일</th>
				<th>분양시작일</th>
				<th>승인상태</th>
			</tr>
			<c:forEach var="i" items="${dtolist}">
				<tr>
					<td>${i.pc_no}</td>
					<td>${i.m_no}</td>
					<td>${i.org_no}</td>
					<td>${i.fc_reqdate}</td>
					<td>${i.fc_begdate}</td>
					<c:choose>
						<c:when test = "${i.pc_argdate == null}">
							<td><button type="button" class="btn btn-danger">미승인</button></td>
						</c:when>
						<c:otherwise>
							<td><button type="button" class="btn btn-success">승인</button> ${i.pc_argdate}</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>		
		</table>
	</div>
	<div class = "col-sm-2"></div>
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>
</body>
</html>