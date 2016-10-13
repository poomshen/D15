<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insertMassage.Message" method="post">
	<input type="text" value="보낼사람" name="m_id" id="m_id" readonly="readonly" >
	<input type="text" value="나" readonly="readonly" name="m_send" id="m_send">
	<br>
	<textarea rows="10" cols="40" name="mes_content" id="mes_content"></textarea>
	<br>
	<input type="submit" value="보내기"><input type="button" value="취소">
</form>
</body>
</html>