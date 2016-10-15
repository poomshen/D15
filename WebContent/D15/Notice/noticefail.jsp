<!-- 
 * @Class : noticefail.jsp
 * @Date : 2016.10.12
 * @Author : 박문수
 * @Desc : 공지사항 동록 실패시 띄워주는 view
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("공지사항이 등록에 실패 하였습니다..");
		location.href = "NoticeList.notice";
	});
</script>
