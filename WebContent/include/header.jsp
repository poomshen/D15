<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 <style>
  	.navbar{
  		background-color:white;
  		border: 0px;
  	}

	#rowdiv{
		background-color: white;
	}

	#rowdiv a{
	}

	.logo{
		font-size : 18px;
	}

  	</style>
<nav class="navbar navbar-default">
	<div class="container-fluid">
  		<div class="row" style="background:white">
	  		<div class="col-sm-4">
	  	 		<div class="navbar-header">
	      			<a class="navbar-brand" style="height:110px" href="/TeamProject3_D15/index.jsp"><img src="/TeamProject3_D15/images/logo.gif"></a>
	    		</div>
	    	</div>
    	</div>
    
    	<div class="row" id="rowdiv">
 			<div class="col-sm-4">
    			<ul class="nav navbar-nav">
      				<li><a href="/TeamProject3_D15/introduce.jsp">소개</a></li>
      				<li><a href="/TeamProject3_D15/status.jsp">현황</a></li>
      				<li><a href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.ProtectOut">분양 및 임시보호</a></li>
      				<li><a href="/TeamProject3_D15/D15/Missing/BoardList.missing">실종신고</a></li>
      				<li><a href="#">게시판</a></li>
    			</ul>
    		</div>
    		<div class="col-sm-3"></div>
   			<div class="col-sm-5">
   					<c:choose>
                      			<c:when test="${sessionScope.memberdto != null}">
                      				<div class="row">
                      				
                      					<div class="col-sm-1"></div>
                      					<div class="col-sm-4">
                      						<span class="glyphicon glyphicon-user logo">${memberdto.m_id}</span>
                      					</div>
                      					<div class="col-sm-3">
                      						<a href = "/TeamProject3_D15/D15/Login/Logout.login">
                      						<span class="glyphicon glyphicon-off logo">로그아웃</span>
                      						</a>
                      					</div>
                      					<div class="col-sm-3">
                      						<a href = "/TeamProject3_D15/D15/Login/Mypage.login">
                      						<span class="glyphicon glyphicon-lock logo">마이페이지</span>
 											</a>
                      					</div>	
                      					<div class="col-sm-1">
                      					</div>	
                      				</div>	
                      			</c:when>
                      			<c:otherwise>
                      				<div class="row">
                      					<div class="col-sm-4"></div>
                      					<div class="col-sm-3">
                      						<a href = "/TeamProject3_D15/D15/Login/Login.login">
                      						<span class="glyphicon glyphicon-off logo">로그인</span>
											</a>
                      					</div>
                      					<div class="col-sm-3">
                      						<a href = "/TeamProject3_D15/D15/Login/RegisterPer.login">
                      						<span class="glyphicon glyphicon-plus logo">회원가입</span>
                      						</a>
                      					</div>	
                      					<div class="col-sm-2">
                      					</div>	
                      				</div>
                      			</c:otherwise>
                      </c:choose>
   			</div>
   		 
   
    	</div>
    	
  	</div>
</nav>