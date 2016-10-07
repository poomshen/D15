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
	String str = (String)session.getAttribute("m_id");
	if (str!=null){
		str+="님 로그인";
	} else {
		str="";
	}
%>
<%= str %>
<form action="Login.login" method="post">
<input type="submit" value="동작">

</form>
</body>
</html>
