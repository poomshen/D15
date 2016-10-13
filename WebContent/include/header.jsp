<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <style>
.navbar {
   background-color: white;
   border: 0px;
}

#rowdiv {
   background-color: white;
}

#rowdiv a {
   
}

.logo {
   font-size: 18px;
}
</style> -->
<c:set var="dto" value="${sessionScope.memberdto }" />
<script>
/*    //header라 일부러 js 사용
   window.onload=function(){
      console.log("${dto}");
      if("${dto}"==""){
         document.getElementById("protect").setAttribute("href", "#");
         document.getElementById("protect").onclick=function(){
            alert('회원 가입 후 이용해 주세요');
         }
         
      } else {
         document.getElementById("protect").setAttribute("href", "/TeamProject3_D15/D15/ProtectOut/ProtectOut.ProtectOut");
      }
   } */
</script>

   <!-- 상단고정된 navbar 시작 -->
   <nav id="MainNav" class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll" row="4">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="/TeamProject3_D15/index.jsp">
                <img
                     src="/TeamProject3_D15/images/logo.gif" style="max-height: 40px; margin-left: 30px;"></a>
            </div>   
      
         
         <!-- Logo이미지 크기지정, 하나row로 묶음(줄바꿈) 끝 -->

         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
               <!-- <li class="active"><a href="#">Home</a></li> -->
               <li class="dropdown"><a class="dropdown-toggle"
                  data-toggle="dropdown" href="#">소개(x)<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="/TeamProject3_D15/introduce.jsp">홈페이지소개</a></li>
                     <li><a href="#">창단멤버(x)</a></li>
                     <li><a href="#">찾아오시는길(x)</a></li>
                  </ul></li>
                  
               <li class="dropdown"><a class="dropdown-toggle"
                  data-toggle="dropdown" href="#">현황(x)<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="#">유기견 신고 수(x)</a></li>
                     <li><a href="#">각 보호소 위치(x)</a></li>
                  </ul></li>
                  
               <li><a id="protect"
                  href="/TeamProject3_D15/D15/ProtectOut/ProtectOut.ProtectOut">분양
                     및 임시보호</a></li>
                     
               <li><a href="/TeamProject3_D15/D15/Missing/BoardList.missing">실종신고</a></li>
               
               <li class="dropdown"><a class="dropdown-toggle"
                  data-toggle="dropdown" href="#">게시판(x)<span class="caret"></span></a>
                  <ul class="dropdown-menu">
                     <li><a href="#">재회성공담&분양후기(x)</a></li>
                     <li><a href="/TeamProject3_D15/D15/BoardList.Board?name=qna">Q&A</a></li>
                  </ul></li>
                  
               <li><a
                  href="/TeamProject3_D15/D15/NoticeList.Notice?name=notice">공지사항</a></li>
                  
            </ul>
            <ul class="nav navbar-nav navbar-right">
            	<c:choose>
            		<c:when test="${dto.m_id=='admin'}">
            			어드민 메뉴
            		</c:when>
            		<c:when test="${dto.m_id!=null}">
            			<li><span
                     		class="glyphicon glyphicon-user"></span>${dto.m_id}</li>
                     	<li><span  class="glyphicon glyphicon-envelope logo" style="text-align:right; float:left; color: green; "id="message_new">
                        </span></li>
                     	<script type="text/javascript">
	                        $(function(){
	                        	myTimer();
	                        	var myVar = setInterval(function(){ myTimer() }, 10000);
	                        
		                        function myTimer(){
		                           $.get("myMessgeNew.New", {"m_no":${memberdto.m_no}}, function(data, textStatus, req) {
		                              if(data != 0){
		                                 document.getElementById("message_new").innerHTML = data;
		                              }
		                           })
		                        }
	                        });
                        </script>

                        <li><a href="/TeamProject3_D15/D15/Login/Logout.login"><span
                           class="glyphicon glyphicon-off logo">로그아웃</span></a></li>
                    
                        <li><a href="/TeamProject3_D15/D15/Login/Mypage.login"><span
                           class="glyphicon glyphicon-lock logo">마이페이지</span></a></li>
                        
            		</c:when>
            		<c:otherwise>
            			<li><a href="/TeamProject3_D15/D15/Login/RegisterPer.login"><span
                     		class="glyphicon glyphicon-user"></span>회원가입</a></li>
                     
			            <li><a href="/TeamProject3_D15/D15/Login/Login.login"><span
            	        	class="glyphicon glyphicon-log-in"></span>로그인</a></li>
            		</c:otherwise>
            	</c:choose>
            </ul>
            
         </div>
      </div>
   </nav>
   <!-- 상단고정된 navbar 끝 -->