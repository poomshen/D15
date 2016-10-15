<!-- 
 * @Class : ParcelSuccess.jsp
 * @Date : 2016.10.12
 * @Author : 이성준
 * @Desc : 분양 신청에 성공시 띄워지는 view
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		alert("@@@@@@실행에 성공 하셨습니다@@@@@@")
		location.href="/TeamProject3_D15/D15/Login/MypageStatus.login"
	})
</script>