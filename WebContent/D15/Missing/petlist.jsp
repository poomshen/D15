<%-- 
   @JSP : petlist.jsp
   @Date : 2016-10-07
   @Author : 박문수
   @Desc : 실종 신고 게시판의 이미지 목록을 보여주는 jsp 페이지
--%>
<%@page import="com.d15.DTO.Member_DTO"%>
<%@page import="com.d15.DTO.MemberJoin_DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>실종신고게시판</title>
   <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <script type="text/javascript">
      $(function(){
         $("#button").click(function(){
            location.href = "BoardWrite.missing";
         });
      });
      function detail(list){
         location.href = "ListDetail.missing?cp=${cpage}&ps=${pagesize}&mis_no="+list;
      };
   </script>
	
</head>  
   
<style>
   .navbar-custom{
       background: #ffffff;
   }
   
   .navbar-custom .navbar-nav li a, header {
    color: #3f95ea;
   }
   
   header .container {
  padding-top: 10px;
  padding-bottom: 10px;
}

#fh5co-home .text-inner h1, #fh5co-home .text-inner h2, #fh5co-home .text-inner h3{
    /* font-size: 50px; */
    color: #3f95ea;
    margin: 0 0 20px 0;
}

#fh5co-home {
    background-color: transparent;
    background-size: cover;
    background-attachment: fixed;
    position: relative;
    width: 100%;
    background-color: #fff;
    color: #fff;
    overflow: hidden;
}  
</style> 

		<%-- <% 
			pageContext.include("../../include/header.jsp");
		%> --%>
<body>
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>

   <c:set var="cpage" value = "${requestScope.cpage}" />
   <c:set var="pagesize" value = "${requestScope.pagesize}" />
   <c:set var="pagecount" value = "${requestScope.pagecount}" />
   <c:set var="totalcount" value = "${requestScope.totalcount}" />
   <c:set var="list" value="${requestScope.list}" />
   <%
      int i = 1;
      String uploadpath = request.getRealPath("upload");
   %>


	<h1 style = "text-align:center">실종신고 게시판</h1>
	<c:forEach var="list" items="${list}">
		
		<div class = "col-sm-4">
		<span>게시물 번호 : ${list.mis_no}</span><br>
		<a href="../../upload/${list.p_image}" class="image-popup"> 
			<img src="../../upload/${list.p_image}" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
			
		</a>
		
		
		<h2>회원 ID : ${list.m_id}</h2>
		<span>
		실종 날짜 : ${list.mis_date} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<!-- 회원/비회원 처리 -->
		<c:set var="dto" value="${sessionScope.memberdto}" />
		<c:if test="${dto.m_id!=null}">
			<input type="button" id="detail<%=i++%>" value="상세보기" class="btn btn-info"
					onclick="detail(${list.mis_no})">
		</c:if>
		<!-- 회원/비회원 처리 -->
		
		<br> 
		실종 위치 :	${list.mis_loc}
		</span>
		<br> 
		<span>
		내용 : ${list.mis_content}
		</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:choose>
				<c:when test="${list.mis_pro == 'N'}">
					<font color="red">실종</font>
				</c:when>
				<c:otherwise>
					<font color="green">찾음</font>
				</c:otherwise>
			</c:choose>
			<br>
		</div>
	</c:forEach>

	<div style = "clear:both">
		<table align="center">
			<tr>
				<td colspan="3" align="center">
				<!--이전 링크 --> 
				<c:if test="${cpage>1}">
					<a href="BoardList.missing?cp=${cpage-1}&ps=${pagesize}">이전</a>
					<!--페이지 리스트 구현  -->
				</c:if> 
				<c:forEach var="i" begin="1" end="${pagecount}" step="1">
					<c:choose>
						<c:when test="${cpage==i}">
							<font color='red'>[${i}]</font>
						</c:when>
						<c:otherwise>
							<a href="BoardList.missing?cp=${i}&ps=${pagesize}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach> 
				<!--다음 링크 --> 
				<c:if test="${cpage<pagecount}">
					<a href="BoardList.missing?cp=${cpage+1}&ps=${pagesize}">다음</a>
				</c:if>
					&nbsp;&nbsp; <input type="button" value="실종신고" id="button"
						 class="btn btn-danger">
				</td>
				
			</tr>
		</table>
			<div>
			<%-- 총 게시물 수 : ${totalcount} <input type="button" value="실종신고" id="button"
						 class="btn btn-danger center-block"> --%>
			</div>	
					
					
				
	</div>

<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>

   

   </body>
</html>