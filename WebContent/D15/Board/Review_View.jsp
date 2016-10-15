<!-- 
 * @Class : Review_View.jsp
 * @Date : 2016.10.11
 * @Author : 조한솔
 * @Desc : 후기 게시판에서 상세보기 하는 view
 -->

<%@page import="com.d15.DTO.Review_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<!-- //String sFilePath = sDownLoadPath + "\\" + filename; -->

<c:set var="review" value="${reviewdto}"/>


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
 <style>
 .deleteBtn{}
 </style>
 <script type="text/javascript">
 var br_no=${review.br_no};
	$(function(){
		
	 	$('#listBtn').click(function(){
	 		location.href="/TeamProject3_D15/D15/ReviewList.Review?name=review";
	 	});
	 	
	 	$('#dBtn').click(function(){
	 		location.href="ReviewDelete.Review?name=review&num=${review.br_no}";
	 	});
	 	
	 	$('#mBtn').click(function(){
	 		location.href="ReviewModify.Review?name=review&num=${review.br_no}";
	 	});
	 	
	 	$('#rBtn').click(function(){
		 	location.href="ReviewReplyView.Review?name=review&num=${review.br_no}" 		
	 	});
	 	
		$.ajax({
			type:"post",
			url:"Board/Review_replylist.jsp",
			data:{"br_no":br_no},
			dataType:"json",
			success:function(data){
				console.log(data);
				var str="";
				$.each(data, function(index, items){
					
					str+="<table class='table table-hover'>";
					str+="<tr><th class='text-left'>작성자</th><th class='text-left' colspan=2>댓글</th><th/>";
					str+="<th>작성일</th></tr>"
					str+="<tr>"
					str+="<td>"+items.m_no+"</td>";
					str+="<td class='text-left' colspan=2>"+items.rer_content+"</td>";
					str+="<td><input type='button' id='deleteBtn"+items.rer_no+"' class='btn btn-default' onclick='deleteReply("+items.rer_no+","+br_no+")' value='삭제'></td>"
					str+="<td>"+items.rer_date+"</td></tr>"
					str+="</table><br>";
				});
				$('#reply').append(str);
			},
			error:function(xhr){
				alert(xhr.status);
			}		
		});
		
		
		$('#btn').click(function(){
			$.ajax({
				type:"post",
				url:"/TeamProject3_D15/D15/ReplyReview_Service.Review",
				data:{
					"br_no":br_no,
					"rer_content":$('#rer_content').val()
					},
				
				success:function(data){
					console.log(data);
				},
				
				error:function(xhr){
					
				}
				
			});	
							
			$.ajax({
				type:"post",
				url:"Board/Review_replyadd.jsp",
				data:{
					"br_no":br_no
				},
				dataType:"json",
				success:function(data){	
					console.log(data);
					var str="";
					var value=data.rer_no;
					//console.log(value);
/* 					
					str+="<table class='table'>";
					str+="<th>작성자</th>"+data.m_no+"</td>";
					str+="<th>작성일</th>"+data.rer_date+"</td></tr>";
					str+="<th>댓글</th>"+data.rer_content+"<span style='float:right'>"+"</td></tr>";
					str+="<tr><br><td>"+
					"<input type='button' id='deleteBtn"+value+"' class='btn btn-default' value='삭제' onclick='deleteReply("+data.rer_no+", "+br_no+")' value='삭제'></td>"+
					"</span></td></tr>";
					str+="</table><br>"; */
					
					str+="<table class='table table-hover'>";
					str+="<tr><th class='text-left'>작성자</th><th class='text-left' colspan=2>댓글</th><th/>";
					str+="<th>작성일</th></tr>"
					str+="<tr>"
					str+="<td>"+data.m_no+"</td>";
					str+="<td class='text-left' colspan=2>"+data.rer_content+"</td>";
					str+="<td><input type='button' id='deleteBtn"+value+"' class='btn btn-default' value='삭제' onclick='deleteReply("+data.rer_no+", "+br_no+")'></td>"
					str+="<td>"+data.rer_date+"</td></tr>"
					str+="</table><br>";
					
					$('#reply').append(str);
				},
				error:function(){
					
				}
			});
	
		});
		

	});	
	
	function deleteReply(rer_no, br_no){
		
		$.ajax({
			type:"post",
			url:"Board/Review_Reply_Delete.jsp",
			
			data:{
					"rer_no":rer_no,
					"br_no":br_no
				 },
			dataType:"json",
			success:function(data){
				$('#reply').empty();
				var str="";
				console.log(data);
				$.each(data, function(index, items){
				/* 	str+="<table class='table'>";
					str+="<th>작성자</th><td>"+items.m_no+"</td>";
					str+="<th>작성일</th><td>"+items.rer_date+"</td></tr>";
					str+="<th>댓글</th><td>"+items.rer_content+"<span style='float:right'>"+
					"<td><input type='button' id='deleteBtn"+items.rer_no+"' class='btn btn-default' value='삭제' onclick='deleteReply("+items.rer_no+","+br_no+")'></td>"+
					"</span></td></tr>";
					str+="</table><br>"; */
				});
				//$('#reply').append(str);
			},error:function(xhr){
				console.log(xhr);
			}
			
		});
			history.go(0);
	}
	 </script>
	 <style type="text/css">
		table {
			width: 750px;
		}
		</style>
	 


<title>상세 페이지</title>
</head>
<body>
<header>
	<jsp:include page="../../include/header.jsp"/>
</header>
<br/><br/>
<section>
	<div class="container">
		<h3>게시글보기</h3>
		<br/>
		
		<table class="table table-bordered">
			<tr>
				<th>제목</th>
 				<th>${review.br_name}</th>
				<th>아이디 들어옴</th>
				<th>${review.br_date}</th>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="4">
					<textarea rows="16" cols="15" class="form-control" readonly="readonly">${review.br_content}</textarea>
				</td>
			</tr>
			<%-- <tr>
				<td>첨부파일</td>
				<td colspan="3"></td>
				<c:if test="${requestScope.reviewdto.br_file!= null}">
				<td><a href="FileDown.jsp?file_name=${review.br_file}"></a>
					${review.br_file}
				<td/>
				</c:if>
				
			</tr> --%>
		</table>
		<br/>
		<div id="reply">
			<!-- 여기에서 reply들을 표시 -->
		</div>
		<div id="tableDiv">	<table class="table table-bordered">
				<tr>
					<td>댓글</td>
					<td colspan="4">
						<textarea rows="4" cols="15" name="rer_content" id="rer_content" class="form-control"></textarea>
					</td>
				</tr>
				<tr>
					<td><input type="hidden"  name="br_no" value="${review.br_no}"/></td>
					<td colspan="4">
						<span style='float:right'>
							<input type="submit" id="btn" class="btn btn-default" value="등록 "/></td>
						</span>
				</tr>
				
			</table>
			<div class="text-right">
					<td>
						<input type="button" id="rBtn" class="btn btn-default" value="답글">
					</td>

					<td>
						<input type="button" id="mBtn" class="btn btn-default" value="수정">
					</td>

					
					<td colspan="5">
						<input type="button" id="dBtn" class="btn btn-default" value="삭제">
					</td>
					
									
					<td colspan="5">
			   			<input type="button" id="listBtn" class="btn btn-default" value="목록">
					</td>
					
			</div>
		</form>
	</div>
</section>
</body>
</html>