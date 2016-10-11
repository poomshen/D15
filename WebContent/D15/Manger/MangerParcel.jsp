<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>분양 대기자 리스트</title>
</head>
<body>

 <c:set var="list" value="${requestScope.parcellist}" />
 <div class="container">
  <h3>Tabs With Dropdown Menu</h3>
  <ul class="nav nav-tabs">
    <li class="active"><a href="StartManger.Manger">Home</a></li>
    <li><a href="ProtectManger.Manger">임시보호 대기 리스트</a></li>
    <li><a href="ParcelManger.Manger">분양 대기 리스트</a></li>
  </ul>
 <div>
 	<table>
  <tr>
    <th>동물이미지</th><th>아이디</th><th>이름</th><th>핸드폰</th><th>이메일</th><th>주소</th><th>분양경험</th><th>신청날짜</th><th>희망날짜</th><th>동물 품종</th><th>유기견 성별</th><th>조회수</th><th>남은 날짜</th>
    <th>승낙</th>
  </tr>
 <c:forEach var="list" items="${list}">
  <tr>
    <td><img alt="" src="${list.img }" style="width: 200px; height: 100px;"></td><td>${list.id}</td><td>${list.name }</td><td>${list.phone }</td><td>${list.email }</td>
    <td>${list.addr }</td><td>${list.petOk }</td><td>${list.reqdate }</td><td>${list.begdate }</td>
    <td>${list.code }</td><td>${list.gender }</td><td>${list.count }</td><td>${list.date }</td><td><input type="button" value="거절"><input type="button" value="승낙"></td>
  </tr>
 </c:forEach>
</table>

</div>
 </div>
 <br><br><br>
</body>
</html>