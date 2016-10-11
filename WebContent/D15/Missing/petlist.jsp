<%-- 
   @JSP : petlist.jsp
   @Date : 2016-10-07
   @Author : 박문수
   @Desc : 실종 신고 게시판의 이미지 목록을 보여주는 jsp 페이지
--%>
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

		<% 
			pageContext.include("../../include/header.jsp");
		%>

   <c:set var="cpage" value = "${requestScope.cpage}" />
   <c:set var="pagesize" value = "${requestScope.pagesize}" />
   <c:set var="pagecount" value = "${requestScope.pagecount}" />
   <c:set var="totalcount" value = "${requestScope.totalcount}" />
   <c:set var="list" value="${requestScope.list}" />
   <%
      int i = 1;
      String uploadpath = request.getRealPath("upload");
   %>

<section id="fh5co-home" data-section="work">
	<div class="container">
		<div class="text-wrap">
			<div class="text-inner">
				
				<div class="row">
					<div class="col-md-8 col-md-offset-2">
						<h1 class="to-animate">실종신고</h1>					
						<h2 class="to-animate">잃어버린 견공들을 찾습니다.</h2>
					</div>
				</div>
			
		<div class="row row-bottom-padded-sm">
			<c:forEach var="list" items="${list}">

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<div class="fh5co-project-item to-animate">

						<a href="../../upload/${list.p_image}" class="image-popup"> <img
							src="../../upload/${list.p_image}" alt="Image"
							class="img-responsive">
						</a>
						<div class="fh5co-text">
							<span>게시물 번호 : ${list.mis_no} <input type="button"
								id="detail<%=i++%>" value="상세보기" class="btn btn-info"
								style="position: absolute; right: 10px"
								onclick="detail(${list.mis_no})"></span>
							<h2>회원 ID : ${list.m_id}</h2>
							<span>실종 날짜 : ${list.mis_date} <br> 실종 위치 :
								${list.mis_loc}
							</span><br> <span>내용 : ${list.mis_content}</span>&nbsp;&nbsp;
							<c:choose>
								<c:when test="${list.mis_pro == 'N'}">
									<font color="red" style="position: absolute; right: 10px">실종</font>
								</c:when>
								<c:otherwise>
									<font color="green" style="position: absolute; right: 10px">찾음</font>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="clearfix visible-sm-block"></div>

		</div>
		<div>
			<table align="center">
				<tr>
					<td colspan="3" align="center">
						<!--이전 링크 --> <c:if test="${cpage>1}">
							<a href="BoardList.missing?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!--페이지 리스트 구현  -->
						</c:if> <c:forEach var="i" begin="1" end="${pagecount}" step="1">
							<c:choose>
								<c:when test="${cpage==i}">
									<font color='red'>[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="BoardList.missing?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <!--다음 링크 --> <c:if test="${cpage<pagecount}">
							<a href="BoardList.missing?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>
					</td>
					<td colspan="2" align="center">&nbsp;&nbsp;&nbsp;&nbsp;총 게시물 수
						: ${totalcount}</td>
					<td><input type="button" value="실종신고" id="button"
						style="position: absolute; right: 100px" class="btn btn-danger">
					</td>
				</tr>
			</table>
</div>
		</div>
		</div>
	</div>
</section>

<%
      pageContext.include("../../include/footer.jsp");
%>
   

   </body>
</html>