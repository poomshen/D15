<!-- 
 * @Class : Board_View.jsp
 * @Date : 2016.10.5
 * @Author : 조한솔
 * @Desc : Q&A 게시판에서 상세보기 하는 view
 -->

<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%
//String sFilePath = sDownLoadPath + "\\" + filename;
%>

<c:set var="board" value="${boarddto}"/>

<html>

<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <style>
 .deleteBtn{}
 </style>
 <script type="text/javascript">
 
 var b_no=${board.b_no};

		$(function(){
			
		 	$('#listBtn').click(function(){
		 		location.href="/TeamProject3_D15/D15/BoardList.Board?name=qna";
		 	});
		 	
		 	$('#dBtn').click(function(){
		 		
		 		$( "#dialog-confirm" ).dialog({
	 			      resizable: false,
	 			      height: "auto",
	 			      width: 400,
	 			      modal: true,
	 			      buttons: {
	 			        "삭제": function() {
	 			          $( this ).dialog( "close" );
	 			          
	 			          location.href = "BoardDelete.Board?name=qna&num=${board.b_no}";
	 			          alert("삭제 완료");
	 			        },
	 			        "취소": function() {
	 			          $( this ).dialog( "close" );
	 			          
	 			        }
	 			      }
	 			    });
		 	//location.href="BoardDelete.Board?name=qna&num=${board.b_no}"
			});
		 	
		 	$('#mBtn').click(function(){
		 		location.href="BoardModify.Board?name=qna&num=${board.b_no}"
			});
		 	
		 	$('#rBtn').click(function(){
		 	location.href="BoardReplyView.Board?name=qna&num=${board.b_no}"
			});
		
			$.ajax({
				type:"post",
				url:"Board/replylist.jsp",
				data:{"b_no":b_no},
				dataType:"json",
				success:function(data){
					console.log(data);
					var str="";
					$.each(data, function(index, items){
						str+="<table class='table table-hover'>";
						str+="<tr><th class='text-left'>작성자</th><th class='text-left' colspan=2>댓글</th><th/>";
						str+="<th>작성일</th></tr>"
						str+="<tr>"
						str+="<td>"+items.m_id+"</td>";
						str+="<td class='text-left' colspan=2>"+items.re_content+"</td>";
						if (items.m_id==${sessionScope.memberdto.m_id}){
							str+="<td><input type='button' id='deleteBtn"+items.re_no+"' class='btn btn-default' onclick='deleteReply("+items.re_no+", "+b_no+")' value='삭제'></td>";							
						}
						str+="<td>"+items.re_date+"</td></tr>"
						str+="</table><br>";
									
						
					});
					$('#reply').append(str);
				},
					
			});
		
			
			$('#btn').click(function(){
				$.ajax({
					type:"post",
					url:"/TeamProject3_D15/D15/ReplyService.Board",
					data:{
						"b_no":b_no,
						"re_content":$('#re_content').val()
						},
					
					success:function(data){
						console.log(data);
						console.log("데이터는 들어온게 없는데 성공이라네??");
					},
					
					error:function(xhr){
						
					}
					
				});	
								
				$.ajax({
					type:"post",
					url:"Board/replyadd.jsp",
					data:{
						"b_no":b_no
					},
					dataType:"json",
					success:function(data){	
						
						var str="";
						var value=data.re_no;
						//console.log(value);
					
				
						
						str+="<table class='table table-hover'>";
						str+="<tr><th class='text-left'>작성자</th><th class='text-left' colspan=2>댓글</th><th/>";
						str+="<th>작성일</th></tr>"
						str+="<tr>"
						str+="<td>"+data.m_id+"</td>";
						str+="<td class='text-left' colspan=2>"+data.re_content+"</td>";
						str+="<td><input type='button' id='deleteBtn"+value+"' class='btn btn-default' value='삭제' onclick='deleteReply("+data.re_no+", "+b_no+")'></td>"
						str+="<td>"+data.re_date+"</td></tr>"
						str+="</table><br>";
									
						
						
						
						$('#reply').append(str);
					},
					error:function(){
						
					}
				});
		
			});
			

		});	
		
		function deleteReply(re_no, b_no){
			
			$.ajax({
				type:"post",
				url:"Board/Board_Reply_Delete.jsp",
				
				data:{
						"re_no":re_no,
						"b_no":b_no
					 },
				dataType:"json",
				success:function(data){
					$('#reply').empty();
					var str="";
					$.each(data, function(index, items){
						str+="<table class='table table-bordered'>";
						str+="<th>작성자</th><td>"+items.m_id+"</td>";
						str+="<th>작성일</th><td>"+items.re_date+"</td></tr>";
						str+="<th>댓글</th><td>"+items.re_content+"<span style='float:right'>"+
						"<td><input type='button' id='deleteBtn"+items.re_no+"' class='btn btn-default' value='삭제' onclick='deleteReply("+items.re_no+", "+b_no+")'></td>"+
						"</span></td></tr>";
						str+="</table><br>";
					});
					$('#reply').append(str);				
				
				
			});
		}
 </script>
 <style type="text/css">
	table {
		width: 750px;
	}
	
	#wrap{
		margin-top:100px;
		margin-bottom:80px;
	}
	</style>
 
 <title>게시판</title>
