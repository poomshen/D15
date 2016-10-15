<!-- 
 * @Class : Board_Delete.jsp
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글 삭제기능을 위한 view
 -->

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