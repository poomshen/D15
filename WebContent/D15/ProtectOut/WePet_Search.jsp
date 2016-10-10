<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기동물 정보를 조회 jsp 로 데이터 검색하기 조건 </title>
</head>
<body>
<form action="abandonmentPublic.keyurl" method="post">
<table style="width: 600">
<tr>
<td>시작 날짜:</td>
<td><input type="text" name="bgnde" value="20161001"><br></td><!--켈렌더 로 바꾸고  -->
</tr>
<tr>
<td>끝 날짜:</td>
<td><input type="text" name="endde" value="20161010"><br>
</td></tr>
<tr>
<td>축종코드:</td>
<td><input type="text" name="upkind" value="417000"><br></td><!-- select 해서 값을 받고 싶은데.. -->
</tr>
<tr>
<td>품종코드:</td>
<td><input type="text" name="kind"><br></td>
</tr>
<tr>
<td>시도코드:</td>
<td><input type="text" name="upr_cd"><br></td>
</tr>
<tr>
<td>시군구코드:</td>
<td><input type="text" name="org_cd"><br></td>
</tr>
<tr>
<td>보호소번호:</td>
<td><input type="text" name="care_reg_no"><br></td>
</tr>
<tr>
<td>상태:</td>
<td><input type="text" name="state"><br></td>
</tr>
<tr>
<td>페이지 번호:</td>
<td><input type="text" name="pageNo" value="1"><br></td>
</tr>
<tr>
<td>페이지당 보여줄 개수:</td>
<td><input type="text" name="numOfRows" value="10"><br></td>
</tr>
</table>
<input type="submit" value="버튼">
</form>
</body>
</html>