</head>

<body>
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>
<section id = "wrap">
	<div class="container">
		<h3>게시글보기</h3>
		<br/>
		
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
 				<th>${board.b_name}</th>
				<th>${board.m_id}</th>
				<th>${board.b_date}</th>
			</tr>
			<tr>
				<td >내용</td>
				<td colspan="4">
					<textarea rows="16" cols="15" class="form-control" readonly="readonly">${board.b_content}</textarea>
				</td>
			</tr>
			<%-- <tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
				<c:if test="${requestScope.boarddto.getB_file() != null}">
				<td><a href="FileDown.jsp?file_name=${board.b_file}"></a>
					${board.b_file}
				<td/>
				</c:if>
				
			</tr> --%>
		</table>
		<br/>
		<div id="reply">
			<!-- 여기에서 reply들을 표시 -->
		</div>
		<div id="tableDiv">
	   <%-- <form action="ReplyService.Board?name=qna&num=${board.b_no}" method="POST" class="form-horizontal"> --%>
<!-- 			<form action="" method="POST" class="form-horizontal"> -->
			<table class="table table-bordered">
				<tr>
					<td>댓글</td>
					<td colspan="4">
						<textarea rows="4" cols="15" name="re_content" 
						id="re_content" class="form-control"></textarea>
					</td>
				</tr>				
				<tr>
					<td><input type="hidden" name="b_no" id="b_no" value="${board.b_no}"/></td>
					<td colspan="4">
						<span style='float:right'>
							<button class="btn btn-default" id="btn">등록</button>						
						</span>
					</td>
				
				</tr> 
				
			</table>
		<!-- </form> -->
		<div id="addDiv"></div>
		</div>	
		<div class="text-right">
			
			<tr>
			<td>
				<input type="button" id="rBtn" class="btn btn-default" value="답글">
			</td>

			
			<td>
				<c:if test="${board.m_id==sessionScope.memberdto.m_id}">
					<input type="button" id="mBtn" class="btn btn-default" value="수정">
				</c:if>
			</td>

			<td>
				<c:if test="${board.m_id==sessionScope.memberdto.m_id}">
					<input type="button" id="dBtn" class="btn btn-default" value="삭제">	
				</c:if>
			</td>
			
			<td>
	   			<input type="button" id="listBtn" class="btn btn-default" value="목록">
			</td>
			</tr>
			
		</div>
	</div>
</section>
<div id="dialog-confirm" title="삭제" style = "display:none;">
  <p><span class="ui-icon ui-icon-alert" style="float:left; margin:3px 12px 20px 0;"></span>정말 삭제 하시겠습니까?</p>
</div>
<footer>
	<jsp:include page ="../../include/footer.jsp"/>
</footer>
</body>
</html>