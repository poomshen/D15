<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 보낸 쪽지함 </title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
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
	<script type="text/javascript">
		function remove(m_no){
			$.post("", {"m_no":m_no}, function(data, textStatus, req) {
				
			})
		}
	</script>
<body>
	<%
		pageContext.include("../../include/header.jsp");
	%>
	<ul class="nav nav-tabs">
  		<li role="presentation" ><a href="/TeamProject3_D15/D15/Login/Mypage.login">회원정보</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus.login">분양</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus2.login">임시보호</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/myTakeMessagelist.Message">받은 쪽지함</a></li>
  		<li role="presentation" class="active" ><a href="/TeamProject3_D15/D15/Login/myMakeMessagelist.Message">보낸 쪽지함</a></li>
	</ul>
	
<table>
<tr><th>내가 보낸사람</th><th>글내용</th><th>보낸날짜</th><th>읽음여부</th><th>삭제</th></tr>
<c:forEach var="list" items="${messagelist}">
<tr><td>${list.mes_send }</td><td>${list.mes_content }</td><td>${list.mes_date}</td><td>${list.mes_check}</td>
		<td><a href="#" onclick="" class="btn btn-info btn-lg"><span class="glyphicon glyphicon-remove"></span> Remove
        </a></td></tr>
</c:forEach>
</table>

	<footer>
		<jsp:include page="../../include/footer.jsp"></jsp:include>
	</footer>
</body>
</html>