<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html style = "margin-bottom : 40px; margin-top:100px">
<head>
<meta charset="UTF-8">
<title>내 받은 쪽지함</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js" ></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
   <style>
   .navbar-custom{
       background: #ffffff;
   }
   
   .navbar-custom .navbar-nav li a, header {
    color: #3f95ea;
   
   </style>   
 
	
	<style>
		form > input {
			color: black;
		}
	</style>
	<script type="text/javascript">
	$(function(){
		$(".message_out").hide();
		})
	function Tremove(mes_no){
		$.post("MessageRemoveT.Message", {"mes_no":mes_no}, function(data, textStatus, req) {
			if(data == 'Y'){
				alert("성공");
			}else{
				alert("실패");
			}
		})
		window.location.reload();
	}
	function indetail(mes_no){
		$.post("MessagedDetail.Message", {"mes_no":mes_no }, function(data, textStatus, req) {
			 console.log(data);
		})
		
	}
	function isclose(){
		window.location.reload();
	}
	function ismessage(){
			$("#mes_content").removeAttr("readonly");
			$("#mes_content").html(" ");
			$(".message_in").hide();
			$(".message_out").show();
		
	}
	function outmessage(m_id){
			//console.log($("#mes_content").val());
		 $.post("insertMessage.Message", {"m_id":m_id,"mes_content":$("#mes_content").val()}, function(data, textStatus, req) {
			if(data == 1){
				alert(m_id+"님에게 메세지 전송 성공");
				isclose();
			}else{
				alert(m_id+"님에게 메시지 전송 실패");
				isclose();
			}
		})
	}

	</script>
<body>
	<%
		pageContext.include("../../include/header.jsp");
	%>
	<div class="container">
	<h3>받은 쪽지함</h3>
	<br><br>
	<ul class="nav nav-tabs">
  		<li role="presentation" ><a href="/TeamProject3_D15/D15/Login/Mypage.login">회원정보</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus.login">분양</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/MypageStatus2.login">임시보호</a></li>
  		<li role="presentation" class="active"><a href="/TeamProject3_D15/D15/Login/myTakeMessagelist.Message">받은 쪽지함</a></li>
  		<li role="presentation"><a href="/TeamProject3_D15/D15/Login/myMakeMessagelist.Message">보낸 쪽지함</a></li>
	</ul>
	</div>
	
	<div class = "col-sm-2"></div>
	<div class = "col-sm-1">
	
	<ul class="nav nav-pills nav-stacked" style="width:98%">
  		<li role="presentation"><a href="myTakeMessagelist.Message">전체 쪽지</a></li>
  		<li role="presentation"><a href="myTakeNoMessagelist.Message">안 읽은 쪽지</a></li>
	</ul>

	</div>				
		<div class = "col-sm-6">
	
<table  class="table table-hover"  style="width: 100%">
<tr><th>보낸이</th><th>글내용</th><th>보낸날짜</th><th>읽음여부</th><th>삭제</th></tr>
<c:forEach var="list" items="${messagelist}">
<tr><td>${list.m_id }</td>
<td><a onclick="indetail(${list.mes_no })" href="#" data-toggle="modal" 	data-target="#myModal${list.mes_send }" >${list.mes_content }</a></td>
<td>${list.mes_date}</td>
<!-- 읽음 안읽음 표시  -->
     	<c:set var="check" value="${list.mes_check }"/>
     	<td>
     	<c:choose >
     	<c:when test="${fn:trim(check) == 'N'}" ><a class="btn btn-primary disabled""><span class="glyphicon glyphicon-remove"></span>안읽음</a> </c:when>
     	<c:when test="${fn:trim(check) == 'Y'}"><a class="btn btn-success disabled""><span class="glyphicon glyphicon-ok"></span>읽음</a></c:when>
     	<c:when test="${fn:trim(check) == 'W' }"><a class="btn btn-warning disabled"><span class="glyphicon glyphicon-remove"></span>안읽음</a></c:when>
     	<c:when test="${fn:trim(check) == 'M' }"><a class="btn btn-warning disabled"><span class="glyphicon glyphicon-ok"></span>읽음</a></c:when>
     	</c:choose>
     	</td>
<td>
<a  onclick="Tremove(${list.mes_no})" class="btn btn-danger  ">
<span class="glyphicon glyphicon-trash"></span> 쪽지 제거</a>
</td>
</tr>
</c:forEach>
</table>

</div>
<div class = "col-sm-3"></div>	

	<footer>
		<jsp:include page="../../include/footer.jsp"></jsp:include>
	</footer>
	
	<c:forEach var="list" items="${messagelist}">
<div class="modal fade" id="myModal${list.mes_send }" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" onclick="isclose()" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">메세지 보내기</h4>
				</div>
					<div class="modal-body">
						<div style="width: 47%; float: left;">
						<input class="form-control" type="text" placeholder="수신자:${sessionScope.memberdto.m_id}"  value="${list.m_id }" name="m_id" id="m_id" readonly="readonly"> 
						</div>
						<div style="width: 47%; float: right ;">
						<input class="form-control" type="text"  placeholder="발신자:${list.m_id}" value=" ${sessionScope.memberdto.m_id }" readonly="readonly" name="m_send" id="m_send"> 
						</div>
						<br>
						<textarea style="margin-top: 10%;" class="form-control" rows="5" cols="30"  readonly="readonly" name="mes_content" id="mes_content">${list.mes_content }</textarea>
					</div>
					<div class="modal-footer">
						<button type="button" onclick="ismessage()"  class="btn btn-default message_in" >답장하기</button> 
						<button type="button" onclick="outmessage('${list.m_id}')"  class="btn btn-default message_out" data-dismiss="modal">보내기</button> 
						<button type="button" onclick="isclose()" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
			</div>
		</div>
	</div>
</c:forEach>

</body>
</html>