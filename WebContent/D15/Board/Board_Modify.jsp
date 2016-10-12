<%@page import="com.d15.DTO.Board_DTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%
	Board_DTO board = (Board_DTO)request.getAttribute("boarddata");
%>

<html>
<head>
	<title>게시판 수정</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
</head>

<body>
<!-- 게시판 수정 -->
<form action="BoardModifyService.Board" method="post" name="modifyform">
<input type="hidden" name="B_NO" value=<%=board.getB_no() %>>
<table>
	<tr align="center" valign="middle">
		<td colspan="5">게시판 수정</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="B_NAME" size="50" maxlength="100" 
				value="<%=board.getB_name()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="B_CONTENT" cols="67" rows="15"><%=board.getB_content() %></textarea>
		</td>
	</tr>
	<%if(!(board.getB_file()==null)){ %>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			&nbsp;&nbsp;<%=board.getB_file() %>
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