<!-- 
 * @Class : Board_Write.jsp
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에 글 작성 view
 -->


<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>게시판 글쓰기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
	
	$(function(){
		
		$('#submitBtn').click(function(){
			
			if($('#B_NAME').val() == ''){
				alert("제목을 입력하세요");
				$('#B_NAME').focus();
				return false;
			}else{
				alert("성공 ! 서브밋");
				return;
			}
		});
		
	});
	
	</script>
	<style>
		#wrap{
			margin-top : 100px;
			margin-bottom:40px;
		}
	</style>
</head>
<body>

<header>
	<jsp:include page="../../include/header.jsp"></jsp:include>
</header>

<br/><br/>
<div id = "wrap">
<div class="container">
	<h3>글쓰기 게시판</h3>
	<hr/>
	<form action="/TeamProject3_D15/D15/BoardAddService.Board" method="get" 
		enctype="multipart/form-data" name="boardform"  class="form-horizontal">
		
			 <div class="form-group">
	   			 <label class="control-label col-sm-2" for="title">제목</label>
			    <div class="col-sm-4">
			      <input type="text" name="B_NAME" class="form-control" id="title">
			    </div>
			  </div>
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="M_ID">글쓴이</label>
			    <div class="col-sm-4">
			    <c:set var="dto" value="${sessionScope.memberdto}" />
			    <!-- 여기 -->
			      <input type="text" name="M_ID" class="form-control" value="${dto.m_id}" id="M_ID" readonly="readonly">
			    </div>
			  </div>
		
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="email">내용</label>
			    <div class="col-sm-8">
			      <textarea rows="10" name="B_CONTENT" id="email" class="form-control"></textarea></div>
			  </div>
				
			<!-- <div class="form-group">
	   			 <label class="control-label col-sm-2" for="email">파일 선택</label>
			    <div class="col-sm-4">
			      		<input name="B_FILE" type="file" class="form-control"/>
			    </div>
			 </div> -->
		
			<div class="form-group">
	   			<div class="col-sm-2"></div>
			    <div class="col-sm-4">
			      	<input type="submit" class="btn btn-default" id="submitBtn" value="등록">  &nbsp;&nbsp;
			   		<a href="javascript:history.go(-1)" class="btn btn-default">뒤로</a>
			    </div>
			 </div>
		</form>
	</div>	
	</div>
<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>
</body>
</html>