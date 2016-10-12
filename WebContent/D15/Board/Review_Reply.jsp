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
	</script>
</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<body>
	<!-- 게시판 답변 -->
<!--  -->
<form action="ReviewReplyService.Review" method="post" name="boardform">
<input type="hidden" name="BR_NO" value="<%=review.getBr_no() %>">
<input type="hidden" name="BR_REF" value="<%=review.getBr_ref() %>">
<input type="hidden" name="BR_DEPTH" value="<%=review.getBr_depth() %>">
<input type="hidden" name="BR_STEP" value="<%=review.getBr_step() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">답변 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">ID</div>
		</td>
		<td>
			<input name="M_ID" type="text"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="BR_NAME" type="text" size="50" 
				maxlength="100" value="Re: <%=review.getBr_name() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="BR_CONTENT"  cols="67" rows="15"></textarea>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
		<a href="javascript:replyboard()">[등록]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 답변 -->
<br>
<hr>
<%= Content.replaceAll("\r\n", "<br>") %>
<hr>
</body>
</html>