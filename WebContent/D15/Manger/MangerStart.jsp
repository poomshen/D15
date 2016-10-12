<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<header>
	<jsp:include page = "../../include/header.jsp" />
</header>
<div class="container">
  <h3>회원 관리</h3>
  <ul class="nav nav-tabs">
    <li class="active"><a href="MemberSearch.Manger">회원 조회</a></li>
    <li><a href="ProtectManger.Manger">임시보호 대기 리스트</a></li>
    <li><a href="ParcelManger.Manger">분양 대기 리스트</a></li>
  </ul>
</div>


<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>
</body>
</html>