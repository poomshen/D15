<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript">
	function login(){
		location.href = "Login.login";
	}
	function join(){
		location.href = "RegisterPer.login";
	}
	$(function(){
		$("#button1").click(function(){
			
			$.ajax({
				type:"post",
				url:"id.jsp",
				dataType:"html",
				data:{"phone":$("#phone").val().trim() , "birth":$("#birth").val().trim()},
				success:function(data){
					if(data.trim() != 'null'){
						$("#idarea").empty();
						$("#idarea").append("<br><br><br><font size = '3'>회원님의 ID는 " 
							+ data + " 입니다.</font><br><br><br><br><br>"
							+ "<input type = 'button' onclick = 'login()' value = '로그인하기' class = 'btn btn-default'>");
					}else{
						$("#idarea").empty();
						$("#idarea").append("<br><br><br><font size = '3'>입력된 정보로 가입된 ID가 없습니다. " 
							+ "</font><br><br><br><br><br>"
							+ "<input type = 'button' onclick = 'join()' value = '회원가입' class = 'btn btn-default'>");
					}
				}
				
			});
		});
		
		$("#button2").click(function(){
			$.ajax({
				type:"post",
				url:"pw.jsp",
				dataType:"html",
				data:{"id":$("#id").val().trim() , "phone":$("#phone2").val().trim()},
				success:function(data){
					if(data.trim() != 'null'){
						$("#pwarea").empty();
						$("#pwarea").append("<br><br><br><font size = '3'>회원님의 임시 비밀번호는 " 
							+ data + " 입니다.</font><br><br><br><br><br>"
							+ "<input type = 'button' onclick = 'login()' value = '로그인하기' class = 'btn btn-default'>");
					}else{
						$("#pwarea").empty();
						$("#pwarea").append("<br><br><br><font size = '3'>입력된 정보로 가입된 ID가 없습니다. " 
							+ "</font><br><br><br><br><br>"
							+ "<input type = 'button' onclick = 'join()' value = '회원가입' class = 'btn btn-default'>");
					}
				}
					
			});
			
		});
		
		
		
	});

</script>
</head>
<body>
	<header>
		<jsp:include page = "../../include/header.jsp"/>
	</header>
	<div class = "col-sm-3"></div>
	<div class = "col-sm-3" id = "idarea">
		<br><br>
		<h3>ID를 잊어버리셨나요?</h3><br><br>
		
		<div class ="form-group">
			<label for = "birth">생년월일 입력</label>
			<input type = "text" name = "birth" id = "birth" placeholder = "생년월일 입력" class="form-control">
		</div>
		<div class= "form-group">
			<label for = "phone">연락처 입력</label>
			<input type = "text" name = "phone" id = "phone" placeholder = "연락처 입력" class="form-control">
		</div>
		<input type = "button" id =  "button1" class = "btn btn-default" value = "ID 찾기">
	</div>
	<div class = "col-sm-3" id = "pwarea">
	<br><br>
		<h3>비밀번호를 잊어버리셨나요?</h3><br><br>
		<div class ="form-group">
			<label for = "id">ID 입력</label>
			<input type = "text" name = "id" id = "id" placeholder = "ID 입력" class="form-control">
		</div>
		<div class= "form-group">
			<label for = "phone2">연락처 입력</label>
			<input type = "text" name = "phone2" id = "phone2" placeholder = "연락처 입력" class="form-control">
		</div>
		<input type = "button" id =  "button2" class = "btn btn-default" value = "비밀번호 찾기">
	</div>
	<div class = "col-sm-3"></div>
	
	
	<footer>
		<jsp:include page = "../../include/footer.jsp"/>
	</footer>
</body>
</html>