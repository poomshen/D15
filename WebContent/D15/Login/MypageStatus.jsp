<%--
 * @Class : MypageStatus.jsp
 * @Date : 2016.10.12
 * @Author : 길한종
 * @Desc : 분양/임시보호 신청정보 보기 view
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
	<c:set var="parceldto" value="${requestScope.parceldto}" />
	
	<div class = "col-sm-2"></div>
	<div class = "col-sm-6">
		<h1 style = "text-align:center">임시보호/분양 신청 내역</h1>
		<table class="table table-hover">
			<tr>
				<th>분양번호</th>
				<th>회원번호</th>
				<th>유기견번호</th>
				<th>승인신청일</th>
				<th>분양시작일</th>
				<th>승인상태</th>
			</tr>
			<tr>
				<td>${parceldto.pc_no}</td>
				<td>${parceldto.m_no}</td>
				<td>${parceldto.org_no}</td>
				<td>${parceldto.fc_reqdate}</td>
				<td>${parceldto.fc_begdate}</td>
				<c:choose>
					<c:when test = "${parceldto.pc_argdate == null}">
						<td><button type="button" class="btn btn-danger">미승인</button></td>
					</c:when>
					<c:otherwise>
						<td><button type="button" class="btn btn-success">승인</button> ${parceldto.pc_argdate}</td>
					</c:otherwise>
				</c:choose>
			</tr>	
		</table>
	</div>
	<div class = "col-sm-2"></div>
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>
</body>
</html>