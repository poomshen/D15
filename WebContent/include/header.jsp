<%@page import="com.d15.DTO.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<header role="banner" id="fh5co-header">
		<div class="container">
		    <nav class="navbar navbar-default">
		        
		       	<div class="row">
		       		<div class="navbar-header" style="float:left">
		       			<!-- Mobile Toggle Menu Button -->
						<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		       			<a class="navbar-brand" href="/TeamProject3_D15/index.jsp"><img style="margin-top:-20px" src="/TeamProject3_D15/images/logo.gif"></a>
		       		</div>
		       		<div id="loginarea" style="float:right;margin-right:10%;margin-top:13px">
		       		<%
						String str="";
						Member_DTO memberdto = (Member_DTO)session.getAttribute("memberdto");
						if (memberdto!=null){
							str+=memberdto.getM_id()+"님 로그인 ";
							out.print("<form action='/TeamProject3_D15/D15/Login/Logout.login' method='post'>");
							out.print(str+"<input type='submit' value='로그아웃'>&nbsp&nbsp<a href='/TeamProject3_D15/D15/Login/Mypage.login'>[마이페이지]</a>");
							out.print("</form>");
						} else {
							out.print("<form action='/TeamProject3_D15/D15/Login/Login.login' method='post'>");
							out.print("<input type='submit' value='로그인'>");
							out.print("</form>");
						}
					%>
		       		</div>
		       	</div>
		        <div class="navbar-collapse collapse">
		        	<ul class="nav navbar-nav navbar-right">
		           		<li class="active"><a href="#" data-nav-section="home"><span>홈으로</span></a></li>
			           	<li><a href="#" data-nav-section="work"><span>소개</span></a></li>
		           		<li><a href="#" data-nav-section="testimonials"><span>공지사항</span></a></li>
		           		<li><a href="#" data-nav-section="services"><span>현황</span></a></li>
		           		<li><a href="#" data-nav-section="about"><span>분양/임시보호</span></a></li>
		           		<li><a href="/TeamProject3_D15/D15/Missing/BoardList.missing" data-nav-section="contact"><span>실종신고</span></a></li>
		           		<li><a href="#" data-nav-section="contact"><span>게시판</span></a></li>
		        	</ul>
		        </div>
			</nav>
		</div>
	</header>
