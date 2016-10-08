<%-- 
	@JSP : petlist.jsp
	@Date : 2016-10-07
	@Author : 박문수
	@Desc : 실종 신고 게시판의 상세 정보를 보여 주는 jsp 페이지
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	
</body>
</html>