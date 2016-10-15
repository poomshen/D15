<!-- 
 * @Class : noticesuccess.jsp
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : 공지사항 게시판 등록 성공시 view
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("공지사항이 등록 되었습니다.");
		location.href = "NoticeList.notice";
		
	});
</script>
