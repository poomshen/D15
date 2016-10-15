<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<<<<<<< HEAD
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
=======
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
 $(function(){
	 $("#basic").submit();
 })
</script>
</head>
<body>
<form id="basic" action="abandonmentPublic.keyurl" method="post">
<% 
Calendar sysdate = Calendar.getInstance();
Calendar sysdate2 = Calendar.getInstance();
java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
sysdate2.add(sysdate.DATE, -15);
DecimalFormat df = new DecimalFormat("00");
String strYear   = Integer.toString(sysdate2.get(Calendar.YEAR));
String strMonth  = df.format(sysdate2.get(Calendar.MONTH) + 1);
String strDay   = df.format(sysdate2.get(Calendar.DATE));
String strDate = strYear + strMonth + strDay;
%>
<input type="hidden" name="bgnde" value="<%= strDate%>">
<input type="hidden" name="endde" value="<%=  formatter.format(sysdate.getTime()) %>">
<input type="hidden" name="upkind" value="417000">
<input type="hidden" name="pageNo" value="1">
<input type="hidden" name="numOfRows" value="9">
<input type="hidden" name="kind">
<input type="hidden" name="upr_cd">
<input type="hidden" name="org_cd">
<input type="hidden" name="care_reg_no">
<input type="hidden" name="state">
</form>
>>>>>>> bccf6296fb832d51c785abfc546fa2fc07f6edfc
</body>

</html>