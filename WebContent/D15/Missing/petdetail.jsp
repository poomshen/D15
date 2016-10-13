<%-- 
	@JSP : petlist.jsp
	@Date : 2016-10-07
	@Author : 박문수
	@Desc : 실종 신고 게시판의 상세 정보를 보여 주는 jsp 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="mdto" value="${sessionScope.memberdto}" />

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>살아나개 사랑할개</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
		$(function(){
			$("#nomiss").click(function(){
				var input = "정말 찾으셨습니까?";
				confirm(input);
				location.href = "update.missing?cp=${param.cp}&ps=${param.ps}&mis_no=${param.mis_no}";
			});
			
			$("#list").click(function(){
				location.href = "BoardList.missing?cp=${param.cp}&ps=${param.ps}"
			});
		     
			$("#message_in").click(function() {
				$.post("insertMessage.Message", {"m_id":'${requestScope.dto.m_id}',"mes_content":$("#mes_content").val()}, function(data, textStatus, req) {
					if(data == 1){
						alert("${requestScope.dto.m_id}님에게 메세지 전송 성공");
					}else{
						alert("${requestScope.dto.m_id}님에게 메시지 전송 실패");
						
					}
				})
			})
		});
	</script>
<style>
.navbar-custom {
	background: #ffffff;
}

.navbar-custom .navbar-nav li a, header {
	color: #3f95ea;
}
</style>




</head>

<body>

	<header>
		<jsp:include page="../../include/header.jsp" />
	</header>
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">

				<h2>실종 견 상세 정보</h2>
				<img src="../../upload/${requestScope.dto.p_image}"
					class="img-thumbnail" alt="Cinque Terre">

				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시물 번호</th>
							<th>${requestScope.dto.mis_no}번</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>회원 ID</td>
							<td>
								<div class="dropdown">
									<div class="dropdown-toggle" type="button"
										data-toggle="dropdown">${requestScope.dto.m_id}</div>

									<ul class="dropdown-menu">
										<li><a href="#" data-toggle="modal"
											data-target="#myModal">쪽지 보내기</a></li>




									</ul>
								</div>
							</td>

						</tr>
						<tr>
							<td>견 종</td>
							<td>${requestScope.dto.k_kind}</td>

						</tr>
						<tr>
							<td>성 별</td>
							<td><c:choose>
									<c:when test="${requestScope.dto.p_gender == 'f'}">
								암컷
							</c:when>
									<c:otherwise>
								수컷
						</c:otherwise>
								</c:choose></td>
						</tr>
						<tr>
							<td>특 징</td>
							<td>${requestScope.dto.p_feature}</td>
						</tr>
						<tr>
							<td>나 이</td>
							<td>${requestScope.dto.p_age}살</td>
						</tr>
						<tr>
							<td>체 중</td>
							<td>${requestScope.dto.p_weight}kg</td>
						</tr>
						<tr>
							<td>실종 날짜</td>
							<td>${requestScope.dto.mis_date}</td>
						</tr>
						<tr>
							<td>실종 위치</td>
							<td>${requestScope.dto.mis_loc}</td>
						</tr>
						<tr>
							<td>내 용</td>
							<td>${requestScope.dto.mis_content}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	<input type="button" id="list" value="목록으로"
		class="btn btn-primary center-block">
	<c:choose>
		<c:when test="${mdto.m_id == dto.m_id }">
			<br>
			<div style="text-align: center">
				<span>실종 된 애완견을 찾으셨나요 ?</span> <input type="button" value="찾음"
					id="nomiss" class="btn btn-success">
			</div>
		</c:when>
	</c:choose>
	<br>
	<br>
	<br>
	<footer>
		<jsp:include page="../../include/footer.jsp" />
	</footer>

	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">메세지 보내기</h4>
				</div>
					<div class="modal-body">
						<div style="width: 47%; float: left;">
						<input class="form-control" type="text" value="${requestScope.dto.m_id}" name="m_id" id="m_id" readonly="readonly"> 
						</div>
						<div style="width: 47%; float: right ;">
						<input class="form-control" type="text" value="${sessionScope.memberdto.m_id }" readonly="readonly" name="m_send" id="m_send"> 
						</div>
						<br>
						<textarea style="margin-top: 10%;" class="form-control" rows="5" cols="30" name="mes_content" id="mes_content"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" id="message_in" class="btn btn-default" data-dismiss="modal">보내기</button> 
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>