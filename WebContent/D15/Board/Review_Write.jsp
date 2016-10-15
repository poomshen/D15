<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html>
<head>
<title>게시판 글쓰기</title>	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	
	$(function(){
		
		$('#submitBtn').click(function(){
			
			if($('#BR_NAME').val() == ''){
				alert("제목을 입력하세요");
				$('#BR_NAME').focus();
				return false;
				
			}else{
				alert("성공!");
				return;
			}
		});
		
		
		
	});
	
   </script>
</head>
<body>


<header>
	<jsp:include page="../../include/header.jsp"></jsp:include>
</header>

<br/><br/>
<div class="container">
	<h3>글쓰기 게시판</h3>
	<hr/>
	<form action="/TeamProject3_D15/D15/ReviewAddService.Review" method="get" 
		enctype="multipart/form-data" name="reviewform"  class="form-horizontal">
		
			 <div class="form-group">
	   			 <label class="control-label col-sm-2" for="title">제목</label>
			    <div class="col-sm-4">
			      <input type="text" name="BR_NAME" class="form-control" id="title">
			    </div>
			  </div>
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="M_ID">글쓴이</label>
			    <div class="col-sm-4">
			    <c:set var="dto" value="${sessionScope.memberdto}"></c:set>
			      <input type="text" name="M_ID" class="form-control" value="${dto.m_id}" id="M_ID" readonly="readonly">
			    </div>
			  </div>
		
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="content">내용</label>
			    <div class="col-sm-8">
			      <textarea rows="10" name="BR_CONTENT" id="content" class="form-control"></textarea>
			    </div>
			  </div>
				
			<!-- <div class="form-group">
	   			 <label class="control-label col-sm-2" for="fselec">파일 선택</label>
			    <div class="col-sm-4">
			      		<input name="BR_FILE" type="file" class="form-control"/>
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
</body>
</html>