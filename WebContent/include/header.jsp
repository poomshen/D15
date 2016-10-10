<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.d15.DTO.Member_DTO"%>

<body id = "page-top">
 <!-- Navigation -->
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/TeamProject3_D15/index.jsp"><img style="margin-top:-20px" src="/TeamProject3_D15/images/logo.gif"></a>  
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top">Home</a>
                    </li>
                    <li class="">
                        <a href="#">소개</a>
                    </li>
                    <li class="">
                        <a href="#">공지사항</a>
                    </li>
                    <li class="">
                        <a href="#">현황</a>
                    </li>
                    <li class="">
                        <a href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.keyurl">분양/임시보호</a>
                    </li>
                    <li class="">
                        <a href="/TeamProject3_D15/D15/Missing/BoardList.missing">실종</a>
                    </li>
                    <li class="">
                        <a href="#">게시판</a>
                    </li>
                    <li class="">
                       <a>
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
                       </a>                        
                    </li>                      
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>   
