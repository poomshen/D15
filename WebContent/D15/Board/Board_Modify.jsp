<!-- 
 * @Class : Board_Modify.jsp
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글 수정기능을 위한 view
 -->

<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="board" value="${boarddata}"></c:set>

<html>
<head>
   <title>게시판 수정</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	 <script type="text/javascript">
	 
		function modifyboard(){
			modifyform.submit();
		}
			
		$(function(){
			
		 	$('#modi').click(function(){
		 		location.href="javascript:modifyboard()";
		 	});
		 	
		 	$('#back').click(function(){
		 		location.href="javascript:history.go(-1)";
		 	});
		 	
		});
		
	 </script>
	 
	 <style type="text/css">
		table {
			width: 750px;
		}
		#wrap{
			margin-top:100px;
			margin-bottom:60px;
		}
	 </style>
</head>

<body>

<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>
<section id = "wrap">
	<div class="container">
		<h3>게시판 수정</h3>
		<br/>
		
		<form action="BoardModifyService.Board" method="post" name="modifyform" class="form-horizontal">
		<input type="hidden" name="B_NO" value="${board.b_no}">
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="title">제목</label>
			    <div class="col-sm-4">
 					<input type="text" name="B_NAME" class="form-control" value="${board.b_name}">
			    </div>
			</div>
			
			<div class="form-group">
	   			<label class="control-label col-sm-2" for="M_ID">글쓴이</label>
			    <div class="col-sm-4">
			      <input type="text" name="M_ID" class="form-control" value="${sessionScope.memberdto.m_id}" id="M_ID" readonly="readonly">
			    </div>
			</div>
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="content">내용</label>
			    <div class="col-sm-8">
					<textarea name="B_CONTENT"  class="form-control" rows="10">${board.b_content}</textarea>
			    </div>
			</div>
			
			<%-- <div class="form-group">
				<c:if test="${board.b_file!=null}">
	   				<label class="control-label col-sm-2" for="fselec">파일 첨부</label>
			    	<div class="col-sm-4">
			      	
						<td>
							&nbsp;&nbsp;${board.b_file}
						</td>					
					
			   	 	</div>
			    </c:if>
			 </div> --%>
		</form>

	<div class="form-group">
		  <div class="col-sm-2"></div>
			<div class="col-sm-4">
				<input type="button" id="modi" value="수정" class = "btn btn-default"/>
				<input type="button" id="back" value="뒤로" class = "btn btn-default"/>
			</div>
	</div>
</div>	
		
<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>	
</body>
</html>