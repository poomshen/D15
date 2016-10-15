<!-- 
 * @Class : loginfail.jsp
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : 로그인 실패시 띄워지는 view
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert('로그인 실패!');
		location.href = "Login.login";
	});
</script>
</head>
<body>

</body>
</html>