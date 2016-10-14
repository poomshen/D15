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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	<!--로그인 폼-->
	<div class="container text-center">
	
	<form class="form-horizontal" action="LoginOk.login" method="post">		
		
		<div class="row">
		
			<div class="col-sm-4"></div>
		
			<h1>로그인</h1>
			
		</div>
		<br/><br/>
		
	
	
		<div class="row">
		
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">		
			
			
						
					<div class="form-group">
					      <label class="control-label col-sm-4" for="m_id">아이디 :</label>
					      <div class="col-sm-5">
					        <input type="text" class="form-control" name="m_id" id="m_id" placeholder="아이디 입력">
					      </div>
					 </div>
			</div>
		</div>
		<div class="row">	
		
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">	
				
					<div class="form-group">
						<label  class="control-label col-sm-4" for="m_pwd">비밀번호</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" name="m_pwd" id="m_pwd" placeholder="비밀번호 입력">
							</div>	
					</div>
			</div>
		</div>	
		<div class="row">	
		
			<div class="col-sm-2"></div>
			
			<div class="col-sm-8">	
				
					<div class="form-group">
							<div class="row">
							
								<div class="col-sm-4"></div>
								<div class="col-sm-5">
								<input type="submit" value="로그인" class = "btn btn-default">
							
								<input type = "button" value ="회원가입" class = "btn btn-default" id = "button">
							
								<input type = "button" value = "ID/PW 찾기" class = "btn btn-default" id = "button2">
								</div>
								<div class="col-sm-3"></div>
							</div>
						
					</div>
				
				
			
			</div>
			
			</div>
		</div>
	
	</form>
	
</div>
	
	
<footer>
		<jsp:include page="../../include/footer.jsp"/>  	
</footer>
</body>
</html>