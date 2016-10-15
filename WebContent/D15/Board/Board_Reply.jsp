<!-- 
 * @Class :Board_Reply.jsp
 * @Date : 2016.10.6
 * @Author : 조한솔
 * @Desc : Q&A 게시판에 답변 작성하는 view
 -->

<%@page import="com.d15.DTO.Board_DTO"%>
<%@page import="com.d15.DTO.Member_DTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="board" value="${boarddata}"/>
<c:set var="reply" value="${null}"/>
<c:if test="${reply !=null}">
	<c:set var="reply" value="${requestScope.reply}"/>
</c:if>
<c:set var="Content" value="${board.b_content}"/>


<html>
<head>
	<title>답변 게시판</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	 	
	  <script language="javascript">
		function replyboard(){
			boardform.submit();
		}
		
		$(function(){
			
		 	$('#reg').click(function(){
		 		location.href="javascript:replyboard()";
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
	</style>
</head>
<body>
<!-- 게시판 답변 -->
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>
<section>
	<div class="container">
			<h3>게시판 답변</h3>
			<br/>
			
	<form action="BoardReplyService.Board" method="post" name="boardform" class="form-horizontal">
	<input type="hidden" name="B_NO" value="${board.b_no}">
	<input type="hidden" name="B_REF" value="${board.b_ref}">
	<input type="hidden" name="B_DEPTH" value="${board.b_depth}">
	<input type="hidden" name="B_STEP" value="${board.b_step}">
	
	
	<%-- 	<tr>
			<th>제목</th>
				<th>
					<input name="B_NAME" type="text" size="87" maxlength="100" value="└>[Re]: ${board.b_name}"/>
				</th>
			<th>아이디 들어옴</th>
			<th>${board.b_date}</th>
		</tr> --%>
		
		<div class="form-group">
	   		<label class="control-label col-sm-2" for="title">제목</label>
			   <div class="col-sm-4">
 				<input type="text" name="B_NAME" class="form-control" value="└>[Re]: ${board.b_name}">
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
					<textarea name="B_CONTENT"  class="form-control" rows="10"></textarea>
			    </div>
		</div>	
		
	<!-- 	<tr>
			<td >내용</td>
			<td colspan="4">
				<textarea name="B_CONTENT"  cols="128" rows="15"></textarea>
			</td>
		</tr> -->
	
	
	
	</form>

	<div class="form-group">
		  <div class="col-sm-2"></div>
			<div class="col-sm-4">
			<font size=2>
				<input type="button" id="reg" value="등록" />
				<input type="button" id="back" value="뒤로" />
				</font>
			</div>
		</div>

<br>
<hr>
<h3>원본 게시글</h3>
<c:out value="${fn:replace(Content, '\\r\\n', '<br/>')}"/>
<hr>

</body>
</html>