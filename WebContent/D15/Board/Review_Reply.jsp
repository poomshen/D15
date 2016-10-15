<%@page import="com.d15.DTO.Review_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:set var="review" value="${reviewdto}" />
<c:set var="reply" value="${null}" />
<c:if test="${reply!=null}">
	<c:set var="reply" value="${reply}" />
</c:if>
<c:set var="Content" value="br_content" />
<c:set var="dto" value="${sessionScope.memberdto}"></c:set>

<html>
<head>
<title>답변 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
	function replyboard() {
		boardform.submit();
	}

	$(function() {

		$('#reg').click(function() {
			location.href = "javascript:replyboard()";
		});

		$('#back').click(function() {
			location.href = "javascript:history.go(-1)";
		});

	});
</script>
<style>
#wrap {
	margin-top: 100px;
	margin-bottom: 80px;
}
</style>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<body>
	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
	<br />
	<br />
	<section id="wrap">
		<div class="container">
			<h3>게시판 답변</h3>
			<br />

			<form action="ReviewReply_Service.Review" method="post"
				name="boardform" class="form-horizontal">
				<input type="hidden" name="BR_NO" value="${review.br_no}"> <input
					type="hidden" name="BR_REF" value="${review.br_ref}"> <input
					type="hidden" name="BR_DEPTH" value="${review.br_depth}"> <input
					type="hidden" name="BR_STEP" value="${review.br_step}">



				<div class="form-group">
					<label class="control-label col-sm-2" for="title">제목</label>
					<div class="col-sm-4">
						<input type="text" name="BR_NAME" class="form-control"
							value="└>[Re]: ${review.br_name}">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="M_ID">글쓴이</label>
					<div class="col-sm-4">
						<input type="text" name="M_ID" class="form-control"
							value="${review.m_id}" id="M_ID" readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-sm-2" for="content">내용</label>
					<div class="col-sm-8">
						<textarea name="BR_CONTENT" class="form-control" rows="10"></textarea>
					</div>
				</div>



				<div class="form-group">
					<div class="col-sm-2"></div>
					<div class="col-sm-4">
						<font size=2> <input type="button" id="reg" value="등록"
							class="btn btn-default" /> <input type="button" id="back"
							value="뒤로" class="btn btn-default" />
						</font>
					</div>
				</div>

			</form>
		</div>
	</section>
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>
</body>
</html>