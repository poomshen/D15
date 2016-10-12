<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
//String sFilePath = sDownLoadPath + "\\" + filename;
%>

<c:set var="board" value="${boarddto}"/>

<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <title>게시판</title>
</head>

<body>
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>
<section>
	<div class="container">
		<h3>게시글보기</h3>
		<br/>
		<!-- 게시판 수정 -->
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
 				<th>${board.b_name}</th>
				<th>아이디 들어옴</th>
				<th>${board.b_date}</th>
			</tr>
			<tr>
				<td >내용</td>
				<td colspan="4">
					<textarea rows="16" cols="15" class="form-control" readonly="readonly">
						${board.b_content}
					</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
				<c:if test="${requestScope.boarddto.getB_file() != null}">
				<td><a href="FileDown.jsp?file_name=${board.b_file}"></a>
					${board.b_file}
				<td/>
				</c:if>
				
			</tr>
		</table>
		<br/>
		<form action="Reply.Reply?num=${board.b_no}" method="POST" class="form-horizontal">
		
			<table class="table table-bordered">
				<tr>
					<td>댓글</td>
					<td colspan="4">
						<textarea rows="4" cols="15" name="reply" class="form-control">
			   		  	
			   		  	</textarea>
					</td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_no" value="${board.b_no}"/></td>
					<td colspan="4"><input type="submit" class="btn btn-default" value="등록 "/></td>
				
				</tr>
				
			</table>
		
					<a href="BoardReplyView.Board?name=qna&num=${board.b_no}">[답글]</a>
				
					&nbsp;&nbsp; 
					<a href="BoardModify.Board?name=qna&num=${board.b_no}">
					[수정]
					</a>&nbsp;&nbsp;
					<a href="BoardDelete.Board?name=qna&num=${board.b_no}">
					[삭제]
					</a>&nbsp;&nbsp;
					<a href="BoardList.Board?name=qna">[목록]</a>&nbsp;&nbsp;	
		</form>
	</div>
</section>
</body>
</html>