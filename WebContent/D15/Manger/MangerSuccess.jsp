<!-- 
 * @Class : ManagerSuccess.jsp
 * @Date : 2016.10.12
 * @Author : 이성준
 * @Desc : 관리자가 승인시 띄우지는 view
 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("승인 하셨습니다.");
		location.href="MemberSearch.Manger";
	})
</script>