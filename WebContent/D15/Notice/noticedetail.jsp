<!-- 
 * @Class : noticedetail.jsp
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : 공지사항 게시판 상세보기 view
 -->

<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
//String sFilePath = sDownLoadPath + "\\" + filename;
%>

<c:set var="noticedto" value="${requestScope.noticedto}"/>
<c:set var="nowPage" value = "${requestScope.page}"/>

<html style = "margin-bottom:100px;margin-top:100px">
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon"  href="/TeamProject3_D15/images/favicon.ico">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
 <title>게시판</title>
 <script type="text/javascript">
 	$(function(){
 		$("#update").click(function(){
 			location.href = "NoticeUpdateGo.notice?no=${noticedto.notice_no}&page=${nowPage}";
 		});
 		$("#delete").click(function(){
 			$( "#dialog-confirm" ).dialog({
 			      resizable: false,
 			      height: "auto",
 			      width: 400,
 			      modal: true,
 			      buttons: {
 			        "삭제": function() {
 			          $( this ).dialog( "close" );
 			          
 			          location.href = "NoticeDelete.notice?no=${noticedto.notice_no}";
 			          alert("삭제 완료");
 			        },
 			        "취소": function() {
 			          $( this ).dialog( "close" );
 			          
 			        }
 			      }
 			    });
 			//location.href = "noticedelete.jsp?no=${noticedto.notice_no}";
 		});
 		
 		$("#list").click(function(){
 			location.href = "NoticeList.notice?page=${nowPage}";
 		});
 	});
 </script>
 
 
 
</head>

<body>
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>

<section>
	<div class="container">
		<h3>공 지 사 항</h3>
		<br/>
		<!-- 게시판 수정 -->
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
 				<th>${noticedto.notice_name}</th>
				<th>관리자</th>
				<th>${noticedto.notice_date}</th>
			</tr>
			<tr>
				<td >내용</td>
				<td colspan="4">
					<textarea rows="16" cols="15" class="form-control" readonly="readonly">${noticedto.notice_content}</textarea>
				</td>
			</tr>
		</table>
		<br/>
		<c:if test = "${sessionScope.memberdto.m_id == 'admin' }">
			<input type = "button" class = "btn btn-default" value = "수정" id = "update">
			<input type = "button" class = "btn btn-default" value = "삭제" id = "delete">
		</c:if>
		<input type = "button" class = "btn btn-default" value = "목록으로" id = "list">

		</div>
		
</section>
<div id="dialog-confirm" title="삭제" style = "display:none;">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:3px 12px 20px 0;"></span>정말 삭제 하시겠습니까?</p>
</div>


<footer>
	<jsp:include page = "../../include/footer.jsp"/>
</footer>
</body>
</html>