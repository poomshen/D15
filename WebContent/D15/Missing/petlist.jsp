<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<c:set var="list" value="${requestScope.list}" />
<table border="1">
<c:forEach var="list" items="${list}">
	<!-- 회원아이디, 실종날짜, 실종위치, 내용, 펫이미지, 게시물번호, 상태 출력 -->
	<tr><td>${list.m_id}</td><td>${list.mis_date}</td>
		<td>${list.mis_loc}</td><td>${list.mis_content}</td>
		<td>${list.p_image}</td><td>${list.mis_no}</td>
		<td>${list.mis_pro}</td></tr>
</c:forEach>
</table>

</body>
</html>