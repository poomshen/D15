<!-- 
 * @Class : Board_Lisst.jsp
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 글 목록보기 위한 view
 -->

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<html>
<head>
<title>후기 게시판</title>
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
	 	$('#smenu').change(function(){
	 		var url=$('#smenu').val();
	 		console.log(url);
	 		location.href=url;
	 	});
	 	
	 	$('#writeBtn').click(function(){
	 		location.href="/TeamProject3_D15/D15/BoardWrite.Board?name=qna";
	 	});
	 	
	 	$('#wBtn').click(function(){
	 		location.href="/TeamProject3_D15/D15/ReviewWrite.Review";
	 	});
	 	
	 });
	 </script>

		
	
	<c:set var="reviewList" value="${requestScope.reviewList}"/>
	<c:set var="listCount" value="${requestScope.listCount}"/>
	<c:set var="nowPage" value="${requestScope.noPage}"/>	<!-- 현재페이지 -->
	<c:set var="maxPage" value="${requestScope.maxPage}"/>  <!-- 페이지 마지막 번호  -->
	<c:set var="startPage" value="${requestScope.startPage}"/>
	<c:set var="endPage" value="${requestScope.endPage}"/>
		

</head>


<body>

<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br>
<!-- selectbox 게시판 메뉴-->

<div class="container">
	<div class="form-group">
		<div class="col-sm-4">
			<select id="smenu" class="form-control">
				<option value="" >선택</option>
				<option value="/TeamProject3_D15/D15/BoardList.Board?name=qna" >Q&A게시판</option>
				<option value="/TeamProject3_D15/D15/ReviewList.Review?name=review" >후기게시판</option>
			</select>
		</div>
	</div>
<br/><br/>
	
	<table class="table table-hover">
	<!-- 게시판 목록 -->

<c:choose>
	<c:when test="${listCount>0}">

	<tr class="info text-left">
	<%-- 
		
		<tr align="center" valign="middle">
			<td colspan="4">게시판 목록</td>
			<td align=right><font size=2>글 개수 : ${listCount}</font></td>
		</tr> --%>
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


	 <c:forEach var="i" items="${reviewList}">
	 <c:set var="rd" value="${i}"> </c:set><br>

	
	 <tr class="text-center">
		<td>
			${rd.br_no}
		</td>


		<td class="text-left">
		<c:choose>
			<c:when test="${rd.br_depth!=0}">
				<c:forEach var="a" begin="0" end="${rd.br_depth*2}">
					&nbsp;
				</c:forEach>
			</c:when>
			<c:otherwise></c:otherwise>
		</c:choose>
			<a href="/TeamProject3_D15/D15/ReviewDetail.Review?name=review&num=${rd.br_no}">
				${rd.br_name}
			</a>
		</td>
	
		<td>작성자</td>
	 	<td>${rd.br_date}</td>
		<td>${rd.br_count}</td>
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

	<tr align="right">
		<td colspan="5">
			<input type="button" id="wBtn" class="btn btn-default" value="글쓰기"/>
		</td>
	</tr>
	</table>
		<div class="container text-center">

		<ul class="pagination">	
		<c:if test="${nowPage>=2}">
    	  <li class="previous"><a href="/TeamProject3_D15/D15/ReviewList.Review?name=review&page=${nowPage-1}">이전</a></li> 
		</c:if>
		  <li>
		  <c:forEach var="a" begin="${startPage}" end="${endPage}">
		  	<li><a href="/TeamProject3_D15/D15/ReviewList.Review?name=review&page=${a}">${a}</a></li>  
		  </c:forEach>	
		  </li>
		 <c:if test="${nowPage<maxPage}">
		  <li class="next"><a href="/TeamProject3_D15/D15/ReviewList.Review?name=Review&page=${nowPage+1}">다음</a></li>		  
		</c:if>
		</ul>
	</div>
</div>
</body>
</html>