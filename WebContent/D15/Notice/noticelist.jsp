<%@page import="com.d15.DTO.Board_DTO"%>
<%@page import="com.d15.DTO.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<html style = "margin-top:100px;margin-bottom:40px">
<head>
<title>공지사항</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-2.2.4.min.js" 
		  integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" 
		  crossorigin="anonymous">
  </script>
    <style type="text/css">
	table {
		width: 750px;
	}
	</style>
	 <script type="text/javascript">
	 $(function(){
	 	$('#writeBtn').click(function(){
	 		location.href="/TeamProject3_D15/D15/Notice/noticewrite.jsp";
	 	});
	 	
	 });
	 </script>
	 		 
	<c:set var="noticelist" value="${requestScope.noticelist}"/>
	<c:set var="listCount" value="${requestScope.listCount}"/>
	<c:set var="nowPage" value="${requestScope.page}"/>
	<c:set var="maxPage" value="${requestScope.maxPage}"/>
	<c:set var="startPage" value="${requestScope.startPage}"/>
	<c:set var="endPage" value="${requestScope.endPage}"/>
	<c:set var="memberdto" value = "${sessionScope.memberdto}"/>
	 
</head>

<body>

<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br>
<!-- selectbox 게시판 메뉴-->


<div class="container">
	<h3>공 지 사 항</h3>
	
<table class="table table-hover">
<!-- 게시판 목록 -->

<c:choose>
	<c:when test="${listCount>0}">

	<tr class="info text-left">
		<th>
			<div align="center">번호</div>
		</th>
		<th>
			<div align="center">제목</div>
		</th>
		<th>
			<div align="center">작성자</div>
		</th>
		<th>
			<div align="center">날짜</div>
		</th>
		<th>
			<div align="center">조회수</div>
		</th> 
	</tr>
	
	<c:forEach var="i" items="${noticelist}">
	<c:set var="nt" value="${i}"> </c:set>
	
	<tr class="text-center">
		<td>
			${nt.notice_no}
		</td>
		
		<td class="text-left">
			<a href="/TeamProject3_D15/D15/Notice/NoticeDetail.notice?no=${nt.notice_no}&page=${nowPage}">
				${nt.notice_name}
			</a>
		</td>
		<td>관리자</td>
	 	<td>${nt.notice_date}</td>
		<td>${nt.notice_count}</td>
	</tr>
	</c:forEach>

	</c:when>

	<c:otherwise>
		<tr align="center" valign="middle">
			<td colspan="4">게시판 목록</td>
			<td align=right>
				<font size=2>등록된 글이 없습니다.</font>
			</td>
		</tr>
	</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test = "${memberdto.m_id == 'admin'}">
			<tr align="right">
				<td colspan="5">
	   				<input type="button" id="writeBtn" class="btn btn-default" value="공지사항 등록">
				</td>
			</tr>
		</c:when>
		<c:otherwise>
		</c:otherwise>
	</c:choose>
</table>
	<div class="container text-center">

		<ul class="pagination">	
		<c:if test="${nowPage>=2}">
    	  <li class="previous"><a href="/TeamProject3_D15/D15/Notice/NoticeList.notice?page=${nowPage-1}">이전</a></li> 
		</c:if>
		  <li>
		  <c:forEach var="a" begin="${startPage}" end="${endPage}">
		  	<li><a href="/TeamProject3_D15/D15/Notice/NoticeList.notice?page=${a}">${a}</a></li>  
		  </c:forEach>	
		  </li>
		 <c:if test="${nowPage<maxPage}">
		  <li class="next"><a href="/TeamProject3_D15/D15/Notice/NoticeList.notice?page=${nowPage+1}">다음</a></li>		  
		</c:if>
		</ul>
	</div>
</div>
</body>
</html>