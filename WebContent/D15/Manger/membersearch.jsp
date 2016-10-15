<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style = "margin-bottom : 40px; margin-top:100px">
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
	<script type="text/javascript">
		$(function(){
			$("#searchbtn").click(function(){
				 $.ajax
				 	(
				 			{
				 				type:"post",
								url:"mjson.jsp",
								dataType:"json",
								data:{"search":$("#search").val().trim()},
							
				 				
				 				success:function(data){
				 					$("#member").empty();
				 					
				 					var str = "<table class = 'table table-hover'>";
				 					str += "<tr><th>번호</th><th>ID</th>";
				 					str += "<th>이름</th><th>연락처</th><th>생년월일</th><th>email</th>";
				 					str += "<th>우편주소</th><th>상세주소</th><th>입양경험</th></tr>";
				 					$.each(data,function(index,item){
				 						str += "<tr><td>"+item.m_no+"</td><td>"+item.m_id+"</td><td>"+item.m_name+"</td>";
				 						str += "<td>"+item.m_phone+"</td><td>"+item.m_birth+"</td><td>"+item.m_email+"</td><td>"+item.m_addr+"</td>";
				 						str += "<td>"+item.m_daddr+"</td><td>"+item.m_petok+"</td></tr>";
									});	
				 					str += "</table>";
									$("#member").append(str);	
				 				}
				 			}
					); 
			/* 	$.getJSON("mjson.jsp", {"search":$("#search").val().trim()}, function(data, textStatus, req) {
					$.each(data,function(index,item){
						console.log(item);
					});
					
					$.each(data, function(index, obj){
						
					}
				}) */
			});
		});
	</script>
</head>
<body>
	<header>
		<jsp:include page = "../../include/header.jsp"/>
	</header>
	
	<div class="container">
		<h3>회원 관리</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a href="MemberSearch.Manger">회원 조회</a></li>
			<li><a href="ProtectManger.Manger">임시보호 대기 리스트</a></li>
			<li><a href="ParcelManger.Manger">분양 대기 리스트</a></li>
			<li><a href="myTakeMessagelist.Message">쪽지 리스트</a></li>
			<li><a href="myMakeMessagelist.Message">보낸 리스트</a></li>
		</ul>
		<br><br>
		
		<div class="form-group" style = "width:50%">
		<div class="row">
			<div class="col-sm-4">
				<input type="text" class="form-control" id="search" name = "search">
			</div>
			<div class="col-sm-6">
			<button type="button" class="btn btn-default btn-sm" id = "searchbtn">
				<span class="glyphicon glyphicon-search"></span> Search
			</button>
			</div>
		</div>
		</div>
		<div id="member"></div>
		
		
	</div>
	<footer>
		<jsp:include page = "../../include/footer.jsp"/>
	</footer>
</body>
</html>