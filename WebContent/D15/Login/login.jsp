<%--
 * @Class : login.jsp
 * @Date : 2016.10.7
 * @Author : 길한종
 * @Desc : 로그인 폼
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>살아나개 사랑할개</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
#wrap03{
margin-top: 100px;
}
</style>

<script type="text/javascript">
	$(function(){
		$("#button").click(function(){ //회원가입 버튼 클릭시 이벤트
			location.href = "RegisterPer.login";
		});
		
		$("#button2").click(function(){
			location.href = "IdpwSearch.login";
		});
	});
</script>
</head>

<body>
<header>
		<jsp:include page="../../include/header.jsp"/>  	
</header>


<div id="wrap03">	
					
<div style = "text-align:center">				
	<h1>로그인</h1>
	<form action="LoginOk.login" method="post" class="lgform">
		<div class="form-group">
			<label for="m_id">ID 
				<input type="text" class="form-control" 
				name="m_id" id="m_id" placeholder="아이디 입력"></label>
		</div>
		<div class="form-group">
			<label for="m_pwd">비밀번호 
				<input type="password" class="form-control"
				 name="m_pwd" id="m_pwd" placeholder="비밀번호 입력"></label>
		</div>
		<div class="form-group">
			<label><input type="submit" value="로그인" class = "btn btn-default"></label>
			<input type = "button" value ="회원가입" class = "btn btn-default" id = "button">
			<input type = "button" value = "ID/PW 찾기" class = "btn btn-default" id = "button2">
		</div>
	</form>
</div>

<footer>
		<jsp:include page="../../include/footer.jsp"/>  	
</footer>
</div>
</body>
</html>