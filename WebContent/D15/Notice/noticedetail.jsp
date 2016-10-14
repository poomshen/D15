<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
//String sFilePath = sDownLoadPath + "\\" + filename;
%>

<c:set var="noticedto" value="${requestScope.noticedto}"/>
<c:set var="nowPage" value = "${requestScope.page}"/>

<html style = "margin-bottom:100px;margin-top:100px">
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
		<h3>공 지 사 항</h3>
		<br/>
		<!-- 게시판 수정 -->
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
 				<th>${noticedto.notice_name}</th>
				<th>관리자</th>
				<th>${noticedto.notice_date}</th>
			</tr>
			<tr>
				<td >내용</td>
				<td colspan="4">
					<textarea rows="16" cols="15" class="form-control" readonly="readonly">${noticedto.notice_content}</textarea>
				</td>
			</tr>
		</table>
		<br/>
		<input type = "button" class = "btn btn-default" value = "수정" id = "update">
		<input type = "button" class = "btn btn-default" value = "삭제" id = "delete">
		<input type = "button" class = "btn btn-default" value = "목록으로" id = "list">

		</div>
		
</section>
<script type="text/javascript">
 	$(function(){
 		$("#update").click(function(){
 			location.href = "NoticeUpdateGo.notice?no=${noticedto.notice_no}&page=${nowPage}";
 		});
 		$("#delete").click(function(){
 			
 			location.href = "noticedelete.jsp?no=${noticedto.notice_no}";
 		});
 		
 		$("#list").click(function(){
 			location.href = "NoticeList.notice?page=${nowPage}";
 		});
 	});
 </script>
<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>
</body>
</html>