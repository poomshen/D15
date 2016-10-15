<!-- 
 * @Class : ProtectFail.jsp
 * @Date : 2016.10.12
 * @Author : 이성준
 * @Desc :  분양 및 임시보호 신청에 실패시 띄워지는 view
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("!!등록에 실패 하셨습니다!!")
		location.href="../../index.jsp"
	})
</script>