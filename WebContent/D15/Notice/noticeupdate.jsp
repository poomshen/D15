<%@page import="com.d15.DTO.Notice_DTO"%>
<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%
	Notice_DTO noticedto = (Notice_DTO)request.getAttribute("noticedto");
	String Page = request.getParameter("page");
%>

<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon"  href="/TeamProject3_D15/images/favicon.ico">
	<title>게시판 수정</title>
	<script type="text/javascript">
	function notice(){
		$("#notice").submit();
	}
	$(function(){
		$("#btn").click(function() {
			history.go(-1);
		});
		$("#sub").click(function(){
			alert("수정 완료");
		});
	});
	</script>
</head>
<style>
	#wrap{
		margin-top:120px;
		margin-bottom:40px;
	}
</style>
<body>
<!-- 게시판 수정 -->
<header>
	<jsp:include page = "../../include/header.jsp"/>
</header>
<div id = "wrap">
<form action="NoticeUpdate.notice?page=<%=Page%>" method="post" name="notice">
<input type="hidden" name="notice_no" value=<%=noticedto.getNotice_no() %>>

			<h3 style = "text-align:center">게시글 수정</h3>
			<div class = "col-sm-4"></div>
			<div class = "col-sm-4">
			
			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="notice_name">제목</label>
			    <div>
			      <input type="text" name="notice_name" class="form-control" id="notice_name" value = "<%=noticedto.getNotice_name()%>" style = "width:100%">
			    </div>
			 </div>

			<div class="form-group">
	   			 <label class="control-label col-sm-2" for="notice_content">내용</label>
			    <div>
			      <textarea name="notice_content" class="form-control" id="notice_name" rows = "5" cols = "10"><%=noticedto.getNotice_content()%></textarea>
			    </div>
			 </div>
			<font size=2>
			<input type = "submit" value = "수정" class = "btn btn-default" id = "sub">
			<input type = "button" value = "뒤로" class = "btn btn-default" id = "btn">
			</font>
			</div>
			<div class = "col-sm-4"></div>
</form>
</div>
<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>
<!-- 게시판 수정 -->
</body>
</html>