<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	function isfalse(ck) {
		location.href = "ProtectMangerCK.Manger?is=false&ck=" + ck
	}

	function istrue(ck) {
		location.href = "ProtectMangerCK.Manger?is=true&ck=" + ck
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
	<c:set var="list" value="${requestScope.protectlist}" />
	<div class="container">
		<h3>회원 관리</h3>
		<ul class="nav nav-tabs">
			<li><a href="MemberSearch.Manger">회원 조회</a></li>
			<li class="active"><a href="ProtectManger.Manger">임시보호 대기 리스트</a></li>
			<li><a href="ParcelManger.Manger">분양 대기 리스트</a></li>
		</ul>
		<div>
			<table class="table table-hover">
				<tr>
					<th>동물이미지</th>
					<th>아이디</th>
					
					<th>핸드폰</th>
					<th>이메일</th>
				
					<th width ="80">분양경험</th>
					<th width ="80">신청날짜</th>
					<th width ="80">희망날짜</th>
					<th width ="80">종료날짜</th>
					<th width ="80">견종</th>
					<th width ="80">성별</th>
					<th width ="80">조회수</th>
					<th>남은 날짜</th>
					<th>신청</th>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td><img alt="" src="${list.img }"
							style="width: 200px; height: 100px;" class="img-thumbnail"></td>
						<td>${list.id}</td>
					
						<td>${list.phone }</td>
						<td>${list.email }</td>
					
						<td>${list.petOk }</td>
						<td>${list.reqdate }</td>
						<td>${list.begdate }</td>
						<td>${list.enddate }</td>
						<td>${list.code }</td>
						<td>${list.gender }</td>
						<td>${list.count }</td>
						<td>${list.date }</td>
						<td><input type="button" value="승인"
							onclick="istrue(${list.pr_no})" class="btn btn-success"><input
							type="button" value="거절" onclick="isfalse(${list.pr_no})"
							class="btn btn-danger"></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br>
	<br>
	<br>
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>
</body>
</html>