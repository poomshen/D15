<%@page import="com.d15.DTO.Review_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Review_DTO review = (Review_DTO)request.getAttribute("reviewdata");
%>

<html>
<head>
	<title>게시판 수정</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 게시판 수정 -->
<form action="ReviewModifyService.Review" method="post" name="modifyform">
<input type="hidden" name="BR_NO" value=<%=review.getBr_no() %>>
<table>
	<tr align="center" valign="middle">
		<td colspan="5">게시판 수정</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="BR_NAME" size="50" maxlength="100" 
				value="<%=review.getBr_name()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="BR_CONTENT" cols="67" rows="15"><%=review.getBr_content() %></textarea>
		</td>
	</tr>
	<%if(!(review.getBr_file()==null)){ %>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			&nbsp;&nbsp;<%=review.getBr_file() %>
		</td>
	</tr>
	<%} %>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 수정 -->
</body>
</html>