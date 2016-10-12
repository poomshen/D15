<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<c:set var="reviewList" value="${requestScope.reviewList}"/>
<c:set var="listCount" value="${requestScope.listCount}"/>
<c:set var="nowPage" value="${requestScope.noPage}"/>	<!-- 현재페이지 -->
<c:set var="maxPage" value="${requestScope.maxPage}"/>  <!-- 페이지 마지막 번호  -->
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 750px;
}

table, th, tr, td {
	border: 1px solid blue;
	border-collapse: collapse;
}
</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-2.2.4.min.js" 
		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" 
		crossorigin="anonymous">
</script>
<script type="text/javascript">
	 $(function(){
	 	$('#smenu').change(function(){
	 		var url=$('#smenu').val();
	 		console.log(url);
	 		location.href=url;
	 	});
	 });
</script>

<!-- selectbox 게시판 메뉴-->
<select id="smenu">
	<option value="" >선택</option>
	<option value="/TeamProject3_D15/D15/BoardList.Board?name=qna" >Q&A게시판</option>
	<option value="/TeamProject3_D15/D15/ReviewList.Review?name=review" >후기게시판</option>
</select>

	<table>
	<c:choose>
	<c:when test="${listCount>0}">

		<tr align="center" valign="middle">
			<td colspan="4">게시판 목록</td>
			<td align=right><font size=2>글 개수 : ${listCount}</font></td>
		</tr>

		<tr align="center" valign="middle" bordercolor="#333333">
			<td style="font-family: Tahoma; font-size: 8pt;" width="8%"
				height="26">
				<div align="center">번호</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="50%">
				<div align="center">제목</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
				<div align="center">작성자</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="17%">
				<div align="center">날짜</div>
			</td>
			<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
				<div align="center">조회수</div>
			</td>
		</tr>
		
		 <c:forEach var="i" items="${reviewList}">
		 <c:set var="rd" value="${i}"> </c:set><br>
		 
		 <tr align="center" valign="middle" bordercolor="#333333"
			onmouseover="this.style.backgroundColor='F8F8F8'"
			onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			${rd.br_no}
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
				
			<c:choose>
				<c:when test="${rd.br_depth!=0}">
					<c:forEach var="a" begin="0" end="${rd.br_depth*2}">
						&nbsp;
					</c:forEach>⚫
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>
			
			<a href="/TeamProject3_D15/D15/ReviewDetail.Review?name=review&num=${rd.br_no}">
				${rd.br_name}
			</a>
			</div>
		</td>
		<td>작성자</td>	<!-- memberid로-->
		<%--<td style="font-family:Tahoma;font-size:10pt;">
				<div align="center"><%= md.getM_id() %></div>
			</td>  --%>
		
	 	<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${rd.br_date}</div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center">${rd.br_count}</div>
		</td>
	</tr>
	</c:forEach>

	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>	
			<c:choose>
				<c:when test="${nowPage<=1}">[이전]${&nbsp}</c:when>
				<c:otherwise>
					<a href="/TeamProject3_D15/D15/ReviewList.Review?name=review&page=${nowPage-1}">[이전]</a>&nbsp;	
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="a" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${a==nowPage}">[${a}]</c:when>
					<c:otherwise>
						<a href="/TeamProject3_D15/D15/ReviewList.Review?name=review&page=${a}">[${a}]</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
	
			<c:choose>
					<c:when test="%{nowPage>=maxPage}">[다음]</c:when>
					<c:otherwise>
						<a href="/TeamProject3_D15/D15/ReviewList.Review?name=review&page=${nowPage+1}">[다음]</a>&nbsp;	
					</c:otherwise>
			</c:choose> 
		</td>
	</tr> 
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
	   		<a href="/TeamProject3_D15/D15/ReviewWrite.Review">[글쓰기]</a>
		</td>
	</tr>
	</table>
</body>
</html>