<%-- 
	@JSP : petlist.jsp
	@Date : 2016-10-07
	@Author : 박문수
	@Desc : 실종 신고 게시판의 상세 정보를 보여 주는 jsp 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "mdto" value = "${sessionScope.memberdto}"/>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#nomiss").click(function(){
				location.href = "update.missing?cp=${param.cp}&ps=${param.ps}&mis_no=${param.mis_no}";
			});
			
			$("#list").click(function(){
				location.href = "BoardList.missing?cp=${param.cp}&ps=${param.ps}"
			});
		});
	</script>
</head>
<%
		pageContext.include("../../include/head.jsp");
%>
<body>
	게시물 번호  : ${requestScope.dto.mis_no}<br>
	<img src = "../../upload/${requestScope.dto.p_image}"><br>
	회원 ID : ${requestScope.dto.m_id}<br>
	견 종 : ${requestScope.dto.k_kind}<br>
	성 별 :<c:choose>
		<c:when test = "${requestScope.dto.p_gender == 'f'}">
			암컷
		</c:when>
		<c:otherwise>
			수컷
		</c:otherwise>
	</c:choose><br>
	특 징 : ${requestScope.dto.p_feature}<br>
	나 이 : ${requestScope.dto.p_age}살<br>
	체 중 : ${requestScope.dto.p_weight}kg<br>
	실종 날짜 : ${requestScope.dto.mis_date}<br>
	실종 위치 : ${requestScope.dto.mis_loc}<br>
	내 용 : ${requestScope.dto.mis_content}<br>
	
	<input type = "button" id = "list" value = "목록으로" class = "btn btn-primary"
	style = "position: absolute; right: 500px">
	<c:choose>
		<c:when test = "${mdto.m_id == dto.m_id }">
		<span style = "position: absolute; right: 200px">실종 된 애완견을 찾으셨나요 ?</span>
			<input type = "button" value = "찾음" id = "nomiss"
			style = "position: absolute; right: 100px" class = "btn btn-success">
		</c:when>
	</c:choose>
</body>
</html>