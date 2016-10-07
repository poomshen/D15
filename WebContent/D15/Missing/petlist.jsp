<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
	<head>
	<%
		pageContext.include("../../include/head.jsp");
	%>
	</head>
	<body>
	<%
		pageContext.include("../../include/header.jsp");
	%>
	<c:set var="cpage" value = "${requestScope.cpage}" />
	<c:set var="pagesize" value = "${requestScope.pagesize}" />
	<c:set var="pagecount" value = "${requestScope.pagecount}" />
	<c:set var="totalcount" value = "${requestScope.totalcount}" />
	<c:set var="list" value="${requestScope.list}" />
	
	<section id="fh5co-work" data-section="work">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">실종신고</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>잃어버린 견공들을 찾습니다.</h3>
						</div>
					</div>
				</div>
			</div>
			
			<div class="row row-bottom-padded-sm">
				<c:forEach var="list" items="${list}">
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<div class="fh5co-project-item to-animate">
					
					
						<a href="http://cfile4.uf.tistory.com/image/264A1334556EC4570F6828" class="image-popup">
							<img src="${list.p_image}" alt="Image" class="img-responsive">
						</a>
						<div class="fh5co-text">
							<span>게시물 번호 : ${list.mis_no} </span>
							<h2>회원 ID : ${list.m_id}</h2>
							<span>실종 날짜 : ${list.mis_date} &nbsp;&nbsp;실종 위치 : ${list.mis_loc}</span><br>
							<span>내용 : ${list.mis_content}</span>&nbsp;&nbsp;
							<c:choose>
								<c:when test = "${list.mis_pro == 'N'}">
									<font color = "red">실종</font>
								</c:when>
								<c:otherwise>
									<font color = "green">찾음</font>
								</c:otherwise>
							</c:choose> 
						</div>
					</div>
				</div>
				</c:forEach>
				<div class="clearfix visible-sm-block"></div>
				
			</div>
			<div>
			<table>
			<tr>
					<td colspan="3" align="center">
						<!--이전 링크 --> 
						<c:if test="${cpage>1}">
							<a href="D15/Missing/BoardList.missing?cp=${cpage-1}&ps=${pagesize}">이전</a>
							<!--페이지 리스트 구현  -->
						</c:if> 
						<c:forEach var="i" begin="1" end="${pagecount}" step="1">
							<c:choose>
								<c:when test="${cpage==i}">
									<font color='red'>[${i}]</font>
								</c:when>
								<c:otherwise>
									<a href="D15/Missing/BoardList.missing?cp=${i}&ps=${pagesize}">[${i}]</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
						<!--다음 링크 --> 
						<c:if test="${cpage<pagecount}">
							<a href="D15/Missing/BoardList.missing?cp=${cpage+1}&ps=${pagesize}">다음</a>
						</c:if>
					</td>
					<td colspan="2" align="center">총 게시물 수 : ${totalcount}
					</td>
				</tr>
			</table>
			
			</div>
			<div class="row">
				<div class="col-md-12 text-center to-animate">
					<p>* Demo images from <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
				</div>
			</div>
		</div>
	</section>

	


	
	<%
		pageContext.include("../../include/footer.jsp");
	%>
	
	
	<%
		pageContext.include("../../include/script.jsp");
	%>
	
	<script>
		$(function(){
			//fadeinout();
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
		});
	</script>
	<!-- End demo purposes only -->

	</body>
</html>


 
 
