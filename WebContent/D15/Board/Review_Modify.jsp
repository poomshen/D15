<!-- 
 * @Class : Review_Modify.jsp
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기 게시판에서 글 수정기능을 위한 view
 -->

<%@page import="com.d15.DTO.Review_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="review" value="${reviewdata}"/>

<html>
<head>
<link rel="shortcut icon"  href="/TeamProject3_D15/images/favicon.ico">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<body>
	<!-- 게시판 수정 -->
	
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>
<section>
	<div class="container">
		<h3>게시판 수정</h3>
		<br/>
		
	<form action="ReviewModifyService.Review" method="post" name="modifyform"
		  class="form-horizontal">
	<input type="hidden" name="BR_NO" value="${review.br_no}"/>

			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="title">제목</label>
			    <div class="col-sm-4">
 					<input type="text" name="BR_NAME" class="form-control" value="${review.br_name}">
			    </div>
			</div>
			
			<div class="form-group">
	   			<label class="control-label col-sm-2" for="M_ID">글쓴이</label>
			    <div class="col-sm-4">
			      <input type="text" name="M_ID" class="form-control" value="테스트글쓴이" id="M_ID" readonly="readonly">
			    </div>
			</div>
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="content">내용</label>
			    <div class="col-sm-8">
					<textarea name="BR_CONTENT"  class="form-control" rows="10">${review.br_content}</textarea>
			    </div>
			</div>
			
			<%-- <div class="form-group">
				<c:if test="${review.br_file!=null}">
	   				<label class="control-label col-sm-2" for="fselec">파일 첨부</label>
			    	<div class="col-sm-4">
			      	
						<td>
							&nbsp;&nbsp;${review.br_file}
						</td>					
					
			   	 	</div>
			    </c:if>
			 </div> --%>
		</form>
	
		<div class="form-group">
		  <div class="col-sm-2"></div>
			<div class="col-sm-4">
				<input type="button" id="modi" value="수정" />
				<input type="button" id="back" value="뒤로" />
			</div>
		</div>
	
	
	
</body>
</html>