<%@page import="com.d15.DTO.Review_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Review_DTO review =(Review_DTO)request.getAttribute("reviewdto");
	String reply=null;
	if(request.getAttribute("reply")!=null){
		reply=(String)request.getAttribute("reply");
	}
    String Content = review.getBr_content();
%>

<html>
<head>
	<title>답변 게시판</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
	}
	
	$(function(){
		
		$('#').click(function(){
			location.href="";
		});
		
	});
	
	</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<body>
<header>
	<jsp:include page="../../include/header.jsp"></jsp:include>
</header>

<br/><br/>
<div class="container">
	<h3>답변 게시판</h3>
	<hr/>
	<!-- 게시판 답변 -->
<!--  -->
<form action="ReviewReplyService.Review" method="post" name="boardform" class="form-horizontal">
<input type="hidden" name="BR_NO" value="<%=review.getBr_no() %>">
<input type="hidden" name="BR_REF" value="<%=review.getBr_ref() %>">
<input type="hidden" name="BR_DEPTH" value="<%=review.getBr_depth() %>">
<input type="hidden" name="BR_STEP" value="<%=review.getBr_step() %>">
	
	 <div class="form-group">
  		<label class="control-label col-sm-2" for="title">제목</label>
	    	<div class="col-sm-4">
	     		 <input type="text" name="BR_NAME" maxlength="100" class="form-control" id="title" value="[Re]: <%=review.getBr_name() %>"/>
	    	</div>
	  </div>

	
	 <div class="form-group">
  		<label class="control-label col-sm-2" for="M_ID">글쓴이</label>
	     <div class="col-sm-4">
	      <input type="text" name="M_ID" class="form-control" value="테스트글쓴이" id="M_ID" readonly="readonly">
	     </div>
	   </div>

	<div class="form-group">
	   	<label class="control-label col-sm-2" for="email">내용</label>
		 <div class="col-sm-8">
			<textarea rows="10" name="BR_CONTENT" id="email" class="form-control"></textarea>
	     </div>
		</div>

	 <div>
	 	<input type="button" id="reg" value="등록"/>
	 	<input type="button" id="back" value="뒤로"/>	 
	 </div>
	

</form>
</div>
<br>
<hr>
<h4>원본 게시글</h4>
<%= Content.replaceAll("\r\n", "<br>") %>
<hr>
</body>
</html>