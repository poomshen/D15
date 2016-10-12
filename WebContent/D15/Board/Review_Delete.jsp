<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="num" vlaue="${num}"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글 삭제</title>
</head>
<body>
	
	<form name="deleteForm" action="ReviewDeleteService.Review?name=reivew&num=${num}" method="post">
	
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