<%@page import="com.d15.DTO.Member_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- [지율주석] head include -->
<% 
	pageContext.include("include/team01_head.jsp");
%>
<body id="page-top" class="index">

<!-- [지율주석] Navigation include 위치 기억 잘 할것! body 안에 써줘야한다!! -->
<% 
	pageContext.include("include/team01_nav.jsp");
%>

    <!-- [지율주석] 'header'를 div로 바꾸고, 클래스명 줌 team01content -->
    <team01content>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="images/mew.png" alt="사랑하는김뮤">
                    <div class="intro-text">
                        <span class="name">입양하세요. 사랑하세요.</span>
                        <hr class="star-light">
                        <span class="skills">Team01 프로젝트의 메인입니다.</span>
                    </div>
                </div>
            </div>
        </div>
    </team01content>

<!-- [지율주석] Footer include -->
<% 
	pageContext.include("include/team01_footer.jsp");
%>
    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>
    
    <!-- [지율주석] script include -->
<% 
	pageContext.include("include/team01_script.jsp");
%>
</body>

</html>