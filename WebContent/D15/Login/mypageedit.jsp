<%--
 * @Class : mypageedit.jsp
 * @Date : 2016.10.12
 * @Author : 길한종&박문수
 * @Desc : 회원 정보 수정 폼
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon"  href="/TeamProject3_D15/images/favicon.ico">
	<title>살아갈개 사랑할개</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
		<jsp:include page="../../include/header.jsp"/></header>
	
	<c:set var = "dto" value = "${sessionScope.memberjoindto}"/>
	<h1 style = "text-align:center">회원 정보 수정</h1>
	<br>
	<form action="MyPageEditOk.login" method="post">
		<div class="col-sm-3"></div>
		<div class="col-sm-3">
				
			<div class="form-group" style="width: 250px;">
				<label for="m_id" style="float: left;">회원 ID</label> 
				<input type="text" class="form-control" name="m_id" id="m_id" value = "${dto.m_id}" readonly disabled>
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_pwd" style="float: left;">Password</label> 
				<input type="password" class="form-control" name="m_pwd" id="m_pwd" value = "${dto.m_pwd}">
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_lastdate" style="float: left;">최종 방문일</label> 
				<input type="text" class="form-control" name="m_lastdate" id="m_lastdate"  value = "${dto.m_lastdate}" readonly disabled>
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_name" style="float: left;">이름</label> 
				<input type="text" class="form-control" name="m_name" id="m_name" value = "${dto.m_name}">
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_phone" style="float: left;">연락처</label> 
				<input type="text" class="form-control" name="m_phone" id="m_phone" value = "${dto.m_phone}">
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_email" style="float: left;">Email</label> 
				<input type="text" class="form-control" name="m_email" id="m_email" value = "${dto.m_email}">
			</div>
			</div>
			<div class = "col-sm-3">
			<div class="form-group" style="width: 250px;">
				<label for="m_addr" style="float: left;">우편주소</label> 
				<input type="text" class="form-control" name="m_addr" id="m_addr" value = "${dto.m_addr}">
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_daddr" style="float: left;">상세주소</label> 
				<input type="text" class="form-control" name="m_daddr" id="m_daddr" value = "${dto.m_daddr}">
			</div>
			<div class="form-group" style="width: 250px;">
			<label for="m_petok" style="float: left;">입양 경험 여부</label>
			<select name="m_petok" id="m_petok">
				<option value="N" selected>없음</option>
				<option value="Y">있음</option>
			</select>
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_update" style="float: left;">정보수정일</label> 
				<input type="text" class="form-control" name="m_update" id="m_update" value = "${dto.m_update}" readonly disabled>
			</div>
			<div class="form-group" style="width: 250px;">
				<label for="m_regdate" style="float: left;">회원가입일</label> 
				<input type="text" class="form-control" name="m_regdate" id="m_regdate" value = "${dto.m_regdate}" readonly disabled>
			</div>
			<input type = "submit" value = "수정하기" class = "btn btn-default">
		</div>
		<div class="col-sm-3"></div>
		
	</form>
<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>

</body>
</html>