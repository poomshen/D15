<%@page import="com.d15.DTO.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str="";
	Member_DTO memberdto = (Member_DTO)session.getAttribute("memberdto");
	if (memberdto!=null){
		str+=memberdto.getM_id()+"님 로그인 ";
		out.print(str);
		out.print("<input type='button' value='로그아웃'>");
	} else {
		out.print("<form action='RegisterPer.login' method='post'>");
		out.print("<input type='submit' value='로그인'>");
		out.print("</form>");
	}
%>

<!-- <form action="RegisterPer.login" method="post">
<input type="submit" value="로그인">
</form> -->

</body>
</html>
