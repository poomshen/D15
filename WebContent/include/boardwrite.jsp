<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>신고폼</h3>
<form action="BoardWriteOk.missing">
펫번호: <input type="text" name="p_no"><br>
펫사진: <input type="text" name="p_image"><br>
펫종류: <select name="select">
	<option value="">슨택</option>
	<option value="000054">골든 리트리버</option>
</select><br>
펫성별: <input type="text" name="p_gender"><br>
펫색깔: <input type="text" name="p_color"><br>
펫특징: <input type="text" name="p_feature"><br>
펫나이: <input type="text" name="p_age"><br>
펫무게: <input type="text" name="p_weight"><br>
<input type="submit" value="전송">
</form>
</body>
</html>