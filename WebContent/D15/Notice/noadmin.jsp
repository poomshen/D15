<!-- 
 * @Class : noadmin.jsp
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : 공지사항 게시판 view
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("관리자만 글을 등록 할 수 있습니다.");
		location.href = "NoticeList.notice";
		
	});
</script>
