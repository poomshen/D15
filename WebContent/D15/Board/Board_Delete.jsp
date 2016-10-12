<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<c:set var="num" value="${num}"/>

<html>
<head>
<title>게시판</title>
</head>
<body>
																		
<form name="deleteForm" action="BoardDeleteService.Board?name=qna&num=${num}" 
	method="post">
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
</body>
</html>