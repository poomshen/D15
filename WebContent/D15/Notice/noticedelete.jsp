<%-- <%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="no" value="${param.no}"/>

<html>
<head>
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
<body>
<header>
	<jsp:include page = "../../include/header.jsp"/>
</header>											
						
<form name="deleteForm" action="NoticeDelete.notice?no=${no}" 
	method="post">
<h3>공지사항 삭제</h3>
<div class="panel panel-default">
  <div class="panel-body">
  		
  </div>
</div>

<table border=1>

<tr>
	<td colspan=2 align=center>
		<a href="javascript:deleteForm.submit()">삭제</a>
		&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">돌아가기</a>
	</td>
</tr>
</table>
</form>

<footer>
	<jsp:include page = "../../include/footer.jsp" />
</footer>
</body>
</html> --%>